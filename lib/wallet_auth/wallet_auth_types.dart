import 'package:freezed_annotation/freezed_annotation.dart';

import '../wallet/wallet_types.dart';

part 'wallet_auth_types.freezed.dart';

@freezed
sealed class WalletAuth with _$WalletAuth {
  const WalletAuth._();
  const factory WalletAuth({
    required WalletInfo wallet,
    @Default(true) bool isLocked,
    @Default(true) bool authOnLaunch,
    @Default(true) bool autoLock,
    @Default(false) bool hasMnemonic,
    @Default(false) bool isEncrypted,
    String? encryptedSecret,
  }) = _WalletAuth;

  bool get canSetPassword => wallet.canSetPassword;
  bool get shouldAutoLock => authOnLaunch && autoLock;
  bool get needsPasswordAuth => isEncrypted && encryptedSecret == null;
  bool get needsLegacyPasswordAuth => wallet.isLegacy && needsPasswordAuth;
}
