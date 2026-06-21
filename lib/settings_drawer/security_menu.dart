import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../settings/authentication_method.dart';
import '../settings/device_unlock_option.dart';
import '../settings/wallet_settings.dart';
import '../widgets/app_icon_button.dart';
import '../widgets/app_simpledialog.dart';
import '../widgets/drawer_wrapper.dart';
import '../widgets/gradient_widgets.dart';
import '../widgets/sheet_util.dart';
import 'disable_password_sheet.dart';
import 'double_line_item.dart';
import 'set_password_sheet.dart';
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

    final wallet = ref.watch(walletProvider);
    final walletAuth = ref.watch(walletAuthProvider);

    final _unlockSetting = _getSetting(walletAuth.authOnLaunch);
    final _autoLockSetting = _getSetting(walletAuth.autoLock);

    final requestPassword = ref.watch(
      walletSettingsProvider.select((settings) => settings.requestPassword),
    );
    final requestPasswordSetting = RequestPasswordSetting(requestPassword);

    return DrawerWrapper(
      child: Column(
        children: [
          // Back button and Security Text
          Container(
            margin: const .only(bottom: 10, top: 5),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Row(
                  children: [
                    //Back button
                    Padding(
                      padding: const .symmetric(horizontal: 10),
                      child: AppIconButton(
                        icon: AppIcons.back,
                        onPressed: widget.onBackAction,
                      ),
                    ),
                    //Security Header Text
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
                ListView(
                  padding: const .only(top: 15),
                  children: [
                    Container(
                      margin: const .directional(start: 30, bottom: 10),
                      child: Text(
                        l10n.preferences,
                        style: styles.textStyleAppTextFieldHint,
                      ),
                    ),
                    // Authentication Method
                    if (_hasBiometrics) ...[
                      Divider(height: 2, color: theme.text15),
                      DoubleLineItem(
                        heading: l10n.authMethod,
                        defaultMethod: _authMethod,
                        icon: AppIcons.fingerprint,
                        onPressed: _authMethodDialog,
                      ),
                    ],
                    // Authenticate on Launch
                    Divider(height: 2, color: theme.text15),
                    DoubleLineItem(
                      heading: l10n.lockAppSetting,
                      defaultMethod: _unlockSetting,
                      icon: AppIcons.lock,
                      onPressed: _lockDialog,
                    ),

                    // Autolock
                    Divider(height: 2, color: theme.text15),
                    DoubleLineItem(
                      heading: l10n.autoLockHeader,
                      defaultMethod: _autoLockSetting,
                      icon: Icons.sync_lock,
                      onPressed: _autoLockDialog,
                      disabled: _unlockSetting.setting == .NO,
                    ),
                    if (wallet.canSetPassword)
                      // Encrypt option
                      if (walletAuth.isEncrypted) ...[
                        Divider(height: 2, color: theme.text15),
                        SingleLineItem(
                          heading: l10n.disableWalletPassword,
                          settingIcon: AppIcons.walletpassworddisabled,
                          onPressed: () {
                            Sheets.showAppHeightNineSheet(
                              context: context,
                              widget: const DisablePasswordSheet(),
                              theme: theme,
                            );
                          },
                        ),
                        Divider(height: 2, color: theme.text15),
                        DoubleLineItem(
                          heading: l10n.requestPasswordHeader,
                          defaultMethod: requestPasswordSetting,
                          icon: Icons.password,
                          onPressed: _requestPasswordDialog,
                        ),
                      ] else ...[
                        Divider(height: 2, color: theme.text15),
                        SingleLineItem(
                          heading: l10n.setWalletPassword,
                          settingIcon: AppIcons.walletpassword,
                          onPressed: () {
                            Sheets.showAppHeightNineSheet(
                              context: context,
                              widget: const SetPasswordSheet(),
                              theme: theme,
                            );
                          },
                        ),
                      ],
                    Divider(height: 2, color: theme.text15),
                  ],
                ),
                const ListTopGradient(),
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
            for (final method in <AuthMethod>[.BIOMETRICS, .PIN])
              SimpleDialogOption(
                onPressed: () => returnMethod(method),
                child: Padding(
                  padding: const .symmetric(vertical: 8),
                  child: Text(
                    l10n.biometricsMethod,
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
    final l10n = l10nOf(context);

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
                    l10n.yes,
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

  List<Widget> _buildPasswordOptions() {
    return RequestPassword.values.map((value) {
      return SimpleDialogOption(
        onPressed: () => appRouter.pop(context, withResult: value),
        child: Padding(
          padding: const .symmetric(vertical: 8),
          child: Text(
            RequestPasswordSetting(value).getDisplayName(context),
            style: ref.read(stylesProvider).textStyleDialogOptions,
          ),
        ),
      );
    }).toList();
  }

  Future<void> _requestPasswordDialog() async {
    final selection = await showAppDialog<RequestPassword>(
      context: context,
      builder: (context) {
        return AppSimpleDialog(
          title: Padding(
            padding: const .only(bottom: 10),
            child: Text(
              l10nOf(context).requestPasswordHeader,
              style: ref.read(stylesProvider).textStyleDialogHeader,
            ),
          ),
          children: _buildPasswordOptions(),
        );
      },
    );
    if (selection == null) {
      return;
    }

    final walletSettings = ref.read(walletSettingsProvider.notifier);
    return walletSettings.setRequestPassword(selection);
  }
}
