import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:kaspium_wallet/database/boxes.dart';
import 'package:kaspium_wallet/database/json_type_adapter.dart';
import 'package:kaspium_wallet/kaspa/kaspa.dart';
import 'package:kaspium_wallet/transactions/transaction_types.dart';
import 'package:kaspium_wallet/transactions/tx_cache_service.dart';
import 'package:kaspium_wallet/transactions/tx_sync/address_tx_sync_store.dart';
import 'package:kaspium_wallet/transactions/tx_sync/address_tx_syncer.dart';
import 'package:kaspium_wallet/transactions/tx_sync/tx_sync_types.dart';

import 'fake_kaspa_api.dart';

const kAddressC = 'kaspa:addressC';

int bt(int offset) => 1700000000000 + offset;

void main() {
  late Directory tempDir;
  late Box<TxIndex> txIndexBox;
  late LazyBox<Tx> txBox;
  late Box<AddressTxSync> txSyncBox;
  late TxCacheService cache;
  late AddressTxSyncStore store;

  setUpAll(() {
    Hive.registerAdapter(JsonTypeAdapter(typeId: 3, fromJson: Tx.fromJson));
    Hive.registerAdapter(
      JsonTypeAdapter(typeId: 6, fromJson: TxIndex.fromJson),
    );
    Hive.registerAdapter(
      JsonTypeAdapter(typeId: 8, fromJson: AddressTxSync.fromJson),
    );
  });

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('tx_sync_migration_test');
    Hive.init(tempDir.path);
    txIndexBox = await Hive.openBox<TxIndex>('txIndex');
    txBox = await Hive.openLazyBox<Tx>('tx');
    txSyncBox = await Hive.openBox<AddressTxSync>('txSync');

    cache = TxCacheService(
      txIndexBox: IndexedTypedBox(txIndexBox),
      txBox: LazyTypedBox(txBox),
      log: Logger(level: Level.off),
    );
    store = AddressTxSyncStore(TypedBox(txSyncBox));
  });

  tearDown(() async {
    await Hive.deleteFromDisk();
    await tempDir.delete(recursive: true);
  });

  Future<void> primeCacheFrom(FakeKaspaApi api, {int bodies = 0}) async {
    cache.api = api.service;
    for (final address in api.history.keys) {
      final page = await api.service.getTxIdPageForAddress(address, limit: 500);
      await cache.addWalletTxIds(page.ids);
    }
    if (bodies > 0) {
      await cache.getWalletTxsAfter(count: bodies);
    }
    api.requests.clear();
    api.bodyRequests.clear();
    api.activeRequests.clear();
  }

  AddressTxSyncer syncerFor(FakeKaspaApi api) {
    cache.api = api.service;
    return AddressTxSyncer(
      cache: cache,
      store: store,
      pageSize: 500,
      addressGap: .zero,
    );
  }

  test('an upgraded wallet refetches nothing', () async {
    final api = FakeKaspaApi({
      kAddressA: [for (var i = 0; i < 20; i++) bt(10000 - i * 10)],
      kAddressB: [for (var i = 0; i < 20; i++) bt(9995 - i * 10)],
      kAddressC: [for (var i = 0; i < 20; i++) bt(9990 - i * 10)],
    });
    await primeCacheFrom(api, bodies: 5);
    expect(cache.txCount, 60);
    expect(store.isEmpty, isTrue);

    final syncer = syncerFor(api);
    await syncer.reconcile(api.history.keys);
    await syncer.drain();

    expect(api.requests, isEmpty);
    expect(cache.txCount, 60);
  });

  test('seeds every active address from the index head', () async {
    final api = FakeKaspaApi({
      kAddressA: [bt(500), bt(400), bt(300)],
      kAddressB: [bt(450)],
    });
    await primeCacheFrom(api);

    final syncer = syncerFor(api);
    await syncer.reconcile([kAddressA, kAddressB]);
    await syncer.drain();

    expect(store.get(kAddressA).newestBlockTime, bt(500));
    expect(store.get(kAddressA).backfilled, isTrue);
    expect(store.get(kAddressB).newestBlockTime, bt(500));
    expect(store.get(kAddressB).backfilled, isTrue);
  });

  test('seeds addresses whose bodies were never cached', () async {
    final api = FakeKaspaApi({
      kAddressA: [bt(500), bt(400)],
      kAddressB: [bt(450)],
    });
    await primeCacheFrom(api);
    expect(await txBox.get(txId(kAddressB, bt(450))), isNull);

    final syncer = syncerFor(api);
    await syncer.reconcile([kAddressA, kAddressB]);
    await syncer.drain();

    expect(api.requests, isEmpty);
    expect(store.get(kAddressB).backfilled, isTrue);
  });

  test('keeps no record for an inactive address', () async {
    final api = FakeKaspaApi({
      kAddressA: [bt(500)],
      kAddressB: [],
    });
    await primeCacheFrom(api);

    final syncer = syncerFor(api);
    await syncer.reconcile([kAddressA, kAddressB]);
    await syncer.drain();

    expect(store.records.keys, [kAddressA]);
  });

  test('a seeded wallet still picks up new transactions', () async {
    final api = FakeKaspaApi({
      kAddressA: [bt(500), bt(400)],
    });
    await primeCacheFrom(api);

    final syncer = syncerFor(api);
    await syncer.reconcile([kAddressA]);
    await syncer.drain();
    expect(api.requests, isEmpty);

    api.history[kAddressA] = [bt(600), bt(500), bt(400)];
    await syncer.reconcile([kAddressA], recheck: true);
    await syncer.drain();

    expect(api.cursorsFor(kAddressA).first, (null, bt(500) - 1));
    expect(cache.isWalletTxId(txId(kAddressA, bt(600))), isTrue);
    expect(cache.txCount, 3);
  });

  test('a fresh import is not mistaken for an upgrade', () async {
    final api = FakeKaspaApi({
      kAddressA: [bt(500), bt(400), bt(300)],
    });
    final syncer = syncerFor(api);

    await syncer.reconcile([kAddressA]);
    await syncer.drain();

    expect(cache.txCount, 3);
    expect(api.cursorsFor(kAddressA).first, (null, null));
  });

  test('an index without real block times is not trusted', () async {
    final api = FakeKaspaApi({
      kAddressA: [bt(500), bt(400)],
    });
    cache.api = api.service;
    await cache.addWalletTxIds([
      for (final id in ['old-1', 'old-2'])
        ApiTxId(transactionId: id, blockTime: 0),
    ]);
    expect(cache.newestIndexedBlockTime, lessThan(2));

    final syncer = syncerFor(api);
    await syncer.reconcile([kAddressA]);
    await syncer.drain();

    expect(api.cursorsFor(kAddressA).first, (null, null));
    expect(store.get(kAddressA).backfilled, isTrue);
  });

  test('seeds only once, then leaves the store alone', () async {
    final api = FakeKaspaApi({
      kAddressA: [bt(500), bt(400)],
    });
    await primeCacheFrom(api);

    final syncer = syncerFor(api);
    await syncer.reconcile([kAddressA]);
    await syncer.drain();

    await store.save(store.get(kAddressA).copyWith(newestBlockTime: bt(900)));
    await syncer.reconcile([kAddressA], recheck: true);
    await syncer.drain();

    expect(store.get(kAddressA).newestBlockTime, bt(900));
  });

  test('an address discovered after the seed still backfills', () async {
    final api = FakeKaspaApi({
      kAddressA: [bt(500), bt(400)],
      kAddressB: [bt(450), bt(350)],
    });
    cache.api = api.service;
    final page = await api.service.getTxIdPageForAddress(kAddressA, limit: 500);
    await cache.addWalletTxIds(page.ids);
    api.requests.clear();

    final syncer = syncerFor(api);
    await syncer.reconcile([kAddressA]);
    await syncer.drain();
    expect(api.cursorsFor(kAddressA), isEmpty);

    await syncer.reconcile([kAddressA, kAddressB]);
    await syncer.drain();

    expect(api.cursorsFor(kAddressB).first, (null, null));
    expect(cache.isWalletTxId(txId(kAddressB, bt(350))), isTrue);
  });

  test('an address queued before the seed does not backfill', () async {
    final api = FakeKaspaApi({
      kAddressA: [bt(500), bt(400)],
    });
    await primeCacheFrom(api);
    final syncer = syncerFor(api);

    syncer.scheduleFetch([kAddressA]);
    await syncer.reconcile([kAddressA]);
    await syncer.drain();

    expect(api.cursorsFor(kAddressA), isNot(contains((null, null))));
    expect(cache.txCount, 2);
  });

  test('a failed active check leaves the seed for the next reconcile', () async {
    final api = FakeKaspaApi({
      kAddressA: [bt(500), bt(400)],
    });
    await primeCacheFrom(api);
    final syncer = syncerFor(api);

    api.failActiveCheck = true;
    await syncer.reconcile([kAddressA]);
    await syncer.drain();

    api.failActiveCheck = false;
    await syncer.reconcile([kAddressA]);
    await syncer.drain();

    expect(api.requests, isEmpty);
    expect(store.get(kAddressA).backfilled, isTrue);
    expect(store.get(kAddressA).newestBlockTime, bt(500));
  });

  test('a failed active check releases the queue', () async {
    final api = FakeKaspaApi({
      kAddressA: [bt(500), bt(400)],
    });
    await primeCacheFrom(api);
    api.failActiveCheck = true;
    final syncer = syncerFor(api);

    syncer.scheduleFetch([kAddressA]);
    await syncer.reconcile([kAddressA]);
    await syncer.drain().timeout(const Duration(seconds: 5));

    expect(syncer.isSyncing, isFalse);
    expect(api.requests, isNotEmpty);
  });
}
