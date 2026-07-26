import 'package:flutter_test/flutter_test.dart';
import 'package:kaspium_wallet/kaspa/kaspa.dart';
import 'package:kaspium_wallet/wallet_address/address_discovery.dart';
import 'package:kaspium_wallet/wallet_address/wallet_address.dart';

import 'fake_kaspa_api.dart';

class FakeAddressGenerator extends HdAddressGenerator {
  @override
  Address get mainAddress => addressFor(.receive, 0);

  @override
  Future<Address> addressAtIndex({
    required int typeIndex,
    required int index,
  }) async => addressFor(AddressType.values[typeIndex], index);

  static Address addressFor(AddressType type, int index) {
    final payload = Uint8List(32);
    payload.buffer.asByteData().setUint32(0, index);
    payload[31] = type.index;
    return Address.publicKey(prefix: .kaspa, publicKey: payload);
  }
}

class FakeRpc implements RpcService {
  final Map<String, int> balances;

  final requests = <List<String>>[];

  bool failing = false;

  FakeRpc([this.balances = const {}]);

  @override
  Future<Iterable<AddressBalance>> getBalancesByAddresses(
    Iterable<String> addresses,
  ) async {
    requests.add(addresses.toList());
    if (failing) {
      throw Exception('boom');
    }
    return [
      for (final address in addresses)
        AddressBalance(
          address: address,
          balance: BigInt.from(balances[address] ?? 0),
        ),
    ];
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  String encoded(AddressType type, int index) =>
      FakeAddressGenerator.addressFor(type, index).encoded;

  ({AddressDiscovery discovery, FakeKaspaApi api, FakeRpc rpc}) discoveryFor({
    List<int> withTxs = const [],
    List<int> withBalance = const [],
    AddressType type = .receive,
  }) {
    final api = FakeKaspaApi({
      for (final index in withTxs) encoded(type, index): [1700000000000],
    });
    final rpc = FakeRpc({
      for (final index in withBalance) encoded(type, index): 1000,
    });
    final discovery = AddressDiscovery(
      api: api.service,
      rpc: rpc,
      addressGenerator: FakeAddressGenerator(),
      addressNameCallback: (type, index) => '$type $index',
    );
    return (discovery: discovery, api: api, rpc: rpc);
  }

  test('an empty wallet is settled in a single batch', () async {
    final w = discoveryFor();

    final result = await w.discovery.addressDiscoveryFor(
      type: .receive,
      startIndex: 0,
    );

    expect(w.api.activeRequests.single, hasLength(AddressDiscovery.kBatchSize));
    expect(w.rpc.requests.single, hasLength(AddressDiscovery.kBatchSize));
    expect(result.addresses, isEmpty);
    expect(result.scanIndexes.scanned, 99);
    expect(result.scanIndexes.last, isNull);
  });

  test('a scan carries on with the node unreachable', () async {
    final w = discoveryFor(withTxs: [3]);
    w.rpc.failing = true;

    final result = await w.discovery.addressDiscoveryFor(
      type: .receive,
      startIndex: 0,
    );

    expect(result.scanIndexes.last, 3);
    expect(result.scanIndexes.scanned, 99);
  });

  test('finds an address beyond the gap the old scan could afford', () async {
    final w = discoveryFor(withTxs: [40]);

    final result = await w.discovery.addressDiscoveryFor(
      type: .receive,
      startIndex: 0,
    );

    expect(result.scanIndexes.last, 40);
    expect(result.addresses[40]?.used, isTrue);
    expect(result.addresses[39]?.used, isFalse);
  });

  test('keeps going while the gap is still open', () async {
    final w = discoveryFor(withTxs: [99]);

    final result = await w.discovery.addressDiscoveryFor(
      type: .receive,
      startIndex: 0,
    );

    expect(w.api.activeChecks, 2);
    expect(result.scanIndexes.scanned, 199);
    expect(result.scanIndexes.last, 99);
  });

  test('the gap closes a gap limit after the last used address', () async {
    const batchSize = AddressDiscovery.kBatchSize;
    const gapLimit = AddressDiscovery.kGapLimit;

    final closed = discoveryFor(withTxs: [batchSize - gapLimit - 1]);
    final open = discoveryFor(withTxs: [batchSize - gapLimit]);

    final closedResult = await closed.discovery.addressDiscoveryFor(
      type: .receive,
      startIndex: 0,
    );
    final openResult = await open.discovery.addressDiscoveryFor(
      type: .receive,
      startIndex: 0,
    );

    expect(closed.api.activeChecks, 1);
    expect(closedResult.scanIndexes.scanned, batchSize - 1);
    expect(open.api.activeChecks, 2);
    expect(openResult.scanIndexes.scanned, 2 * batchSize - 1);
  });

  test('the unused tail is left out of the result', () async {
    final w = discoveryFor(withTxs: [40]);

    final result = await w.discovery.addressDiscoveryFor(
      type: .receive,
      startIndex: 0,
    );

    expect(result.addresses.keys, hasLength(41));
    expect(result.addresses.keys.reduce((a, b) => a > b ? a : b), 40);
  });

  test('a funded address the api has not caught up with is used', () async {
    final w = discoveryFor(withBalance: [99]);

    final result = await w.discovery.addressDiscoveryFor(
      type: .receive,
      startIndex: 0,
    );

    expect(result.addresses[99]?.used, isTrue);
    expect(result.scanIndexes.last, 99);
    expect(result.scanIndexes.scanned, 199);
  });

  test('balances stand in for an unreachable api', () async {
    final w = discoveryFor(withTxs: [3], withBalance: [3]);
    w.api.failActiveCheck = true;

    final result = await w.discovery.addressDiscoveryFor(
      type: .receive,
      startIndex: 0,
    );

    expect(w.rpc.requests, isNotEmpty);
    expect(result.scanIndexes.last, 3);
  });

  test('a scan on balances alone does not stop at a quiet batch', () async {
    final w = discoveryFor(withBalance: [150]);
    w.api.failActiveCheck = true;

    final result = await w.discovery.addressDiscoveryFor(
      type: .receive,
      startIndex: 0,
    );

    expect(result.scanIndexes.last, 150);
    expect(result.scanIndexes.scanned, AddressDiscovery.kMaxScan - 1);
  });

  test('a batch the api missed starts the gap over', () async {
    final w = discoveryFor(withBalance: [10]);
    w.api.failActiveCheck = true;

    final result = await w.discovery.addressDiscoveryFor(
      type: .receive,
      startIndex: 0,
      onProgress: (type, index) {
        w.api.failActiveCheck = index == 0;
        return true;
      },
    );

    expect(result.scanIndexes.scanned, 199);
  });

  test('a scan gives up when neither source answers', () async {
    final w = discoveryFor(withTxs: [3]);
    w.api.failActiveCheck = true;
    w.rpc.failing = true;

    final result = await w.discovery.addressDiscoveryFor(
      type: .receive,
      startIndex: 0,
    );

    expect(result.addresses, isEmpty);
    expect(result.scanIndexes.scanned, isNull);
    expect(result.scanIndexes.last, isNull);
  });

  test('a rescan starts where it was told to', () async {
    final w = discoveryFor(withTxs: [50, 150]);

    final result = await w.discovery.addressDiscoveryFor(
      type: .receive,
      startIndex: 100,
    );

    expect(w.api.activeRequests.first.first, encoded(.receive, 100));
    expect(result.addresses.keys, isNot(contains(50)));
    expect(result.scanIndexes.last, 150);
  });

  test('a scan stops at the ceiling', () async {
    final w = discoveryFor(withTxs: [for (var i = 0; i < 2000; i++) i]);

    final result = await w.discovery.addressDiscoveryFor(
      type: .receive,
      startIndex: 0,
    );

    expect(result.scanIndexes.scanned, AddressDiscovery.kMaxScan - 1);
    expect(result.addresses, hasLength(AddressDiscovery.kMaxScan));
  });

  test('the progress callback can stop a scan', () async {
    final w = discoveryFor(withTxs: [3]);

    final result = await w.discovery.addressDiscoveryFor(
      type: .receive,
      startIndex: 0,
      onProgress: (type, index) => false,
    );

    expect(w.api.activeChecks, 0);
    expect(w.rpc.requests, isEmpty);
    expect(result.addresses, isEmpty);
  });

  test('both chains are scanned', () async {
    final api = FakeKaspaApi({
      encoded(.receive, 2): [1700000000000],
      encoded(.change, 1): [1700000000000],
    });
    final rpc = FakeRpc();
    final discovery = AddressDiscovery(
      api: api.service,
      rpc: rpc,
      addressGenerator: FakeAddressGenerator(),
      addressNameCallback: (type, index) => '$type $index',
    );

    final result = await discovery.addressDiscovery(
      startReceiveIndex: 0,
      startChangeIndex: 0,
    );

    expect(result.receive.scanIndexes.last, 2);
    expect(result.change.scanIndexes.last, 1);
    expect(result.addresses, hasLength(3 + 2));
    expect(result.isNotEmpty, isTrue);
  });

  test('discovery fetches no transactions', () async {
    final w = discoveryFor(withTxs: [3]);

    await w.discovery.addressDiscoveryFor(type: .receive, startIndex: 0);

    expect(w.api.requests, isEmpty);
    expect(w.api.bodyRequests, isEmpty);
  });
}
