import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../contacts/contact.dart';
import '../kaspa/kaspa.dart';
import '../push/push_types.dart';
import '../transactions/transaction_types.dart';
import '../transactions/tx_sync/tx_sync_types.dart';
import '../txnotes/txnotes_types.dart';
import '../util/vault.dart';
import '../wallet_address/wallet_address.dart';
import 'boxes.dart';
import 'json_type_adapter.dart';

typedef BoxKey = String;

class Database {
  Database._();

  static late Database _instance;
  factory Database() => _instance;

  static bool _isInitialized = false;
  static Future<void> _initHive() async {
    await Hive.initFlutter('kaspium_wallet');

    Hive.registerAdapter(
      JsonTypeAdapter(typeId: 0, fromJson: WalletAddress.fromJson),
    );
    Hive.registerAdapter(
      JsonTypeAdapter(typeId: 1, fromJson: AddressBalance.fromJson),
    );
    Hive.registerAdapter(
      JsonTypeAdapter(typeId: 2, fromJson: Contact.fromJson),
    );
    Hive.registerAdapter(
      JsonTypeAdapter(typeId: 3, fromJson: Tx.fromJson),
    );
    Hive.registerAdapter(
      JsonTypeAdapter(typeId: 4, fromJson: Utxo.fromJson),
    );
    Hive.registerAdapter(
      JsonTypeAdapter(typeId: 5, fromJson: TxNote.fromJson),
    );
    Hive.registerAdapter(
      JsonTypeAdapter(typeId: 6, fromJson: TxIndex.fromJson),
    );
    Hive.registerAdapter(
      JsonTypeAdapter(typeId: 7, fromJson: PushSettings.fromJson),
    );
    Hive.registerAdapter(
      JsonTypeAdapter(typeId: 8, fromJson: AddressTxSync.fromJson),
    );
  }

  static Future<void> init() async {
    if (_isInitialized) return;
    await _initHive();
    _instance = Database._();
    await _instance._init();
    _isInitialized = true;
  }

  static Future<Database> reset() async {
    await Hive.deleteFromDisk();

    _instance = Database._();
    await _instance._init();
    return _instance;
  }

  late final BoxKey contactsBox;
  late final BoxKey pushSettingsBox;
  late final BoxKey settingsBox;
  late final BoxKey txNotesBox;

  static Future<HiveCipher> _getBoxCipher(BoxKey boxKey, Vault vault) async {
    var secureKey = await vault.get(boxKey);
    if (secureKey == null) {
      secureKey = Database.generateSecureKey();
      vault.set(boxKey, secureKey);
    }
    return HiveAesCipher(base64Decode(secureKey));
  }

  Future<void> _init() async {
    await Hive.initFlutter('kaspium_wallet');

    final vault = Vault();
    final dbKey = await vault.getDbKey();

    contactsBox = hash('_contactsBox#$dbKey');
    settingsBox = hash('_settingsBox#$dbKey');
    pushSettingsBox = hash('_pushSettingsBox#$dbKey');
    txNotesBox = hash('_txNotesBox#$dbKey');

    Future<Box> open<T>(String box, {bool encrypted = false}) async {
      final cipher = encrypted ? await _getBoxCipher(box, vault) : null;
      return Hive.openBox<T>(box, encryptionCipher: cipher);
    }

    await Future.wait([
      // typed boxes
      open<Contact>(contactsBox, encrypted: true),
      open<TxNote>(txNotesBox, encrypted: true),
      open<PushSettings>(pushSettingsBox, encrypted: true),

      // generic boxes
      open(settingsBox, encrypted: true),
    ]);
  }

  static Future<void> openBox<T>(
    String boxKey, {
    bool lazy = false,
    String? encryptionKey,
  }) async {
    HiveCipher? cipher;
    if (encryptionKey != null) {
      cipher = HiveAesCipher(base64Decode(encryptionKey));
    }
    if (lazy) {
      await Hive.openLazyBox<T>(boxKey, encryptionCipher: cipher);
    } else {
      await Hive.openBox<T>(boxKey, encryptionCipher: cipher);
    }
  }

  static Future<void> closeBox<T>(String boxKey, {bool lazy = false}) async {
    if (Hive.isBoxOpen(boxKey)) {
      final box = lazy ? Hive.lazyBox<T>(boxKey) : Hive.box<T>(boxKey);
      await box.close();
    }
  }

  static bool isBoxOpen(String boxKey) => Hive.isBoxOpen(boxKey);

  static Future<void> closeAll() => Hive.close();

  static String generateSecureKey() => base64Encode(Hive.generateSecureKey());

  static Future<void> removeBox(String boxKey) =>
      Hive.deleteBoxFromDisk(boxKey);

  TypedBox<T> getTypedBox<T>(BoxKey boxKey) {
    assert(Hive.isBoxOpen(boxKey));
    final box = Hive.box<T>(boxKey);
    return TypedBox(box);
  }

  IndexedTypedBox<T> getIndexedTypedBox<T>(BoxKey boxKey) {
    assert(Hive.isBoxOpen(boxKey));
    final box = Hive.box<T>(boxKey);
    return IndexedTypedBox(box);
  }

  LazyTypedBox<T> getLazyTypedBox<T>(BoxKey boxKey) {
    assert(Hive.isBoxOpen(boxKey));
    final box = Hive.lazyBox<T>(boxKey);
    return LazyTypedBox(box);
  }

  GenericBox getGenericBox(BoxKey boxKey) {
    assert(Hive.isBoxOpen(boxKey));
    final box = Hive.box(boxKey);
    return GenericBox(box);
  }
}
