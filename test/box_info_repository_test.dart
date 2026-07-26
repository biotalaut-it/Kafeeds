import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:kaspium_wallet/database/boxes.dart';
import 'package:kaspium_wallet/settings/settings_repository.dart';
import 'package:kaspium_wallet/transactions/tx_sync/tx_sync_types.dart';
import 'package:kaspium_wallet/wallet/box_info_repository.dart';
import 'package:kaspium_wallet/wallet/wallet_types.dart';

const kWid = 'test-wallet';
const kNetworkId = 'mainnet';

BoxKeys _keys(String name) =>
    BoxKeys(boxKey: '$name-box', encryptionKey: '$name-key');

BoxInfo _legacyBoxInfo() => BoxInfo(
  address: _keys('address'),
  balance: _keys('balance'),
  utxo: _keys('utxo'),
  txIndex: _keys('txIndex'),
  tx: _keys('tx'),
);

void main() {
  late Directory tempDir;
  late Box box;
  late BoxInfoRepository repository;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('box_info_test');
    Hive.init(tempDir.path);
    box = await Hive.openBox('settings');
    repository = BoxInfoRepository(SettingsRepository(GenericBox(box)));
  });

  tearDown(() async {
    await Hive.deleteFromDisk();
    await tempDir.delete(recursive: true);
  });

  group('BoxInfo serialization', () {
    test('legacy json without txSync deserializes with a null txSync', () {
      final json = _legacyBoxInfo().toJson()..remove('txSync');
      expect(json.containsKey('txSync'), isFalse);

      final boxInfo = BoxInfo.fromJson(json);

      expect(boxInfo.txSync, isNull);
      expect(boxInfo.address.boxKey, 'address-box');
      expect(() => boxInfo.txSyncKeys, throwsStateError);
    });

    test('round trips txSync when present', () {
      final boxInfo = _legacyBoxInfo().copyWith(txSync: _keys('txSync'));

      final decoded = BoxInfo.fromJson(boxInfo.toJson());

      expect(decoded.txSyncKeys.boxKey, 'txSync-box');
      expect(decoded.txSyncKeys.encryptionKey, 'txSync-key');
    });
  });

  group('getBoxInfo', () {
    test('generates a complete box info for a new wallet', () {
      final boxInfo = repository.getBoxInfo(kWid, kNetworkId);

      expect(boxInfo.txSync, isNotNull);
      expect(boxInfo.txSyncKeys.boxKey, isNotEmpty);
      expect(boxInfo.txSyncKeys.encryptionKey, isNotEmpty);
    });

    test('backfills txSync on a legacy bundle without touching other keys', () {
      final legacy = _legacyBoxInfo();
      final settings = SettingsRepository(GenericBox(box));
      settings.setBoxInfoBundle(kWid, BoxInfoBundle(
        byNetworkId: {kNetworkId: legacy},
        wasMigrated: true,
      ));

      final boxInfo = repository.getBoxInfo(kWid, kNetworkId);

      expect(boxInfo.txSync, isNotNull);
      expect(boxInfo.address, legacy.address);
      expect(boxInfo.balance, legacy.balance);
      expect(boxInfo.utxo, legacy.utxo);
      expect(boxInfo.txIndex, legacy.txIndex);
      expect(boxInfo.tx, legacy.tx);
    });

    test('persists the backfilled keys', () {
      final settings = SettingsRepository(GenericBox(box));
      settings.setBoxInfoBundle(kWid, BoxInfoBundle(
        byNetworkId: {kNetworkId: _legacyBoxInfo()},
        wasMigrated: true,
      ));

      final generated = repository.getBoxInfo(kWid, kNetworkId);
      final stored = repository
          .getBoxInfoBundle(kWid)
          .byNetworkId[kNetworkId];

      expect(stored?.txSync, generated.txSync);
    });

    test('returns stable keys across calls', () {
      final first = repository.getBoxInfo(kWid, kNetworkId);
      final second = repository.getBoxInfo(kWid, kNetworkId);
      final third = repository.getBoxInfo(kWid, kNetworkId);

      expect(second, first);
      expect(third, first);
    });

    test('ensureBoxInfo persists generated keys before returning', () async {
      final boxInfo = await repository.ensureBoxInfo(kWid, kNetworkId);

      await box.close();
      final reopened = await Hive.openBox('settings');
      final stored = BoxInfoRepository(SettingsRepository(GenericBox(reopened)))
          .getBoxInfoBundle(kWid)
          .byNetworkId[kNetworkId];

      expect(stored, boxInfo);
      box = reopened;
    });

    test('uses distinct keys per network', () {
      final mainnet = repository.getBoxInfo(kWid, kNetworkId);
      final testnet = repository.getBoxInfo(kWid, 'testnet-10');

      expect(testnet.txSyncKeys.boxKey, isNot(mainnet.txSyncKeys.boxKey));
    });
  });

  group('AddressTxSync', () {
    test('round trips through json', () {
      const record = AddressTxSync(
        address: 'kaspa:qp0qnczz',
        newestBlockTime: 1784657631347,
        oldestBlockTime: 1772543921441,
        backfilled: true,
        lastSyncMs: 1784657700000,
      );

      expect(AddressTxSync.fromJson(record.toJson()), record);
    });

    test('defaults leave an address unsynced', () {
      final record = AddressTxSync.fromJson({'address': 'kaspa:qp0qnczz'});

      expect(record.backfilled, isFalse);
      expect(record.newestBlockTime, 0);
      expect(record.oldestBlockTime, 0);
      expect(record.lastSyncMs, 0);
    });
  });
}
