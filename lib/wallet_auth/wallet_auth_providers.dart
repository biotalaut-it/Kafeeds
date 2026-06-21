import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../wallet/wallet_types.dart';
import 'wallet_auth_notifier.dart';

final walletAuthNotifierProvider = Provider((ref) {
  final wallet = ref.watch(selectedWalletProvider);
  if (wallet == null) return null;
  final vault = ref.watch(vaultProvider);

  return WalletAuthNotifier(vault, wallet);
});

final walletAuthProvider = StateNotifierProvider((ref) {
  final authNotifier = ref.watch(walletAuthNotifierProvider);
  if (authNotifier == null) {
    throw Exception('No active wallet');
  }

  return authNotifier;
});

final walletProvider = Provider.autoDispose<WalletInfo>((ref) {
  final walletAuth = ref.watch(walletAuthProvider);
  return walletAuth.wallet;
});

final walletBoxInfoProvider = Provider.autoDispose<BoxInfo>((ref) {
  final wallet = ref.watch(walletProvider);
  final networkId = ref.watch(networkIdProvider);
  final repository = ref.watch(boxInfoRepositoryProvider);
  final boxInfo = repository.getBoxInfo(wallet.wid, networkId);

  return boxInfo;
});
