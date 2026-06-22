import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../settings/authentication_method.dart';
import '../settings/device_unlock_option.dart';
import '../widgets/app_icon_button.dart';
import '../widgets/app_simpledialog.dart';
import '../widgets/drawer_wrapper.dart';
import '../widgets/item_divider.dart';
import '../widgets/sheet_util.dart';
import 'disable_password_sheet.dart';
import 'double_line_item.dart';
import 'set_password_sheet.dart';
import 'settings_header.dart';
import 'single_line_item.dart';

class SecurityMenu extends ConsumerStatefulWidget {
  final VoidCallback onBackAction;

  const SecurityMenu({
    super.key,
    required this.onBackAction,
  });

  @override
  ConsumerState<SecurityMenu> createState() => _SecurityMenuState();
}

class _SecurityMenuState extends ConsumerState<SecurityMenu> {
  bool _hasBiometrics = false;
  var _authMethod = const AuthenticationMethod(.BIOMETRICS);

  @override
  void initState() {
    super.initState();

    // Determine if they have face or fingerprint enrolled, if not hide the setting
    final biometricUtil = ref.read(biometricUtilProvider);
    final sharedPrefsUtil = ref.read(sharedPrefsUtilProvider);
    biometricUtil.hasBiometrics().then((hasBiometrics) {
      setState(() => _hasBiometrics = hasBiometrics);
    });
    // Get default auth method setting
    _authMethod = sharedPrefsUtil.getAuthMethod();
  }

  UnlockSetting _getSetting(bool value) =>
      value ? const UnlockSetting(.YES) : const UnlockSetting(.NO);

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final walletAuth = ref.watch(walletAuthProvider);

    final items = <Widget>[
      SettingsHeader(title: l10n.preferences),
      // Authentication Method
      if (_hasBiometrics)
        DoubleLineItem(
          heading: l10n.authMethod,
          defaultMethod: _authMethod,
          icon: AppIcons.fingerprint,
          onPressed: _authMethodDialog,
        ),
      // Authenticate on Launch
      DoubleLineItem(
        heading: l10n.lockAppSetting,
        defaultMethod: _getSetting(walletAuth.authOnLaunch),
        icon: AppIcons.lock,
        onPressed: _authOnLaunchDialog,
      ),
      // Autolock
      DoubleLineItem(
        heading: l10n.autoLockHeader,
        defaultMethod: _getSetting(walletAuth.autoLock),
        icon: Icons.sync_lock,
        onPressed: _autoLockDialog,
        disabled: walletAuth.authOnLaunch == false,
      ),
      if (walletAuth.canSetPassword)
        if (walletAuth.isEncrypted) ...[
          SingleLineItem(
            heading: l10n.disableWalletPassword,
            settingIcon: AppIcons.walletpassworddisabled,
            onPressed: () => Sheets.showAppHeightNineSheet(
              context: context,
              widget: const DisablePasswordSheet(),
              theme: theme,
            ),
          ),
        ] else
          SingleLineItem(
            heading: l10n.setWalletPassword,
            settingIcon: AppIcons.walletpassword,
            onPressed: () => Sheets.showAppHeightNineSheet(
              context: context,
              widget: const SetPasswordSheet(),
              theme: theme,
            ),
          ),
    ];

    return DrawerWrapper(
      child: Column(
        children: [
          Container(
            margin: const .only(bottom: 10, top: 5),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const .symmetric(horizontal: 10),
                      child: AppIconButton(
                        icon: AppIcons.back,
                        onPressed: widget.onBackAction,
                      ),
                    ),
                    Text(
                      l10n.securityHeader,
                      style: styles.textStyleSettingsHeader,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                ListView.separated(
                  padding: const .only(top: 15),
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const ItemDivider(),
                  itemBuilder: (_, index) => items[index],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _authMethodDialog() async {
    final theme = ref.read(themeProvider);
    final styles = ref.read(stylesProvider);
    final l10n = l10nOf(context);
    final sharedPrefsUtil = ref.read(sharedPrefsUtilProvider);

    final result = await showDialog<AuthMethod>(
      context: context,
      barrierColor: theme.barrier,
      builder: (context) {
        void returnMethod(AuthMethod method) {
          appRouter.pop(context, withResult: method);
        }

        return SimpleDialog(
          title: Text(
            l10n.authMethod,
            style: styles.textStyleDialogHeader,
          ),
          children: [
            for (final method in AuthMethod.values)
              SimpleDialogOption(
                onPressed: () => returnMethod(method),
                child: Padding(
                  padding: const .symmetric(vertical: 8),
                  child: Text(
                    AuthenticationMethod(method).getDisplayName(context),
                    style: styles.textStyleDialogOptions,
                  ),
                ),
              ),
          ],
        );
      },
    );

    if (result case final result?) {
      final authMethod = AuthenticationMethod(result);
      await sharedPrefsUtil.setAuthMethod(authMethod);
      setState(() => _authMethod = authMethod);
    }
  }

  Future<UnlockOption?> _getOption({required String title}) async {
    final theme = ref.read(themeProvider);
    final styles = ref.read(stylesProvider);

    final unlockOption = await showDialog<UnlockOption>(
      context: context,
      barrierColor: theme.barrier,
      builder: (context) {
        void returnOption(UnlockOption option) {
          appRouter.pop(context, withResult: option);
        }

        return AppSimpleDialog(
          title: Text(title, style: styles.textStyleDialogHeader),
          children: [
            for (final option in UnlockOption.values)
              AppSimpleDialogOption(
                onPressed: () => returnOption(option),
                child: Padding(
                  padding: const .symmetric(vertical: 8),
                  child: Text(
                    UnlockSetting(option).getDisplayName(context),
                    style: styles.textStyleDialogOptions,
                  ),
                ),
              ),
          ],
        );
      },
    );
    return unlockOption;
  }

  Future<void> _authOnLaunchDialog() async {
    final authNotifier = ref.read(walletAuthProvider.notifier);
    final l10n = l10nOf(context);

    final unlockOption = await _getOption(title: l10n.lockAppSetting);
    if (unlockOption == null) return;

    await authNotifier.setAuthOnLaunch(unlockOption.value);
  }

  Future<void> _autoLockDialog() async {
    final l10n = l10nOf(context);
    final authNotifier = ref.read(walletAuthProvider.notifier);

    final unlockOption = await _getOption(title: l10n.autoLockHeader);
    if (unlockOption == null) return;

    await authNotifier.setAutoLock(unlockOption.value);
  }
}
