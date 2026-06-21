import '../kaspa/utils.dart';
import '../util/encryption_util.dart';
import '../util/vault.dart';

const _kMnemonicKey = 'kaspium_mnemonic_key';
const _kSeedKey = 'kaspium_seed_key';
const _kEncryptedKey = 'kaspium_encrypted_key';

const _true = 'true';
const _false = 'false';

class WalletVault {
  final Vault vault;
  final String _mnemonicKey;
  final String _seedKey;
  final String _isEncryptedKey;

  const WalletVault(String wid, this.vault)
    : _mnemonicKey = '$_kMnemonicKey#$wid',
      _seedKey = '$_kSeedKey#$wid',
      _isEncryptedKey = '$_kEncryptedKey#$wid';

  Future<String> getMnemonic({String? password}) async {
    final mnemonic = await vault.get(_mnemonicKey);

    if (mnemonic == null) {
      throw Exception('Mnemonic is missing from vault');
    }

    if (!EncryptionUtil.isEncryptedHex(mnemonic)) {
      return mnemonic;
    }

    if (password == null) {
      throw Exception('Mnemonic is password protected');
    }

    final decrypted = EncryptionUtil.decryptToText(mnemonic, password);
    return decrypted;
  }

  Future<String> getSeed({String? password}) async {
    final seed = await vault.get(_seedKey);

    if (seed == null) {
      throw Exception('Seed is missing from vault');
    }

    if (!EncryptionUtil.isEncryptedHex(seed)) {
      if (password != null) {
        await vault.set(_isEncryptedKey, _false);
      }
      return seed;
    }

    if (password == null) {
      await vault.set(_isEncryptedKey, _true);
      throw Exception('Seed is password protected');
    }

    final decrypted = EncryptionUtil.decryptHex(seed, password);

    if (!isValidSeed(decrypted)) {
      throw Exception('Incorrect password');
    }
    return decrypted;
  }

  Future<bool> hasMnemonic() => vault.contains(_mnemonicKey);

  Future<bool> seedIsEncrypted() async {
    final encrypted = await vault.get(_isEncryptedKey);
    if (encrypted != null) {
      return encrypted == _true;
    }

    final seed = await vault.get(_seedKey);
    if (seed == null) {
      return false;
    }

    final isEncrypted = EncryptionUtil.isEncryptedHex(seed);
    vault.set(_isEncryptedKey, isEncrypted ? _true : _false);

    return isEncrypted;
  }

  Future<void> setSeed(
    String seed, {
    required String? mnemonic,
    String? password,
  }) async {
    if (password != null) {
      // encrypt mnemonic with password for vault
      mnemonic = EncryptionUtil.maybeEncryptText(mnemonic, password);
      // encrypt seed with password for vault
      seed = EncryptionUtil.encryptHex(seed, password);
    }

    await vault.set(_seedKey, seed);
    await vault.set(_mnemonicKey, mnemonic);
    await vault.set(_isEncryptedKey, password != null ? _true : _false);
  }

  Future<void> delete() async {
    await vault.delete(_mnemonicKey);
    await vault.delete(_seedKey);
    await vault.delete(_isEncryptedKey);
  }

  Future<String> getSessionKey() => vault.getSessionKey();
  Future<String> updateSessionKey() => vault.updateSessionKey();
}
