import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaspium_push/push.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../push/push_info_dialog.dart';
import '../push/push_service.dart';
import '../push/push_settings_dialog.dart';
import '../push/watched_addresses_sheet.dart';
import '../util/caseconverter.dart';
import '../util/ui_util.dart';
import '../widgets/dialog.dart';
import '../widgets/sheet_util.dart';
import 'double_line_item.dart';
import 'selection_item.dart';

class PushSettingsItem extends ConsumerWidget {
  const PushSettingsItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = l10nOf(context);

    final pushEnabled = ref.watch(pushEnabledProvider);

    Future<bool?> showWatchedAddressesSheet() =>
        Sheets.showAppHeightNineSheet<bool>(
          context: context,
          theme: ref.read(themeProvider),
          fullHeight: true,
          widget: const WatchedAddressesSheet(),
        );

    Future<void> changePushSettings(bool enable) async {
      AppDialogs.showInProgressDialog(
        context,
        l10n.notificationsSettingTitle,
        l10n.notificationsSettingMessage,
      );

      try {
        final pushSettings = ref.read(pushSettingsProvider.notifier);
        await pushSettings.setPush(enabled: enable);
      } on PushClaimPendingException {
        UIUtil.showSnackbar(l10n.notificationsClaimPending);
      } catch (e) {
        UIUtil.showSnackbar(
          enable
              ? l10n.notificationsEnableFailed
              : l10n.notificationsDisableFailed,
        );
      }
      if (!context.mounted) return;
      appRouter.pop(context);
    }

    Future<void> authChangePushSettings(bool enable) async {
      final authUtil = ref.read(authUtilProvider);
      final auth = await authUtil.authenticate(
        context,
        enable ? l10n.notificationsEnablePin : l10n.notificationsDisablePin,
        enable
            ? l10n.notificationsEnableBiometrics
            : l10n.notificationsDisableBiometrics,
      );

      if (!auth) return;

      if (enable) {
        if (!context.mounted) return;
        final turnOff = await showWatchedAddressesSheet();
        if (turnOff == true) return;
        if (!context.mounted) return;
      }
      await changePushSettings(enable);
    }

    Future<bool> checkPermissions() async {
      final permission = await Push.instance.requestPermission();
      if (!context.mounted) return false;
      if (permission == false) {
        AppDialogs.showInfoDialog(
          context,
          l10n.notificationsDisabledTitle,
          l10n.notificationsDisabledMessage,
        );
      }
      return permission;
    }

    Future<void> resetNotifications() async {
      AppDialogs.showInProgressDialog(
        context,
        l10n.notificationsResettingTitle,
        l10n.notificationsSettingMessage,
      );

      final notifier = ref.read(pushSettingsProvider.notifier);
      final reset = await notifier.resetSettings();

      if (!reset) {
        UIUtil.showSnackbar(l10n.notificationsResetFailed);
      }

      if (!context.mounted) return;
      appRouter.pop(context);
    }

    Future<void> authResetNotifications() async {
      final authUtil = ref.read(authUtilProvider);
      final auth = await authUtil.authenticate(
        context,
        l10n.notificationsResetPin,
        l10n.notificationsResetBiometrics,
      );

      if (auth) {
        await resetNotifications();
      }
    }

    void confirmResetNotifications() => AppDialogs.showConfirmDialog(
      context,
      l10n.notificationsResetConfirmTitle,
      l10n.notificationsResetConfirmMessage,
      l10n.resetUppercase,
      authResetNotifications,
    );

    Future<void> showPushSettingsDialog() async {
      final selection = await showDialog<PushSettingsAction>(
        context: context,
        builder: (_) => const PushSettingsDialog(),
      );

      switch (selection) {
        case null:
          break;
        case .enable || .disable:
          final enable = selection == .enable;
          if (enable == pushEnabled) break;
          if (enable && !await checkPermissions()) break;
          await authChangePushSettings(enable);
        case .manageAddresses:
          final turnOff = await showWatchedAddressesSheet();
          if (turnOff != true) break;
          if (!context.mounted) break;
          await authChangePushSettings(false);
        case .reset:
          confirmResetNotifications();
      }
    }

    Future<void> showNotificationsInfoDialog() async {
      final authUtil = ref.read(authUtilProvider);
      final auth = await authUtil.authenticate(
        context,
        l10n.notificationsInfoPin,
        l10n.notificationsInfoBiometrics,
      );

      if (!auth || !context.mounted) return;

      AppDialogs.showInfoDialog(
        context,
        l10n.notificationsInfoTitle,
        '',
        contentWidget: const PushInfoDialog(),
      );
    }

    return DoubleLineItem(
      heading: l10n.notifications,
      defaultMethod: SelectionItem(
        CaseChange.toUpperCase(pushEnabled ? l10n.on : l10n.off, ref),
      ),
      icon: AppIcons.notifications,
      onPressed: showPushSettingsDialog,
      onLongPress: showNotificationsInfoDialog,
    );
  }
}
