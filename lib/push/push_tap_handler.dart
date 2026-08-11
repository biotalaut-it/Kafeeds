import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../util/ui_util.dart';
import '../widgets/dialog.dart';

void handlePendingNotificationTap(BuildContext context, WidgetRef ref) {
  final tap = ref.read(notificationTapProvider);
  if (tap == null) return;

  final walletAuth = ref.read(walletAuthNotifierProvider);
  if (walletAuth == null || walletAuth.walletIsLocked) return;

  final l10n = l10nOf(context);

  ref.read(notificationTapProvider.notifier).state = null;

  final network = ref.read(networkProvider);
  if (network != .mainnet) {
    UIUtil.showSnackbar(l10n.switchToMainnetMessage);
    return;
  }

  final repository = ref.read(pushSettingsRepositoryProvider);
  final settings = repository.settingsForAccount(tap.accountId);
  if (settings == null) return;

  final bundle = ref.read(walletBundleProvider);
  if (settings.walletId == bundle.selected?.wid) return;

  final wallet = bundle.wallets?.firstWhereOrNull(
    (wallet) => wallet.wid == settings.walletId,
  );
  if (wallet == null) return;

  AppDialogs.showConfirmDialog(
    context,
    l10n.switchWalletTitle,
    l10n.switchWalletMessageParam(wallet.name),
    l10n.switchUppercase,
    () => appRouter.switchWallet(context, wallet.wid),
  );
}
