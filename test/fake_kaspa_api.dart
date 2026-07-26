import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:kaspium_wallet/kaspa/api/api_client.dart';
import 'package:kaspium_wallet/kaspa/api/api_service.dart';
import 'package:kaspium_wallet/kaspa/api/json_client.dart';
import 'package:retry/retry.dart';

const kAddressA = 'kaspa:addressA';
const kAddressB = 'kaspa:addressB';
const kBaseUrl = 'https://api.kaspa.org';

String txId(String address, int blockTime) => 'tx-$address-$blockTime';

Map<String, Object?> _tx(String address, int blockTime) => {
  'subnetwork_id': '0000000000000000000000000000000000000000',
  'transaction_id': txId(address, blockTime),
  'hash': 'hash-$blockTime',
  'mass': '3154',
  'block_hash': ['block-$blockTime'],
  'block_time': blockTime,
  'version': 0,
  'is_accepted': true,
  'accepting_block_hash': 'accepting-$blockTime',
  'accepting_block_blue_score': blockTime,
  'inputs': [
    {
      'transaction_id': txId(address, blockTime),
      'index': 0,
      'previous_outpoint_hash': 'prev-$blockTime',
      'previous_outpoint_index': '0',
      'previous_outpoint_address': 'kaspa:counterparty',
      'previous_outpoint_amount': 1000,
      'signature_script': 'sig',
      'sig_op_count': '1',
    },
  ],
  'outputs': [
    {
      'transaction_id': txId(address, blockTime),
      'index': 0,
      'amount': 900,
      'script_public_key': 'script',
      'script_public_key_address': address,
      'script_public_key_type': 'pubkey',
    },
  ],
};

class FakeKaspaApi {
  final Map<String, List<int>> history;

  final requests = <Uri>[];

  final bodyRequests = <List<String>>[];

  Duration bodyDelay = Duration.zero;

  final failing = <String>{};

  final activeRequests = <List<String>>[];

  int get activeChecks => activeRequests.length;
  bool failActiveCheck = false;

  bool omitCursorHeaders = false;

  FakeKaspaApi(this.history);

  late final ApiService service = ApiService(
    ApiClient(
      JsonClient(
        kBaseUrl,
        r: const RetryOptions(maxAttempts: 1),
        minRequestGap: .zero,
        client: MockClient(_handle),
      ),
    ),
  );

  Future<http.Response> _handle(http.Request request) async {
    final path = request.url.path;

    if (path == '/addresses/active') {
      final body = json.decode(request.body) as Map<String, Object?>;
      final addresses = (body['addresses'] as List).cast<String>();
      activeRequests.add(addresses);

      if (failActiveCheck) {
        return http.Response('{"detail":"boom"}', 500);
      }
      return _json([
        for (final address in addresses)
          {
            'address': address,
            'active': (history[address] ?? const []).isNotEmpty,
            'lastTxBlockTime': _newest(address),
          },
      ]);
    }

    if (path == '/transactions/search') {
      final body = json.decode(request.body) as Map<String, Object?>;
      final ids = (body['transactionIds'] as List).cast<String>();
      bodyRequests.add(ids);

      if (bodyDelay != Duration.zero) {
        await Future<void>.delayed(bodyDelay);
      }

      final wanted = ids.toSet();
      return _json([
        for (final entry in history.entries)
          for (final blockTime in entry.value)
            if (wanted.contains(txId(entry.key, blockTime)))
              _tx(entry.key, blockTime),
      ]);
    }

    final address = Uri.decodeComponent(path.split('/')[2]);
    requests.add(request.url);

    if (failing.contains(address)) {
      return http.Response('{"detail":"boom"}', 500);
    }

    final query = request.url.queryParameters;
    final before = int.tryParse(query['before'] ?? '');
    final after = int.tryParse(query['after'] ?? '');
    final limit = int.parse(query['limit']!);
    final fields = query['fields']?.split(',');
    final resolve = query['resolve_previous_outpoints'] ?? 'light';

    if (before != null && after != null) {
      return http.Response(
        '{"detail":"Only one of [before, after] can be present"}',
        400,
      );
    }

    final all = [...?history[address]]..sort((a, b) => b.compareTo(a));
    final matching = all
        .where((bt) => before == null || bt < before)
        .where((bt) => after == null || bt > after)
        .toList();

    final page = after != null
        ? matching.sublist(matching.length - min(limit, matching.length))
        : matching.take(limit).toList();

    final hasOlder = page.isNotEmpty && all.any((bt) => bt < page.last);
    final hasNewer = page.isNotEmpty && all.any((bt) => bt > page.first);

    return _json(
      [
        for (final bt in page)
          _project(_tx(address, bt), fields: fields, resolve: resolve),
      ],
      headers: {
        if (hasOlder && !omitCursorHeaders)
          'x-next-page-before': '${page.last}',
        if (hasNewer && !omitCursorHeaders)
          'x-next-page-after': '${page.first}',
      },
    );
  }

  Map<String, Object?> _project(
    Map<String, Object?> tx, {
    List<String>? fields,
    required String resolve,
  }) {
    if (fields != null) {
      return {for (final field in fields) field: tx[field]};
    }
    if (resolve != 'no') {
      return tx;
    }
    return {
      ...tx,
      'inputs': [
        for (final input in tx['inputs'] as List)
          {...input as Map<String, Object?>}
            ..remove('previous_outpoint_address')
            ..remove('previous_outpoint_amount'),
      ],
    };
  }

  int? _newest(String address) {
    final blockTimes = history[address];
    if (blockTimes == null || blockTimes.isEmpty) {
      return null;
    }
    return blockTimes.reduce((a, b) => a > b ? a : b);
  }

  http.Response _json(Object? body, {Map<String, String> headers = const {}}) =>
      http.Response(
        json.encode(body),
        200,
        headers: {
          'content-type': 'application/json',
          ...headers,
        },
      );

  List<(int?, int?)> cursorsFor(String address) => requests
      .where((uri) => uri.path.contains(address))
      .map(
        (uri) => (
          int.tryParse(uri.queryParameters['before'] ?? ''),
          int.tryParse(uri.queryParameters['after'] ?? ''),
        ),
      )
      .toList();
}
