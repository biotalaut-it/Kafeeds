import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:kaspium_wallet/database/boxes.dart';
import 'package:kaspium_wallet/database/json_type_adapter.dart';
import 'package:kaspium_wallet/transactions/transaction_types.dart';
import 'package:kaspium_wallet/transactions/tx_cache_service.dart';
import 'package:kaspium_wallet/transactions/tx_sync/address_tx_sync_store.dart';
import 'package:kaspium_wallet/transactions/tx_sync/address_tx_syncer.dart';
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
    tempDir = await Directory.systemTemp.createTemp('tx_syncer_test');
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

  AddressTxSyncer syncerFor(FakeKaspaApi api, {int pageSize = 2}) {
    cache.api = api.service;
    return AddressTxSyncer(
      cache: cache,
      store: store,
      pageSize: pageSize,
      addressGap: .zero,
    );
  }

  group('backfill', () {
    test('pages through the whole history of a new address', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400, 300, 200, 100],
      });
      final syncer = syncerFor(api);

      await syncer.reconcile([kAddressA]);
      await syncer.drain();

      expect(cache.txCount, 5);
      for (final blockTime in [500, 400, 300, 200, 100]) {
        expect(cache.isWalletTxId('tx-$kAddressA-$blockTime'), isTrue);
      }
    });

    test('walks down with before until the cursor runs out', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400, 300, 200, 100],
      });
      final syncer = syncerFor(api);

      await syncer.reconcile([kAddressA]);
      await syncer.drain();

      expect(api.cursorsFor(kAddressA), [
        (null, null),
        (400, null),
        (200, null),
      ]);
    });

    test('asks for ids only and stores no bodies', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400],
      });
      final syncer = syncerFor(api, pageSize: 10);

      await syncer.reconcile([kAddressA]);
      await syncer.drain();

      final query = api.requests.single.queryParameters;
      expect(query['fields'], 'transaction_id,block_time');
      expect(query['resolve_previous_outpoints'], 'no');
      expect(cache.txCount, 2);
      expect(await txBox.get(txId(kAddressA, 500)), isNull);
      expect(api.bodyRequests, isEmpty);
    });

    test('stops on an empty page when the api sends no cursors', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400, 300, 200],
      })..omitCursorHeaders = true;
      final syncer = syncerFor(api);

      await syncer.reconcile([kAddressA]);
      await syncer.drain();

      expect(api.cursorsFor(kAddressA), [
        (null, null),
        (400, null),
        (200, null),
      ]);
      expect(cache.txCount, 4);
      expect(store.get(kAddressA).backfilled, isTrue);
    });

    test('records the newest block time and marks itself done', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400, 300],
      });
      final syncer = syncerFor(api);

      await syncer.reconcile([kAddressA]);
      await syncer.drain();

      final record = store.get(kAddressA);
      expect(record.backfilled, isTrue);
      expect(record.newestBlockTime, 500);
    });

    test('saves progress after every page', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400, 300, 200],
      });
      cache.api = api.service;
      final snapshots = <AddressTxSync>[];
      final syncer = AddressTxSyncer(
        cache: cache,
        store: store,
        pageSize: 2,
        addressGap: .zero,
        onTxsCached: (_) async => snapshots.add(store.get(kAddressA)),
      );

      await syncer.reconcile([kAddressA]);
      await syncer.drain();

      expect(snapshots, hasLength(2));
      expect(snapshots.last.oldestBlockTime, 400);
      expect(snapshots.last.backfilled, isFalse);
    });

    test('falls back to block times when the api omits its cursors', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400, 300, 200, 100],
      })..omitCursorHeaders = true;
      final syncer = syncerFor(api);

      await syncer.reconcile([kAddressA]);
      await syncer.drain();

      expect(api.cursorsFor(kAddressA), [
        (null, null),
        (400, null),
        (200, null),
      ]);
      expect(cache.txCount, 5);
      expect(store.get(kAddressA).backfilled, isTrue);
    });

    test('resumes from the stored cursor instead of starting over', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400, 300, 200, 100],
      });
      await store.save(
        const AddressTxSync(
          address: kAddressA,
          newestBlockTime: 500,
          oldestBlockTime: 400,
        ),
      );
      final syncer = syncerFor(api);

      await syncer.reconcile([kAddressA]);
      await syncer.drain();

      expect(api.cursorsFor(kAddressA).first, (400, null));
      expect(store.get(kAddressA).backfilled, isTrue);
      expect(store.get(kAddressA).newestBlockTime, 500);
    });
  });

  group('fetch forward', () {
    setUp(() async {
      await store.save(
        const AddressTxSync(
          address: kAddressA,
          newestBlockTime: 300,
          backfilled: true,
        ),
      );
    });

    Future<void> refresh(AddressTxSyncer syncer) async {
      await syncer.reconcile([kAddressA], recheck: true);
      await syncer.drain();
    }

    test('asks only for what is newer than the cursor', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400, 300, 200, 100],
      });
      final syncer = syncerFor(api, pageSize: 10);

      await refresh(syncer);

      expect(api.cursorsFor(kAddressA).first, (null, 299));
      expect(cache.isWalletTxId('tx-$kAddressA-500'), isTrue);
      expect(cache.isWalletTxId('tx-$kAddressA-400'), isTrue);
      expect(cache.isWalletTxId('tx-$kAddressA-300'), isTrue);
      expect(cache.isWalletTxId('tx-$kAddressA-200'), isFalse);
      expect(store.get(kAddressA).newestBlockTime, 500);
    });

    test('walks a multi page gap upwards from the cursor', () async {
      final api = FakeKaspaApi({
        kAddressA: [700, 600, 500, 400, 300],
      });
      final syncer = syncerFor(api, pageSize: 2);

      await refresh(syncer);

      expect(api.cursorsFor(kAddressA), [
        (null, 299),
        (null, 400),
        (null, 600),
      ]);
      expect(store.get(kAddressA).newestBlockTime, 700);
      expect(cache.txCount, 5);
    });

    test('saves the cursor as the gap is climbed', () async {
      final api = FakeKaspaApi({
        kAddressA: [700, 600, 500, 400, 300],
      });
      cache.api = api.service;
      final watermarks = <int>[];
      final syncer = AddressTxSyncer(
        cache: cache,
        store: store,
        pageSize: 2,
        addressGap: .zero,
        onTxsCached: (_) async =>
            watermarks.add(store.get(kAddressA).newestBlockTime),
      );

      await refresh(syncer);

      expect(watermarks, [300, 400, 600]);
      expect(store.get(kAddressA).newestBlockTime, 700);
    });

    test('asks for ids only and stores no bodies', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400, 300],
      });
      final syncer = syncerFor(api, pageSize: 10);

      await refresh(syncer);

      final query = api.requests.single.queryParameters;
      expect(query['fields'], 'transaction_id,block_time');
      expect(query['resolve_previous_outpoints'], 'no');
      expect(cache.isWalletTxId(txId(kAddressA, 500)), isTrue);
      expect(await txBox.get(txId(kAddressA, 500)), isNull);
      expect(api.bodyRequests, isEmpty);
    });

    test('does nothing when the api has nothing newer', () async {
      final api = FakeKaspaApi({
        kAddressA: [300, 200, 100],
      });
      final syncer = syncerFor(api);

      await refresh(syncer);

      expect(api.requests, isEmpty);
      expect(cache.txCount, 0);
    });
  });

  group('reconcile', () {
    test('reports active addresses including spent ones', () async {
      final api = FakeKaspaApi({
        kAddressA: [500],
        kAddressB: [],
      });
      final syncer = syncerFor(api);

      final active = await syncer.reconcile([kAddressA, kAddressB]);
      await syncer.drain();

      expect(active, [kAddressA]);
    });

    test('never fetches for an inactive address', () async {
      final api = FakeKaspaApi({kAddressB: []});
      final syncer = syncerFor(api);

      await syncer.reconcile([kAddressB]);
      await syncer.drain();

      expect(api.requests, isEmpty);
      expect(store.isEmpty, isTrue);
    });

    test('asks nothing more once every address has an answer', () async {
      final api = FakeKaspaApi({
        kAddressA: [500],
        kAddressB: [],
      });
      final syncer = syncerFor(api, pageSize: 10);

      await syncer.reconcile([kAddressA, kAddressB]);
      await syncer.drain();
      await syncer.reconcile([kAddressA, kAddressB]);
      await syncer.drain();

      expect(api.activeRequests, [
        [kAddressA, kAddressB],
      ]);
    });

    test('asks only about the addresses that are new to it', () async {
      const addressC = 'kaspa:addressC';
      final api = FakeKaspaApi({
        kAddressA: [500],
        kAddressB: [],
      });
      final syncer = syncerFor(api, pageSize: 10);

      await syncer.reconcile([kAddressA, kAddressB]);
      await syncer.drain();
      await syncer.reconcile([kAddressA, kAddressB, addressC]);
      await syncer.drain();

      expect(api.activeRequests.last, [addressC]);
    });

    test('asks about an unused address again on the next launch', () async {
      final api = FakeKaspaApi({kAddressB: []});
      final syncer = syncerFor(api, pageSize: 10);

      await syncer.reconcile([kAddressB]);
      await syncer.drain();
      final relaunched = syncerFor(api, pageSize: 10);
      await relaunched.reconcile([kAddressB]);
      await relaunched.drain();

      expect(api.activeChecks, 2);
    });

    test('asks again about an address whose sync failed', () async {
      final api = FakeKaspaApi({
        kAddressA: [500],
      })..failing.add(kAddressA);
      final syncer = syncerFor(api, pageSize: 10);

      await syncer.reconcile([kAddressA]);
      await syncer.drain();

      api.failing.clear();
      await syncer.reconcile([kAddressA]);
      await syncer.drain();

      expect(api.activeChecks, 2);
      expect(cache.isWalletTxId('tx-$kAddressA-500'), isTrue);
    });

    test('asks nothing on a launch with every address synced', () async {
      final api = FakeKaspaApi({
        kAddressA: [500],
      });
      final syncer = syncerFor(api, pageSize: 10);

      await syncer.reconcile([kAddressA]);
      await syncer.drain();
      final relaunched = syncerFor(api, pageSize: 10);
      await relaunched.reconcile([kAddressA]);
      await relaunched.drain();

      expect(api.activeChecks, 1);
      expect(api.requests, hasLength(1));
    });

    test('a recheck asks about every address again', () async {
      final api = FakeKaspaApi({
        kAddressA: [500],
      });
      final syncer = syncerFor(api, pageSize: 10);

      await syncer.reconcile([kAddressA]);
      await syncer.drain();

      api.history[kAddressA] = [600, 500];
      await syncer.reconcile([kAddressA], recheck: true);
      await syncer.drain();

      expect(api.activeChecks, 2);
      expect(cache.isWalletTxId('tx-$kAddressA-600'), isTrue);
    });

    test('resumes an unfinished history without asking the api', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400, 300, 200],
      });
      await store.save(
        const AddressTxSync(
          address: kAddressA,
          newestBlockTime: 500,
          oldestBlockTime: 400,
        ),
      );
      final syncer = syncerFor(api, pageSize: 10);

      await syncer.reconcile([kAddressA]);
      await syncer.drain();

      expect(api.activeChecks, 0);
      expect(api.cursorsFor(kAddressA).first, (400, null));
      expect(store.get(kAddressA).backfilled, isTrue);
    });

    test('checks every address in one sweep', () async {
      final api = FakeKaspaApi({
        kAddressA: [500],
        kAddressB: [400],
      });
      final syncer = syncerFor(api);

      await syncer.reconcile([kAddressA, kAddressB]);
      await syncer.drain();

      expect(api.activeChecks, 1);
      expect(cache.txCount, 2);
    });

    test('returns empty and queues nothing when the check fails', () async {
      final api = FakeKaspaApi({
        kAddressA: [500],
      })..failActiveCheck = true;
      final syncer = syncerFor(api);

      final active = await syncer.reconcile([kAddressA]);
      await syncer.drain();

      expect(active, isEmpty);
      expect(api.requests, isEmpty);
    });

    test('makes no call for an empty address list', () async {
      final api = FakeKaspaApi({});
      final syncer = syncerFor(api);

      await syncer.reconcile(const []);

      expect(api.activeChecks, 0);
    });
  });

  group('scheduleFetch', () {
    test('backfills an address that has no record yet', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400],
      });
      final syncer = syncerFor(api, pageSize: 10);

      syncer.scheduleFetch([kAddressA]);
      await syncer.drain();

      expect(api.activeChecks, 0);
      expect(api.cursorsFor(kAddressA).first, (null, null));
      expect(cache.txCount, 2);
      expect(store.get(kAddressA).backfilled, isTrue);
    });

    test('fetches forward for an already backfilled address', () async {
      await store.save(
        const AddressTxSync(
          address: kAddressA,
          newestBlockTime: 400,
          backfilled: true,
        ),
      );
      final api = FakeKaspaApi({
        kAddressA: [500, 400],
      });
      final syncer = syncerFor(api, pageSize: 10);

      syncer.scheduleFetch([kAddressA]);
      await syncer.drain();

      expect(api.cursorsFor(kAddressA).first, (null, 399));
    });
  });

  group('queue', () {
    const addressC = 'kaspa:addressC';

    List<String> syncOrder(FakeKaspaApi api) => api.requests
        .map((uri) => Uri.decodeComponent(uri.path.split('/')[2]))
        .toList();

    test('syncs the address with the newest transaction first', () async {
      final api = FakeKaspaApi({
        kAddressA: [300],
        kAddressB: [500],
        addressC: [400],
      });
      final syncer = syncerFor(api, pageSize: 10);

      await syncer.reconcile([kAddressA, kAddressB, addressC]);
      await syncer.drain();

      expect(syncOrder(api), [kAddressB, addressC, kAddressA]);
    });

    test('a resumed history waits behind newer transactions', () async {
      await store.save(
        const AddressTxSync(
          address: kAddressA,
          newestBlockTime: 300,
          oldestBlockTime: 300,
        ),
      );
      final api = FakeKaspaApi({
        kAddressA: [300, 200, 100],
        kAddressB: [500],
      });
      final syncer = syncerFor(api, pageSize: 10);

      await syncer.reconcile([kAddressA, kAddressB]);
      await syncer.drain();

      expect(syncOrder(api), [kAddressB, kAddressA]);
      expect(cache.txCount, 3);
    });

    test('an address that just received jumps the queue', () async {
      final api = FakeKaspaApi({
        kAddressA: [900, 800, 700],
        kAddressB: [500],
        addressC: [300],
      });
      final syncer = syncerFor(api, pageSize: 1);

      await syncer.reconcile([kAddressA, kAddressB, addressC]);
      syncer.scheduleFetch([addressC]);
      await syncer.drain();

      final order = syncOrder(api);
      expect(order.indexOf(addressC), lessThan(order.indexOf(kAddressB)));
    });

    test('collapses repeat requests for the same address', () async {
      final api = FakeKaspaApi({
        kAddressA: [500],
      });
      final syncer = syncerFor(api, pageSize: 10);

      syncer.scheduleFetch([kAddressA]);
      syncer.scheduleFetch([kAddressA]);
      syncer.scheduleFetch([kAddressA]);
      await syncer.drain();

      expect(api.cursorsFor(kAddressA), hasLength(1));
    });

    test('keeps going when one address fails', () async {
      final api = FakeKaspaApi({
        kAddressA: [500],
        kAddressB: [400],
      })..failing.add(kAddressA);
      final syncer = syncerFor(api, pageSize: 10);

      await syncer.reconcile([kAddressA, kAddressB]);
      await syncer.drain();

      expect(cache.isWalletTxId('tx-$kAddressB-400'), isTrue);
      expect(store.tryGet(kAddressA), isNull);
    });

    test('reports progress and returns to idle', () async {
      final api = FakeKaspaApi({
        kAddressA: [500],
        kAddressB: [400],
      });
      final syncer = syncerFor(api, pageSize: 10);
      final seen = <TxSyncProgress>[];
      syncer.addListener(() => seen.add(syncer.progress));

      await syncer.reconcile([kAddressA, kAddressB]);
      expect(syncer.progress, const TxSyncProgress(completed: 0, total: 2));
      await syncer.drain();

      expect(seen, contains(const TxSyncProgress(completed: 1, total: 2)));
      expect(syncer.progress, TxSyncProgress.idle);
      expect(syncer.progress.isSyncing, isFalse);
      expect(syncer.isSyncing, isFalse);
    });

    test('a scheduled fetch syncs without reporting progress', () async {
      final api = FakeKaspaApi({
        kAddressA: [500],
      });
      final syncer = syncerFor(api, pageSize: 10);
      final seen = <TxSyncProgress>[];
      syncer.addListener(() => seen.add(syncer.progress));

      syncer.scheduleFetch([kAddressA]);
      await syncer.drain();

      expect(cache.txCount, 1);
      expect(seen.any((p) => p.isSyncing), isFalse);
    });

    test('progress settles when quiet and loud work mix', () async {
      final api = FakeKaspaApi({
        kAddressA: [500],
        kAddressB: [400],
      });
      final syncer = syncerFor(api, pageSize: 10);
      final seen = <TxSyncProgress>[];
      syncer.addListener(() => seen.add(syncer.progress));

      syncer.scheduleFetch([kAddressA]);
      await syncer.reconcile([kAddressA, kAddressB]);
      await syncer.drain();

      expect(seen.every((p) => p.completed <= p.total), isTrue);
      expect(syncer.progress, TxSyncProgress.idle);
      expect(cache.txCount, 2);
    });

    test('takes a breather between addresses', () async {
      final api = FakeKaspaApi({
        kAddressA: [500],
        kAddressB: [400],
      });
      cache.api = api.service;
      final syncer = AddressTxSyncer(
        cache: cache,
        store: store,
        pageSize: 10,
        addressGap: const Duration(milliseconds: 100),
      );

      final started = DateTime.now();
      await syncer.reconcile([kAddressA, kAddressB]);
      await syncer.drain();

      expect(
        DateTime.now().difference(started),
        greaterThanOrEqualTo(const Duration(milliseconds: 100)),
      );
      expect(cache.txCount, 2);
    });

    test('announces the queue before the first address is done', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400, 300, 200],
        kAddressB: [400],
      });
      final syncer = syncerFor(api, pageSize: 1);
      final seen = <TxSyncProgress>[];
      syncer.addListener(() => seen.add(syncer.progress));

      await syncer.reconcile([kAddressA, kAddressB]);
      await syncer.drain();

      expect(seen.first, const TxSyncProgress(completed: 0, total: 2));
      expect(seen.first.isSyncing, isTrue);
    });

    test('cancel stops the queue', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400, 300, 200],
        kAddressB: [400],
      });
      final syncer = syncerFor(api, pageSize: 2);

      await syncer.reconcile([kAddressA, kAddressB]);
      syncer.cancel();
      await syncer.drain();

      expect(cache.isWalletTxId('tx-$kAddressB-400'), isFalse);
    });
  });
}
