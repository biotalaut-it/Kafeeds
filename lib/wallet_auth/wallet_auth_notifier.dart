import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../kaspa/kaspa.dart';
import '../util/encryption_util.dart';
import '../util/lock_settings.dart';
import '../util/vault.dart';
import '../wallet/wallet_types.dart';
import '../wallet/wallet_vault.dart';
import 'wallet_auth_types.dart';

Uint8List _computeSignDataSchnorr(List<Uint8List> params) {
  return signSchnorr(hash: params.first, privateKey: params.last);
}

class WalletAuthNotifier extends StateNotifier<WalletAuth> {
  final WalletVault _walletVault;
  final LockSettings _lockSettings;

  WalletAuthNotifier(Vault vault, WalletInfo wallet)
    : _walletVault = WalletVault(wallet.wid, vault),
      _lockSettings = LockSettings(vault),
      super(WalletAuth(wallet: wallet));

  static Future<Uint8List> computeSignDataSchnorr(
    Uint8List data,
    Uint8List privateKey,
  ) {
    return compute(_computeSignDataSchnorr, [data, privateKey]);
  }

  Future<void> syncState() async {
    final hasMnemonic = await _walletVault.hasMnemonic();
    final authOnLaunch = await _lockSettings.getLock();
    final autoLock = await _lockSettings.getAutoLock();
    final isEncrypted = await _walletVault.seedIsEncrypted();

    final isLocked = walletIsLocked && authOnLaunch || needsLegacyPasswordAuth;

    state = state.copyWith(
      isLocked: isLocked,
      authOnLaunch: authOnLaunch,
      autoLock: autoLock,
      hasMnemonic: hasMnemonic,
      isEncrypted: isEncrypted,
    );
  }

  bool get walletIsLocked => state.isLocked;
  bool get walletIsEncrypted => state.isEncrypted;
  bool get walletIsLegacy => state.wallet.isLegacy;

  bool get authOnLaunch => state.authOnLaunch;
  bool get shouldAutoLock => state.shouldAutoLock;

  bool get needsPasswordAuth => state.needsPasswordAuth;
  bool get needsLegacyPasswordAuth => state.needsLegacyPasswordAuth;

  Future<void> setAuthOnLaunch(bool value) async {
    try {
      await _lockSettings.setLock(value);
      state = state.copyWith(authOnLaunch: value);
    } catch (_) {}
  }

  Future<void> setAutoLock(bool value) async {
    try {
      await _lockSettings.setAutoLock(value);
      state = state.copyWith(autoLock: value);
    } catch (_) {}
  }

  Future<String> _getSeed() async {
    if (state.isLocked) {
      throw Exception('Wallet is locked');
    }

    if (!state.isEncrypted) {
      final seed = await _walletVault.getSeed();
      return seed;
    }

    final secret = state.encryptedSecret;
    if (secret == null) {
      throw Exception('Wallet is encrypted');
    }

    final sessionKey = await _walletVault.getSessionKey();
    return EncryptionUtil.decryptHex(secret, sessionKey);
  }

  Future<Uint8List> sign(
    Uint8List data, {
    required int typeIndex,
    required int index,
  }) async {
    final walletKind = state.wallet.kind;

    final seed = await _getSeed();
    final wallet = HdWallet.forSeedHex(seed, type: walletKind.type);
    final keyPair = wallet.deriveKeyPair(typeIndex: typeIndex, index: index);
    final signature = await computeSignDataSchnorr(data, keyPair.privateKey);
    return signature;
  }

  Future<List<String>> getMnemonic({String? password}) async {
    final mnemonic = await _walletVault.getMnemonic(password: password);
    return mnemonic.split(' ');
  }

  void lock() {
    state = state.copyWith(
      isLocked: true,
      encryptedSecret: null,
    );
  }

  void autoLock() {
    if (walletIsLocked) return;
    if (shouldAutoLock) lock();
  }

  Future<bool> unlock({String? password}) async {
    if (state.isEncrypted && password != null) {
      try {
        await _unlockWithPassword(password);
        return true;
      } catch (_) {
        return false;
      }
    }
    state = state.copyWith(isLocked: false);
    return true;
  }

  Future<void> _unlockWithPassword(String password) async {
    final seed = await _walletVault.getSeed(password: password);

    final sessionKey = await _walletVault.updateSessionKey();
    final encryptedSecret = EncryptionUtil.encryptHex(seed, sessionKey);

    state = state.copyWith(
      isLocked: false,
      isEncrypted: true,
      encryptedSecret: encryptedSecret,
    );
  }

  Future<void> setPassword(String password) async {
    try {
      final seed = await _walletVault.getSeed();
      if (EncryptionUtil.isEncryptedHex(seed)) {
        state = state.copyWith(isEncrypted: true);
        throw Exception('Wallet is password protected');
      }
      final mnemonic = await _walletVault.getMnemonic();
      final sessionKey = await _walletVault.updateSessionKey();
      final encryptedSecret = EncryptionUtil.encryptHex(seed, sessionKey);

      await _walletVault.setSeed(
        seed,
        mnemonic: mnemonic,
        password: password,
      );

      state = state.copyWith(
        encryptedSecret: encryptedSecret,
        isEncrypted: true,
      );
    } catch (e) {
      throw Exception('Failed to set password');
    }
  }

  Future<void> removePassword(String password) async {
    try {
      final seed = await _walletVault.getSeed(password: password);
      final mnemonic = await _walletVault.getMnemonic(password: password);

      await _walletVault.setSeed(seed, mnemonic: mnemonic);

      state = state.copyWith(
        encryptedSecret: null,
        isEncrypted: false,
      );
    } catch (e) {
      throw Exception('Failed to remove password');
    }
  }

  Future<Uint8List> _pubKeyLegacy({
    required int typeIndex,
    required int index,
  }) async {
    final seed = await _getSeed();
    final wallet = HdWallet.forSeedHex(seed, type: .legacy);
    final keyPair = wallet.deriveKeyPair(typeIndex: typeIndex, index: index);
    return keyPair.publicKey;
  }

  HdAddressGenerator addressGenerator(KaspaNetwork network) {
    final wallet = state.wallet;
    final prefix = addressPrefixForNetwork(network);
    final hdPubKey = wallet.hdPublicKey(network);

    return wallet.kind.when(
      localHdSchnorr: (_) => SchnorrAddressGenerator(
        hdPublicKey: hdPubKey,
        addressPrefix: prefix,
      ),
      localHdEcdsa: (_) => EcdsaAddressGenerator(
        hdPublicKey: hdPubKey,
        addressPrefix: prefix,
      ),
      localHdLegacy: (mainPubKey) => LegacyAddressGenerator(
        pubKeyCallback: _pubKeyLegacy,
        mainAddress: .publicKey(
          prefix: prefix,
          publicKey: hexToBytes(mainPubKey),
        ),
      ),
    );
  }
}
