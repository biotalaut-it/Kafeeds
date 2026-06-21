import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../settings/authentication_method.dart';
import '../settings/device_unlock_option.dart';
import '../settings/wallet_settings.dart';
import '../util/lock_settings.dart';
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
  _SecurityMenuState createState() => _SecurityMenuState();
}

class _SecurityMenuState extends ConsumerState<SecurityMenu> {
  bool _hasBiometrics = false;
  AuthenticationMethod _authMethod = AuthenticationMethod(.BIOMETRICS);
  UnlockSetting _unlockSetting = UnlockSetting(.NO);
  UnlockSetting _autoLockSetting = UnlockSetting(.NO);

  @override
  void initState() {
    super.initState();

    // Determine if they have face or fingerprint enrolled, if not hide the setting
    final biometricUtil = ref.read(biometricUtilProvider);
    final vault = ref.read(vaultProvider);
    final lockSettings = LockSettings(vault);
    final sharedPrefsUtil = ref.read(sharedPrefsUtilProvider);
    biometricUtil.hasBiometrics().then((hasBiometrics) {
      setState(() => _hasBiometrics = hasBiometrics);
    });
    // Get default auth method setting
    _authMethod = sharedPrefsUtil.getAuthMethod();
    // Get default unlock settings
    lockSettings.getLock().then((lock) {
      setState(
        () =>
            _unlockSetting = (lock ? UnlockSetting(.YES) : UnlockSetting(.NO)),
      );
    });

    lockSettings.getAutoLock().then((autolock) {
      setState(
        () => _autoLockSetting = (autolock
            ? UnlockSetting(.YES)
            : UnlockSetting(.NO)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final wallet = ref.watch(walletProvider);
    final walletAuth = ref.watch(walletAuthProvider);

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

    switch (await showDialog<AuthMethod>(
        context: context,
        barrierColor: theme.barrier,
        builder: (BuildContext context) {
          return AppSimpleDialog(
            title: Text(
              l10n.authMethod,
              style: styles.textStyleDialogHeader,
            ),
            children: [
              AppSimpleDialogOption(
                onPressed: () => appRouter.pop(
                  context,
                  withResult: AuthMethod.BIOMETRICS,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    l10n.biometricsMethod,
                    style: styles.textStyleDialogOptions,
                  ),
                ),
              ),
              AppSimpleDialogOption(
                onPressed: () => appRouter.pop(
                  context,
                  withResult: AuthMethod.PIN,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    l10n.pinMethod,
                    style: styles.textStyleDialogOptions,
                  ),
                ),
              ),
            ],
          );
        })) {
      case .PIN:
        sharedPrefsUtil
            .setAuthMethod(AuthenticationMethod(.PIN))
            .then((result) {
          setState(() {
            _authMethod = AuthenticationMethod(.PIN);
          });
        });
        break;
      case .BIOMETRICS:
        sharedPrefsUtil
            .setAuthMethod(AuthenticationMethod(.BIOMETRICS))
            .then((result) {
          setState(() {
            _authMethod = AuthenticationMethod(.BIOMETRICS);
          });
        });
        break;
      default:
        break;
    }
  }

  Future<UnlockOption?> _getOption({required String title}) async {
    final theme = ref.read(themeProvider);
    final styles = ref.read(stylesProvider);
    final l10n = l10nOf(context);

    final unlockOption = await showDialog<UnlockOption>(
      context: context,
      barrierColor: theme.barrier,
      builder: (BuildContext context) {
        return AppSimpleDialog(
          title: Text(title, style: styles.textStyleDialogHeader),
          children: [
            AppSimpleDialogOption(
              onPressed: () => appRouter.pop(
                context,
                withResult: UnlockOption.YES,
              ),
              child: Padding(
                padding: const .symmetric(vertical: 8),
                child: Text(
                  l10n.yes,
                  style: styles.textStyleDialogOptions,
                ),
              ),
            ),
            AppSimpleDialogOption(
              onPressed: () => appRouter.pop(
                context,
                withResult: UnlockOption.NO,
              ),
              child: Padding(
                padding: const .symmetric(vertical: 8),
                child: Text(
                  l10n.no,
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

  Future<void> _lockDialog() async {
    final l10n = l10nOf(context);
    final vault = ref.read(vaultProvider);
    final lockSettings = LockSettings(vault);

    final unlockOption = await _getOption(title: l10n.lockAppSetting);

    switch (unlockOption) {
      case .YES:
        await lockSettings.setLock(true);
        setState(() => _unlockSetting = UnlockSetting(.YES));

        break;
      case .NO:
        await lockSettings.setLock(false);
        await lockSettings.setAutoLock(false);
        setState(() {
          _unlockSetting = UnlockSetting(.NO);
          _autoLockSetting = UnlockSetting(.NO);
        });

        break;
      case null:
        break;
    }
  }

  Future<void> _autoLockDialog() async {
    final l10n = l10nOf(context);
    final vault = ref.read(vaultProvider);
    final lockSettings = LockSettings(vault);

    final unlockOption = await _getOption(title: l10n.autoLockHeader);

    switch (unlockOption) {
      case .YES:
        await lockSettings.setAutoLock(true);
        setState(() => _autoLockSetting = UnlockSetting(.YES));
        break;
      case .NO:
        await lockSettings.setAutoLock(false);
        setState(() => _autoLockSetting = UnlockSetting(.NO));
        break;
      case null:
        break;
    }
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
