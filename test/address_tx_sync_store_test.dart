import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:kaspium_wallet/database/boxes.dart';
import 'package:kaspium_wallet/database/json_type_adapter.dart';
import 'package:kaspium_wallet/transactions/tx_sync/address_tx_sync_store.dart';
import 'package:kaspium_wallet/transactions/tx_sync/tx_sync_types.dart';

const kAddress = 'kaspa:qp0qnczz';
const kOtherAddress = 'kaspa:qrelgny7';

const kUnsynced = AddressTxSync(address: kAddress);
const kSynced = AddressTxSync(
  address: kAddress,
  newestBlockTime: 1000,
  backfilled: true,
);
const kPartial = AddressTxSync(
  address: kAddress,
  newestBlockTime: 1000,
  oldestBlockTime: 500,
);

void main() {
  group('AddressTxSync.actionFor', () {
    test('an inactive address needs nothing', () {
      expect(
        kUnsynced.actionFor(active: false, lastTxBlockTime: null),
        TxSyncAction.none,
      );
      expect(
        kSynced.actionFor(active: false, lastTxBlockTime: null),
        TxSyncAction.none,
      );
    });

    test('an active address with no record backfills', () {
      expect(
        kUnsynced.actionFor(active: true, lastTxBlockTime: 1000),
        TxSyncAction.backfill,
      );
    });

    test('a partial backfill resumes even when no new txs landed', () {
      expect(
        kPartial.actionFor(active: true, lastTxBlockTime: 1000),
        TxSyncAction.backfill,
      );
    });

    test('a newer api block time fetches forward', () {
      expect(
        kSynced.actionFor(active: true, lastTxBlockTime: 1001),
        TxSyncAction.fetchForward,
      );
    });

    test('an equal block time is up to date', () {
      expect(
        kSynced.actionFor(active: true, lastTxBlockTime: 1000),
        TxSyncAction.none,
      );
    });

    test('an api lagging behind the node is not acted on', () {
      expect(
        kSynced.actionFor(active: true, lastTxBlockTime: 999),
        TxSyncAction.none,
      );
    });

    test('active without a block time is not acted on', () {
      expect(
        kUnsynced.actionFor(active: true, lastTxBlockTime: null),
        TxSyncAction.none,
      );
      expect(
        kSynced.actionFor(active: true, lastTxBlockTime: null),
        TxSyncAction.none,
      );
    });
  });

  group('AddressTxSync.pendingAction', () {
    test('an unfinished history is resumed', () {
      expect(kPartial.pendingAction, TxSyncAction.backfill);
      expect(kUnsynced.pendingAction, TxSyncAction.backfill);
    });

    test('a finished history needs nothing', () {
      expect(kSynced.pendingAction, TxSyncAction.none);
    });
  });

  group('AddressTxSyncStore', () {
    late Directory tempDir;
    late Box<AddressTxSync> box;
    late AddressTxSyncStore store;

    setUpAll(() {
      Hive.registerAdapter(
        JsonTypeAdapter(typeId: 8, fromJson: AddressTxSync.fromJson),
      );
    });

    setUp(() async {
      tempDir = await Directory.systemTemp.createTemp('tx_sync_store_test');
      Hive.init(tempDir.path);
      box = await Hive.openBox<AddressTxSync>('txSync');
      store = AddressTxSyncStore(TypedBox(box));
    });

    tearDown(() async {
      await Hive.deleteFromDisk();
      await tempDir.delete(recursive: true);
    });

    test('starts empty', () {
      expect(store.isEmpty, isTrue);
      expect(store.length, 0);
      expect(store.records, isEmpty);
    });

    test('get returns an unsynced record for an unknown address', () {
      final record = store.get(kAddress);

      expect(record, const AddressTxSync(address: kAddress));
      expect(record.backfilled, isFalse);
      expect(store.tryGet(kAddress), isNull);
      expect(store.isEmpty, isTrue);
    });

    test('saves and reads back a record', () async {
      const record = AddressTxSync(
        address: kAddress,
        newestBlockTime: 1784657631347,
        oldestBlockTime: 1772543921441,
        backfilled: true,
        lastSyncMs: 1784657700000,
      );

      await store.save(record);

      expect(store.tryGet(kAddress), record);
      expect(store.get(kAddress), record);
      expect(store.length, 1);
      expect(store.isEmpty, isFalse);
    });

    test('save overwrites the record for the same address', () async {
      await store.save(const AddressTxSync(address: kAddress));
      await store.save(
        const AddressTxSync(
          address: kAddress,
          newestBlockTime: 2000,
          backfilled: true,
        ),
      );

      expect(store.length, 1);
      expect(store.get(kAddress).newestBlockTime, 2000);
      expect(store.get(kAddress).backfilled, isTrue);
    });

    test('saveAll writes every record keyed by address', () async {
      await store.saveAll(const [
        AddressTxSync(address: kAddress, newestBlockTime: 1),
        AddressTxSync(address: kOtherAddress, newestBlockTime: 2),
      ]);

      expect(store.records.keys, unorderedEquals([kAddress, kOtherAddress]));
      expect(store.get(kAddress).newestBlockTime, 1);
      expect(store.get(kOtherAddress).newestBlockTime, 2);
    });

    test('saveAll with no records is a no-op', () async {
      await store.saveAll(const []);

      expect(store.isEmpty, isTrue);
    });

    test('removeAll drops only the given addresses', () async {
      await store.saveAll(const [
        AddressTxSync(address: kAddress),
        AddressTxSync(address: kOtherAddress),
      ]);

      await store.removeAll([kAddress]);

      expect(store.tryGet(kAddress), isNull);
      expect(store.tryGet(kOtherAddress), isNotNull);
    });

    test('clear empties the store', () async {
      await store.saveAll(const [
        AddressTxSync(address: kAddress),
        AddressTxSync(address: kOtherAddress),
      ]);

      await store.clear();

      expect(store.isEmpty, isTrue);
    });

    test('records survive a box reopen', () async {
      const record = AddressTxSync(
        address: kAddress,
        newestBlockTime: 1784657631347,
        backfilled: true,
      );
      await store.save(record);

      await box.close();
      final reopened = await Hive.openBox<AddressTxSync>('txSync');
      final reloaded = AddressTxSyncStore(TypedBox(reopened));

      expect(reloaded.get(kAddress), record);
      box = reopened;
    });
  });
}
