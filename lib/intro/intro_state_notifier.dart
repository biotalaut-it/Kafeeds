import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'intro_data_notifier.dart';
import 'intro_types.dart';

class IntroStateNotifier extends StateNotifier<IntroState> {
  final IntroDataNotifier introData;

  IntroStateNotifier(this.introData) : super(.init());

  void newWallet() {
    introData.clear();
    introData.generateNewMnemonic(strength: 128);

    _goToPage(.walletName);
  }

  void importSelect() {
    _goToPage(.importSelect);
  }

  void importWallet() {
    introData.clear();
    _goToPage(.importSeed);
  }

  void importLegacyWallet() {
    introData.clear();
    introData.setLegacyWallet();
    _goToPage(.importLegacySeed);
  }

  void importViewOnlyWallet() {
    introData.clear();
    _goToPage(.importKpub);
  }

  void skipPassword() {
    if (introData.isSeedGenerated) {
      _goToPage(.backupSafety);
    } else {
      introData.complete();
    }
  }

  void showIntroPassword() {
    _goToPage(.password);
  }

  void setName(String name) {
    introData.setName(name);
    if (introData.skipPassword) {
      skipPassword();
      return;
    }

    _goToPage(.passwordOnLaunch);
  }

  void setPassword(String password) {
    introData.setPassword(password);

    if (introData.isSeedGenerated) {
      _goToPage(.backupSafety);
    } else {
      introData.complete();
    }
  }

  void setMnemonic(String mnemonic) {
    introData.setMnemonic(mnemonic);
    _goToPage(.walletName);
  }

  void setKpub(String kpub) {
    introData.setKpub(kpub);
    _goToPage(.walletName);
  }

  void showIntroBackup() {
    _goToPage(.backupSeed);
  }

  void showIntroBackupConfirm() {
    _goToPage(.backupConfirm);
  }

  void showIntroWalletName() {
    _goToPage(.walletName);
  }

  void goBack() {
    state = .pop();
  }

  void _goToPage(IntroPage page) {
    state = .push(page: page);
  }
}
