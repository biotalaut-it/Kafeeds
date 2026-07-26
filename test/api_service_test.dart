import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:kaspium_wallet/kaspa/api/api_client.dart';
import 'package:kaspium_wallet/kaspa/api/api_service.dart';
import 'package:kaspium_wallet/kaspa/api/json_client.dart';

const kAddress =
    'kaspa:qp0qnczz5jc8vpujuyqrjw5eey73paqfgxks7505pqdz9eqwmwftxg44gu00z';
const kBaseUrl = 'https://api.kaspa.org';

Map<String, Object?> _apiTx(String id, int blockTime) => {
  'subnetwork_id': '0000000000000000000000000000000000000000',
  'transaction_id': id,
  'hash': 'hash-$id',
  'mass': '3154',
  'block_hash': ['block-$id'],
  'block_time': blockTime,
  'is_accepted': true,
  'accepting_block_hash': 'accepting-$id',
  'accepting_block_blue_score': 490458384,
  'inputs': [],
  'outputs': [],
};

class FakeApi {
  final requests = <http.Request>[];
  final List<http.Response> Function(http.Request request) handler;

  FakeApi(this.handler);

  late final service = ApiService(
    ApiClient(
      JsonClient(
        kBaseUrl,
        minRequestGap: Duration.zero,
        client: MockClient((request) async {
          requests.add(request);
          return handler(request).removeAt(0);
        }),
      ),
    ),
  );

  Uri get lastUri => requests.last.url;
  Map<String, String> get lastQuery => lastUri.queryParameters;
}

FakeApi _respondWith(List<http.Response> responses) {
  final queue = [...responses];
  return FakeApi((_) => queue);
}

http.Response _page(
  List<Map<String, Object?>> txs, {
  int? nextBefore,
  int? nextAfter,
}) => http.Response(
  json.encode(txs),
  200,
  headers: {
    'content-type': 'application/json',
    if (nextBefore != null) 'x-next-page-before': '$nextBefore',
    if (nextAfter != null) 'x-next-page-after': '$nextAfter',
  },
);

const kRealPageEntry = '''
{
  "subnetwork_id": "0000000000000000000000000000000000000000",
  "transaction_id": "3f73ea4984c502be7856bfae4917a042629ab719c4423372e827af02a7918273",
  "hash": "75bfecbad7c6ec2554c3cb9db12bafa7704010d3e6ca3102702b517b08fc4cd0",
  "mass": "3154",
  "payload": null,
  "block_hash": ["ec7a236ade89a49f75e624ff80f68d43dafab84dbb98d4c0d7d53e1d23f7f912"],
  "block_time": 1784657631347,
  "version": 0,
  "is_accepted": true,
  "accepting_block_hash": "8e5b4f458458571f1b7af08e634da190089c00db8fbfefff3cd099887d7dc6f9",
  "accepting_block_blue_score": 490458384,
  "accepting_block_time": 1784657631786,
  "inputs": [
    {
      "transaction_id": "3f73ea4984c502be7856bfae4917a042629ab719c4423372e827af02a7918273",
      "index": 0,
      "previous_outpoint_hash": "756a6ded71b7b3493294b9a83b841ce9f67a28275c0e9c217f06311f860b371b",
      "previous_outpoint_index": "1",
      "previous_outpoint_address": "kaspa:qpvtxyhfm0x63y97g2ktamen5ngpdmjwpslcf92quu5x5e5ag3uezpj2gt9km",
      "previous_outpoint_amount": 490105015341,
      "signature_script": "sig",
      "sig_op_count": "1",
      "compute_budget": null,
      "covenant_id": null
    }
  ],
  "outputs": [
    {
      "transaction_id": "3f73ea4984c502be7856bfae4917a042629ab719c4423372e827af02a7918273",
      "index": 0,
      "amount": 10000000,
      "script_public_key": "206168e24508eadde4cec7251f6fb19ed4ff52eb513a3ec4c6b556ee276cf59aafac",
      "script_public_key_address": "kaspa:qpsk3cj9pr4dmexwcuj37ma3nm2075ht2yara3xxk4twufmv7kd27vpczqyjd",
      "script_public_key_type": "pubkey",
      "covenant_authorizing_input": null,
      "covenant_id": null
    }
  ]
}
''';

