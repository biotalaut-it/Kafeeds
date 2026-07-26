import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:kaspium_wallet/database/boxes.dart';
import 'package:kaspium_wallet/database/json_type_adapter.dart';
import 'package:kaspium_wallet/kaspa/kaspa.dart';
import 'package:kaspium_wallet/transactions/transaction_types.dart';
import 'package:kaspium_wallet/transactions/tx_cache_service.dart';
import 'package:logger/logger.dart';

import 'fake_kaspa_api.dart';

void main() {
  late Directory tempDir;
  late Box<TxIndex> txIndexBox;
  late LazyBox<Tx> txBox;
  late TxCacheService cache;

  setUpAll(() {
    Hive.registerAdapter(JsonTypeAdapter(typeId: 3, fromJson: Tx.fromJson));
    Hive.registerAdapter(
      JsonTypeAdapter(typeId: 6, fromJson: TxIndex.fromJson),
    );
  });

  TxCacheService serviceOverBoxes() => TxCacheService(
    txIndexBox: IndexedTypedBox(txIndexBox),
    txBox: LazyTypedBox(txBox),
    log: Logger(level: Level.off),
  );

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('tx_cache_service_test');
    Hive.init(tempDir.path);
    txIndexBox = await Hive.openBox<TxIndex>('txIndex');
    txBox = await Hive.openLazyBox<Tx>('tx');
    cache = serviceOverBoxes();
  });

  tearDown(() async {
    await Hive.deleteFromDisk();
    await tempDir.delete(recursive: true);
  });

  Future<void> indexIds(String address, List<int> blockTimes) {
    return cache.addWalletTxIds([
      for (final blockTime in blockTimes)
        ApiTxId(
          transactionId: txId(address, blockTime),
          blockTime: blockTime,
        ),
    ]);
  }

  group('newestIndexedBlockTime', () {
    test('is zero for an empty cache', () {
      expect(cache.txCount, 0);
      expect(cache.newestIndexedBlockTime, 0);
    });

    test('reports the newest whatever order ids arrive in', () async {
      await indexIds(kAddressA, [300, 900, 500]);
      await indexIds(kAddressB, [700]);

      expect(cache.newestIndexedBlockTime, 900);
    });

    test('survives a reopen', () async {
      await indexIds(kAddressA, [300, 900]);

      expect(serviceOverBoxes().newestIndexedBlockTime, 900);
    });

    test('reports a meaninglessly small time for a cache with none', () async {
      await indexIds(kAddressA, [0, 0, 0]);

      expect(serviceOverBoxes().newestIndexedBlockTime, lessThan(3));
    });
  });

  group('addWalletTxIds', () {
    test('indexes ids without storing any bodies', () async {
      await indexIds(kAddressA, [500, 400]);

      expect(cache.txCount, 2);
      expect(cache.isWalletTxId(txId(kAddressA, 500)), isTrue);
      expect(await txBox.get(txId(kAddressA, 500)), isNull);
    });

    test('ignores ids it already holds', () async {
      await indexIds(kAddressA, [500, 400]);
      await indexIds(kAddressA, [500, 400, 300]);

      expect(cache.txCount, 3);
    });

    test('does not deadlock against a concurrent read', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400],
      });
      cache.api = api.service;
      await indexIds(kAddressA, [500]);

      await Future.wait([
        indexIds(kAddressA, [400]),
        cache.getWalletTxsAfter(count: 10),
      ]).timeout(const Duration(seconds: 5));

      expect(cache.txCount, 2);
    });
  });

  group('lazy bodies', () {
    test('fetches bodies for indexed ids when they are read', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400, 300],
      });
      cache.api = api.service;
      await indexIds(kAddressA, [500, 400, 300]);

      final txs = await cache.getWalletTxsAfter(count: 10);

      expect(txs.map((tx) => tx.id), [
        txId(kAddressA, 500),
        txId(kAddressA, 400),
        txId(kAddressA, 300),
      ]);
      expect(api.bodyRequests, hasLength(1));
      expect(api.bodyRequests.single, hasLength(3));
      expect(txs.first.inputData.single?.address, 'kaspa:counterparty');
    });

    test('only fetches the bodies the read asks for', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400, 300],
      });
      cache.api = api.service;
      await indexIds(kAddressA, [500, 400, 300]);

      await cache.getWalletTxsAfter(count: 2);

      expect(api.bodyRequests.single, [
        txId(kAddressA, 500),
        txId(kAddressA, 400),
      ]);
    });

    test('stores what it fetches and does not ask twice', () async {
      final api = FakeKaspaApi({
        kAddressA: [500, 400],
      });
      cache.api = api.service;
      await indexIds(kAddressA, [500, 400]);

      await cache.getWalletTxsAfter(count: 10);
      await cache.getWalletTxsAfter(count: 10);

      expect(api.bodyRequests, hasLength(1));
      expect(await txBox.get(txId(kAddressA, 500)), isNotNull);
    });

    test('keeps going when a body cannot be fetched', () async {
      final api = FakeKaspaApi({
        kAddressA: [500],
      });
      cache.api = api.service;
      await indexIds(kAddressA, [500]);
      await cache.addWalletTxIds([
        const ApiTxId(transactionId: 'tx-gone', blockTime: 450),
      ]);

      final txs = await cache.getWalletTxsAfter(count: 10);

      expect(txs.map((tx) => tx.id), [txId(kAddressA, 500)]);
      expect(cache.txCount, 2);
    });
  });
}
