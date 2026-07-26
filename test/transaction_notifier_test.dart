import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:kaspium_wallet/database/boxes.dart';
import 'package:kaspium_wallet/database/json_type_adapter.dart';
import 'package:kaspium_wallet/kaspa/kaspa.dart';
import 'package:kaspium_wallet/transactions/transaction_notifier.dart';
import 'package:kaspium_wallet/transactions/transaction_types.dart';
import 'package:kaspium_wallet/transactions/tx_cache_service.dart';
import 'package:kaspium_wallet/transactions/tx_sync/address_tx_sync_store.dart';
import 'package:kaspium_wallet/transactions/tx_sync/tx_sync_types.dart';

import 'fake_kaspa_api.dart';

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
    tempDir = await Directory.systemTemp.createTemp('tx_notifier_test');
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

  TransactionNotifier notifierFor(FakeKaspaApi api) {
    cache.api = api.service;
    return TransactionNotifier(
      cache: cache,
      syncStore: store,
      addressGap: .zero,
    );
  }

  test('a freshly imported wallet ends up with a populated list', () async {
    final api = FakeKaspaApi({
      kAddressA: [500, 400, 300],
      kAddressB: [450],
    });
    final notifier = notifierFor(api);

    final active = await notifier.refreshWalletTxs([kAddressA, kAddressB]);
    await notifier.syncer.drain();

    expect(active, unorderedEquals([kAddressA, kAddressB]));
    expect(cache.txCount, 4);
    expect(notifier.loadedTxs, isNotEmpty);
    expect(notifier.loadedTxs.length, 4);
  });

  test('loaded transactions are newest first across addresses', () async {
    final api = FakeKaspaApi({
      kAddressA: [500, 300],
      kAddressB: [450, 350],
    });
    final notifier = notifierFor(api);

    await notifier.refreshWalletTxs([kAddressA, kAddressB]);
    await notifier.syncer.drain();

    expect(
      notifier.loadedTxs.map((tx) => tx.apiTx.blockTime),
      [500, 450, 350, 300],
    );
  });

  test('a second refresh with nothing new does no page fetches', () async {
    final api = FakeKaspaApi({
      kAddressA: [500, 400],
    });
    final notifier = notifierFor(api);

    await notifier.refreshWalletTxs([kAddressA]);
    await notifier.syncer.drain();
    final afterFirst = api.requests.length;

    await notifier.refreshWalletTxs([kAddressA]);
    await notifier.syncer.drain();

    expect(api.requests.length, afterFirst);
    expect(api.activeChecks, 2);
    expect(cache.txCount, 2);
  });

  test('picks up transactions that land between refreshes', () async {
    final api = FakeKaspaApi({
      kAddressA: [500, 400],
    });
    final notifier = notifierFor(api);
    await notifier.refreshWalletTxs([kAddressA]);
    await notifier.syncer.drain();

    api.history[kAddressA] = [600, 500, 400];
    await notifier.refreshWalletTxs([kAddressA]);
    await notifier.syncer.drain();

    expect(cache.txCount, 3);
    expect(notifier.loadedTxs.first.apiTx.blockTime, 600);
  });

  test('history below the loaded list does not rebuild it', () async {
    final api = FakeKaspaApi({
      kAddressA: [for (var i = 0; i < 12; i++) 1000 - i * 10],
    });
    cache.api = api.service;
    final notifier = TransactionNotifier(
      cache: cache,
      syncStore: store,
      pageSize: 4,
    );

    var rebuilds = 0;
    Object? previous = notifier.loadedTxs;
    notifier.addListener(() {
      if (!identical(notifier.loadedTxs, previous)) {
        rebuilds += 1;
        previous = notifier.loadedTxs;
      }
    });

    await notifier.refreshWalletTxs([kAddressA]);
    await notifier.syncer.drain();

    expect(cache.txCount, 12);
    expect(rebuilds, 1);
    expect(notifier.loadedTxs, hasLength(4));
    expect(notifier.hasMore, isTrue);
  });

  group('load counts', () {
    Future<void> indexHistory(FakeKaspaApi api, String address) async {
      cache.api = api.service;
      final page = await api.service.getTxIdPageForAddress(address, limit: 500);
      await cache.addWalletTxIds(page.ids);
      api.bodyRequests.clear();
    }

    test('the displayed list loads a page of ten', () async {
      final api = FakeKaspaApi({
        kAddressA: [for (var i = 0; i < 50; i++) 1000 - i * 10],
      });
      await indexHistory(api, kAddressA);
      final notifier = TransactionNotifier(cache: cache, syncStore: store);

      await notifier.loadMore();

      expect(notifier.loadedTxs, hasLength(TransactionNotifier.kLoadCount));
      expect(api.bodyRequests.single, hasLength(10));
    });

    test('a report pulls the rest of the history in one pass', () async {
      final api = FakeKaspaApi({
        kAddressA: [for (var i = 0; i < 110; i++) 100000 - i * 10],
      });
      await indexHistory(api, kAddressA);
      final notifier = TransactionNotifier(cache: cache, syncStore: store);
      await notifier.loadMore();
      api.bodyRequests.clear();

      while (notifier.hasMore) {
        await notifier.loadMore(TransactionNotifier.kBulkLoadCount);
      }

      expect(notifier.loadedTxs, hasLength(110));
      expect(api.bodyRequests, hasLength(1));
      expect(api.bodyRequests.single, hasLength(100));
    });
  });

  test('reports sync progress and settles back to idle', () async {
    final api = FakeKaspaApi({
      kAddressA: [500],
      kAddressB: [400],
    });
    final notifier = notifierFor(api);
    final progressSeen = <TxSyncProgress>[];
    notifier.addListener(() => progressSeen.add(notifier.syncProgress));

    await notifier.refreshWalletTxs([kAddressA, kAddressB]);
    await notifier.syncer.drain();

    expect(progressSeen.any((p) => p.isSyncing), isTrue);
    expect(notifier.syncProgress, TxSyncProgress.idle);
  });

  test('paging the list while a sync writes to it stays consistent', () async {
    final api = FakeKaspaApi({
      kAddressA: [for (var i = 0; i < 15; i++) 1000 - i * 10],
      kAddressB: [for (var i = 0; i < 15; i++) 995 - i * 10],
    });
    final notifier = notifierFor(api);

    final syncing = notifier.refreshWalletTxs([kAddressA, kAddressB]);
    final paging = Future.wait([
      notifier.loadMore(5),
      notifier.loadMore(5),
      notifier.loadMore(5),
    ]);
    await Future.wait([syncing, paging]);
    await notifier.syncer.drain();
    while (notifier.hasMore) {
      await notifier.loadMore(10);
    }

    final ids = notifier.loadedTxs.map((tx) => tx.id).toList();
    expect(cache.txCount, 30);
    expect(ids, hasLength(30));
    expect(ids.toSet(), hasLength(30), reason: 'no duplicates');
    final blockTimes = notifier.loadedTxs
        .map((tx) => tx.apiTx.blockTime)
        .toList();
    expect(
      blockTimes,
      List.of(blockTimes)..sort((a, b) => b.compareTo(a)),
      reason: 'newest first',
    );
  });

  group('concurrent loads', () {
    Future<TransactionNotifier> notifierOver(FakeKaspaApi api) async {
      cache.api = api.service;
      final page = await api.service.getTxIdPageForAddress(
        kAddressA,
        limit: 500,
      );
      await cache.addWalletTxIds(page.ids);
      return notifierFor(api);
    }

    test('a reload asked for while the list is paging still runs', () async {
      final api = FakeKaspaApi({
        kAddressA: [for (var i = 0; i < 30; i++) 1000 - i * 10],
      });
      final notifier = await notifierOver(api);
      await notifier.loadMore(5);

      api.history[kAddressA]!.insert(0, 1010);
      final paging = notifier.loadMore(5);
      final caching = cache.addWalletTxIds([
        ApiTxId(transactionId: txId(kAddressA, 1010), blockTime: 1010),
      ]);
      final reloading = notifier.reload();
      await Future.wait([paging, caching, reloading]);

      expect(notifier.loadedTxs.first.apiTx.blockTime, 1010);
    });

    test('paging to the end does not spin against a reload', () async {
      final api = FakeKaspaApi({
        kAddressA: [for (var i = 0; i < 30; i++) 1000 - i * 10],
      });
      final notifier = await notifierOver(api);

      final reloading = notifier.reload();
      var passes = 0;
      while (notifier.hasMore) {
        expect(passes++, lessThan(10), reason: 'a pass loaded nothing');
        await notifier.loadMore(10);
      }
      await reloading;

      expect(notifier.loadedTxs, hasLength(30));
    });

    test('a transaction arriving during a rebuild is not lost', () async {
      final api = FakeKaspaApi({
        kAddressA: [for (var i = 0; i < 10; i++) 1000 - i * 10],
      });
      final notifier = await notifierOver(api);
      await notifier.loadMore();

      api.history[kAddressA]!.insert(0, 1010);
      final arrived = await api.service.getTxsWithIds([
        txId(kAddressA, 1010),
      ]);

      final reloading = notifier.reload();
      final adding = notifier.addWalletTx(arrived.single);
      await Future.wait([reloading, adding]);

      final ids = notifier.loadedTxs.map((tx) => tx.id).toList();
      expect(notifier.loadedTxs.first.apiTx.blockTime, 1010);
      expect(ids.toSet(), hasLength(ids.length), reason: 'no duplicates');
    });
  });

  test('overlapping missing-tx checks fetch each id once', () async {
    final api = FakeKaspaApi({
      kAddressA: [500, 400, 300],
    });
    final notifier = notifierFor(api);

    final ids = [for (final bt in [500, 400, 300]) txId(kAddressA, bt)];
    await Future.wait([
      notifier.checkForMissingTxs(ids),
      notifier.checkForMissingTxs(ids),
    ]);

    expect(api.bodyRequests, hasLength(1));
    expect(cache.txCount, 3);
  });

  test('a list load leaves bodies to a fetch already in flight', () async {
    final api = FakeKaspaApi({
      kAddressA: [500, 400, 300],
    });
    api.bodyDelay = const Duration(milliseconds: 20);
    final notifier = notifierFor(api);

    final ids = [for (final bt in [500, 400, 300]) txId(kAddressA, bt)];
    final checking = notifier.checkForMissingTxs(ids);
    await cache.addWalletTxIds([
      for (final bt in [500, 400, 300])
        ApiTxId(transactionId: txId(kAddressA, bt), blockTime: bt),
    ]);
    final loading = notifier.loadMore();
    await Future.wait([checking, loading]);

    expect(api.bodyRequests, hasLength(1));
    expect(cache.txCount, 3);
    expect(notifier.loadedTxs, hasLength(3));
  });

  test('a balance change explained by a node tx fetches nothing', () async {
    final api = FakeKaspaApi({
      kAddressA: [500, 400],
    });
    final notifier = notifierFor(api);
    await notifier.refreshWalletTxs([kAddressA]);
    await notifier.syncer.drain();
    final afterSync = api.requests.length;

    api.history[kAddressA]!.insert(0, 600);
    final arrived = await api.service.getTxsWithIds([txId(kAddressA, 600)]);
    await notifier.addWalletTx(arrived.single);
    notifier.syncer.scheduleFetch([kAddressA]);
    await notifier.syncer.drain();

    expect(api.requests.length, afterSync);

    notifier.syncer.scheduleFetch([kAddressA]);
    await notifier.syncer.drain();

    expect(api.requests.length, afterSync + 1);
  });

  test('a node tx does not excuse an address with no record', () async {
    final api = FakeKaspaApi({
      kAddressA: [500],
    });
    final notifier = notifierFor(api);

    final arrived = await api.service.getTxsWithIds([txId(kAddressA, 500)]);
    await notifier.addWalletTx(arrived.single);
    notifier.syncer.scheduleFetch([kAddressA]);
    await notifier.syncer.drain();

    expect(api.requests, hasLength(1));
    expect(store.get(kAddressA).backfilled, isTrue);
  });

  test('dispose stops the syncer', () async {
    final api = FakeKaspaApi({
      kAddressA: [500, 400, 300, 200],
    });
    final notifier = notifierFor(api);

    final syncing = notifier.refreshWalletTxs([kAddressA]);
    notifier.dispose();
    await syncing;

    expect(notifier.syncer.isSyncing, isFalse);
  });
}