void main() {
  group('getTxsPageForAddress', () {
    test('parses a real api payload', () async {
      final api = _respondWith([
        http.Response(
          '[$kRealPageEntry]',
          200,
          headers: {
            'content-type': 'application/json',
            'x-next-page-before': '1784657631347',
          },
        ),
      ]);

      final page = await api.service.getTxsPageForAddress(kAddress);
      final tx = page.txs.single;

      expect(
        tx.transactionId,
        '3f73ea4984c502be7856bfae4917a042629ab719c4423372e827af02a7918273',
      );
      expect(tx.blockTime, 1784657631347);
      expect(tx.isAccepted, isTrue);
      expect(tx.acceptingBlockBlueScore, 490458384);
      expect(
        tx.inputs.single.previousOutpointAddress,
        'kaspa:qpvtxyhfm0x63y97g2ktamen5ngpdmjwpslcf92quu5x5e5ag3uezpj2gt9km',
      );
      expect(tx.inputs.single.previousOutpointAmount, 490105015341);
      expect(
        tx.outputs.single.scriptPublicKeyAddress,
        'kaspa:qpsk3cj9pr4dmexwcuj37ma3nm2075ht2yara3xxk4twufmv7kd27vpczqyjd',
      );
      expect(tx.outputs.single.amount, 10000000);
      expect(page.nextBefore, 1784657631347);
    });

    test('omits before and after when not given', () async {
      final api = _respondWith([_page([])]);

      await api.service.getTxsPageForAddress(kAddress);

      expect(api.lastQuery.containsKey('before'), isFalse);
      expect(api.lastQuery.containsKey('after'), isFalse);
      expect(api.lastQuery['limit'], '500');
      expect(api.lastQuery['resolve_previous_outpoints'], 'light');
      expect(api.lastUri.path, '/addresses/$kAddress/full-transactions-page');
    });

    test('sends before on its own', () async {
      final api = _respondWith([_page([])]);

      await api.service.getTxsPageForAddress(
        kAddress,
        limit: 50,
        before: 1784389028181,
      );

      expect(api.lastQuery['before'], '1784389028181');
      expect(api.lastQuery.containsKey('after'), isFalse);
      expect(api.lastQuery['limit'], '50');
    });

    test('sends after on its own', () async {
      final api = _respondWith([_page([])]);

      await api.service.getTxsPageForAddress(kAddress, after: 1772543921441);

      expect(api.lastQuery['after'], '1772543921441');
      expect(api.lastQuery.containsKey('before'), isFalse);
    });

    test('refuses to send both cursors', () async {
      final api = _respondWith([_page([])]);

      expect(
        () => api.service.getTxsPageForAddress(
          kAddress,
          before: 1784389028181,
          after: 1772543921441,
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    test('parses transactions and both cursor headers', () async {
      final api = _respondWith([
        _page(
          [_apiTx('aaa', 1784657631347), _apiTx('bbb', 1784389028181)],
          nextBefore: 1784389028181,
          nextAfter: 1784657631347,
        ),
      ]);

      final page = await api.service.getTxsPageForAddress(kAddress);

      expect(page.txs.map((tx) => tx.transactionId), ['aaa', 'bbb']);
      expect(page.txs.first.blockTime, 1784657631347);
      expect(page.nextBefore, 1784389028181);
      expect(page.nextAfter, 1784657631347);
      expect(page.isNotEmpty, isTrue);
    });

    test('an empty page has no cursors', () async {
      final api = _respondWith([_page([])]);

      final page = await api.service.getTxsPageForAddress(kAddress);

      expect(page.isEmpty, isTrue);
      expect(page.nextBefore, isNull);
      expect(page.nextAfter, isNull);
    });

    test('a short page still reports its cursor', () async {
      final api = _respondWith([
        _page([_apiTx('aaa', 1784657631347)], nextBefore: 1784657631347),
      ]);

      final page = await api.service.getTxsPageForAddress(kAddress, limit: 500);

      expect(page.txs, hasLength(1));
      expect(page.nextBefore, 1784657631347);
    });
  });

  group('getTxIdPageForAddress', () {
    test('parses a real api payload', () async {
      final api = _respondWith([
        http.Response(
          '[{"transaction_id":"3f73ea4984c502be7856bfae4917a042629ab719c442337'
          '2e827af02a7918273","block_time":1784657631347}]',
          200,
          headers: {
            'content-type': 'application/json',
            'x-next-page-before': '1782836905775',
          },
        ),
      ]);

      final page = await api.service.getTxIdPageForAddress(kAddress);

      expect(
        page.ids.single.transactionId,
        '3f73ea4984c502be7856bfae4917a042629ab719c4423372e827af02a7918273',
      );
      expect(page.ids.single.blockTime, 1784657631347);
      expect(page.nextBefore, 1782836905775);
      expect(page.blockTimes, [1784657631347]);
    });

    test('asks for ids only and resolves nothing', () async {
      final api = _respondWith([_page([])]);

      await api.service.getTxIdPageForAddress(kAddress);

      expect(api.lastQuery['fields'], 'transaction_id,block_time');
      expect(api.lastQuery['resolve_previous_outpoints'], 'no');
      expect(api.lastQuery['limit'], '500');
      expect(api.lastQuery.containsKey('before'), isFalse);
      expect(api.lastQuery.containsKey('after'), isFalse);
      expect(api.lastUri.path, '/addresses/$kAddress/full-transactions-page');
    });

    test('sends the cursor it is given', () async {
      final api = _respondWith([_page([]), _page([])]);

      await api.service.getTxIdPageForAddress(
        kAddress,
        limit: 50,
        before: 1784389028181,
      );

      expect(api.lastQuery['before'], '1784389028181');
      expect(api.lastQuery.containsKey('after'), isFalse);
      expect(api.lastQuery['limit'], '50');

      await api.service.getTxIdPageForAddress(kAddress, after: 1772543921441);

      expect(api.lastQuery['after'], '1772543921441');
      expect(api.lastQuery.containsKey('before'), isFalse);
    });

    test('the last page has no cursor', () async {
      final api = _respondWith([
        _page([
          {'transaction_id': 'aaa', 'block_time': 1784657631347},
        ]),
      ]);

      final page = await api.service.getTxIdPageForAddress(kAddress);

      expect(page.ids.single.transactionId, 'aaa');
      expect(page.isNotEmpty, isTrue);
      expect(page.nextBefore, isNull);
    });

    test('rejects a page with a missing block time', () async {
      final api = _respondWith([
        _page([
          {'transaction_id': 'aaa', 'block_time': null},
        ], nextBefore: 1784657631347),
      ]);

      expect(
        () => api.service.getTxIdPageForAddress(kAddress),
        throwsA(isA<TypeError>()),
      );
    });

    test('an empty page has no ids and no cursors', () async {
      final api = _respondWith([_page([])]);

      final page = await api.service.getTxIdPageForAddress(kAddress);

      expect(page.isEmpty, isTrue);
      expect(page.blockTimes, isEmpty);
      expect(page.nextBefore, isNull);
      expect(page.nextAfter, isNull);
    });
  });

  group('getTxsWithIds', () {
    test('asks for every id in one request up to the batch size', () async {
      final ids = List.generate(500, (i) => 'tx$i');
      final api = FakeApi(
        (_) => [
          http.Response('[]', 200, headers: {
            'content-type': 'application/json',
          }),
        ],
      );

      await api.service.getTxsWithIds(ids);

      expect(api.requests, hasLength(1));
      final body = json.decode(api.requests.single.body) as Map<String, Object?>;
      expect((body['transactionIds'] as List), hasLength(500));
      expect(api.lastQuery['resolve_previous_outpoints'], 'light');
    });

    test('splits anything larger', () async {
      final ids = List.generate(1200, (i) => 'tx$i');
      final api = FakeApi(
        (_) => [
          http.Response('[]', 200, headers: {
            'content-type': 'application/json',
          }),
        ],
      );

      await api.service.getTxsWithIds(ids);

      final batchSizes = api.requests
          .map((r) => (json.decode(r.body)['transactionIds'] as List).length)
          .toList();
      expect(batchSizes, [500, 500, 200]);
    });
  });

  group('checkActive', () {
    test('parses active, inactive and lastTxBlockTime', () async {
      final api = _respondWith([
        http.Response(
          json.encode([
            {
              'address': kAddress,
              'active': true,
              'lastTxBlockTime': 1784657631347,
            },
            {'address': 'kaspa:unused', 'active': false, 'lastTxBlockTime': null},
          ]),
          200,
          headers: {'content-type': 'application/json'},
        ),
      ]);

      final result = await api.service.checkActive(
        addresses: [kAddress, 'kaspa:unused'],
      );

      expect(result, hasLength(2));
      expect(result.first.active, isTrue);
      expect(result.first.lastTxBlockTime, 1784657631347);
      expect(result.last.active, isFalse);
      expect(result.last.lastTxBlockTime, isNull);
    });

    test('splits into batches of 100 and keeps every result', () async {
      final addresses = List.generate(250, (i) => 'kaspa:address$i');
      final api = FakeApi((request) {
        final body = json.decode(request.body) as Map<String, Object?>;
        final batch = (body['addresses'] as List).cast<String>();
        return [
          http.Response(
            json.encode([
              for (final address in batch)
                {'address': address, 'active': false},
            ]),
            200,
            headers: {'content-type': 'application/json'},
          ),
        ];
      });

      final result = await api.service.checkActive(addresses: addresses);

      expect(api.requests, hasLength(3));
      final batchSizes = api.requests
          .map((r) => (json.decode(r.body)['addresses'] as List).length)
          .toList();
      expect(batchSizes, [100, 100, 50]);
      expect(result.map((a) => a.address), addresses);
    });

    test('makes no request for no addresses', () async {
      final api = _respondWith([]);

      final result = await api.service.checkActive(addresses: const []);

      expect(result, isEmpty);
      expect(api.requests, isEmpty);
    });
  });
}
