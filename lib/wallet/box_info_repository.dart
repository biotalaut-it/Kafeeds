import 'dart:async';

import '../database/database.dart';
import '../kaspa/kaspa.dart';
import '../settings/settings_repository.dart';
import '../wallet/wallet_types.dart';

BoxKeys _genBoxKeys(String name, {
  required String wid,
  required String networkId,
}) {
  return BoxKeys(
    boxKey: hash('$name#KaspaNetwork.$networkId#$wid'),
    encryptionKey: Database.generateSecureKey(),
  );
}

BoxInfo _genBoxInfo({
  required String wid,
  required String networkId,
}) {
  BoxKeys keysFor(String name) =>
      _genBoxKeys(name, wid: wid, networkId: networkId);

  return BoxInfo(
    address: keysFor('addressBoxKey'),
    balance: keysFor('balanceBoxKey'),
    utxo: keysFor('utxoBoxKey'),
    txIndex: keysFor('txIndexBoxKey'),
    tx: keysFor('txBoxKey'),
    txSync: keysFor('txSyncBoxKey'),
  );
}

extension BoxInfoExtension on SettingsRepository {
  String _boxInfoBundleKey(String wid) {
    return hash('boxInfoBundleKey#$wid');
  }

  BoxInfoBundle getBoxInfoBundle(String wid) {
    final bundle = box.tryGet<BoxInfoBundle>(
      _boxInfoBundleKey(wid),
      typeFactory: BoxInfoBundle.fromJson,
    );
    if (bundle == null) {
      return BoxInfoBundle();
    }
    return bundle;
  }

  Future<void> setBoxInfoBundle(String wid, BoxInfoBundle bundle) {
    return box.set(_boxInfoBundleKey(wid), bundle);
  }

  Future<void> removeBoxInfoBundle(String wid) {
    return box.remove(_boxInfoBundleKey(wid));
  }

  (BoxInfo, Future<void>?) _resolveBoxInfo(String wid, String networkId) {
    var bundle = getBoxInfoBundle(wid);

    var boxInfo = bundle.byNetworkId[networkId];
    if (boxInfo == null) {
      boxInfo = _genBoxInfo(wid: wid, networkId: networkId);
    } else if (boxInfo.txSync == null) {
      boxInfo = boxInfo.copyWith(
        txSync: _genBoxKeys('txSyncBoxKey', wid: wid, networkId: networkId),
      );
    } else {
      return (boxInfo, null);
    }

    bundle = bundle.copyWith(byNetworkId: {
      ...bundle.byNetworkId,
      networkId: boxInfo,
    });

    return (boxInfo, setBoxInfoBundle(wid, bundle));
  }

  BoxInfo getBoxInfo(String wid, String networkId) {
    return _resolveBoxInfo(wid, networkId).$1;
  }

  Future<BoxInfo> ensureBoxInfo(String wid, String networkId) async {
    final (boxInfo, pendingWrite) = _resolveBoxInfo(wid, networkId);
    await pendingWrite;
    return boxInfo;
  }

  Future<void> migrateIfNeeded(WalletInfo wallet) async {
    var bundle = getBoxInfoBundle(wallet.wid);

    if (!bundle.wasMigrated) {
      final mainnet = wallet.boxInfo?.mainnet;
      bundle = bundle.copyWith(
        byNetworkId: mainnet != null
            ? {
                ...bundle.byNetworkId,
                kKaspaNetworkIdMainnet: mainnet,
              }
            : bundle.byNetworkId,
        wasMigrated: true,
      );
      await setBoxInfoBundle(wallet.wid, bundle);
    }
  }
}

class BoxInfoRepository {
  final SettingsRepository settings;

  BoxInfoRepository(this.settings);

  BoxInfo getBoxInfo(String wid, String networkId) =>
      settings.getBoxInfo(wid, networkId);

  Future<BoxInfo> ensureBoxInfo(String wid, String networkId) =>
      settings.ensureBoxInfo(wid, networkId);

  BoxInfoBundle getBoxInfoBundle(String wid) => settings.getBoxInfoBundle(wid);

  Future<void> removeBoxInfoBundle(String wid) async {
    await settings.removeBoxInfoBundle(wid);
  }

  Future<void> migrateIfNeeded(WalletInfo wallet) =>
      settings.migrateIfNeeded(wallet);
}
