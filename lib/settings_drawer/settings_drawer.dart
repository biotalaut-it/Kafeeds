import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../app_router.dart';
import '../contacts/contacts_widget.dart';
import '../l10n/l10n.dart';
import '../settings_advanced/advanced_menu.dart';
import '../widgets/gradient_widgets.dart';
import '../widgets/item_divider.dart';
import 'accounts_area.dart';
import 'contact_support_settings_item.dart';
import 'currency_settings_item.dart';
import 'language_settings_item.dart';
import 'logout_settings_item.dart';
import 'network_menu.dart';
import 'push_settings_item.dart';
import 'secret_phrase_settings_item.dart';
import 'security_menu.dart';
import 'settings_header.dart';
import 'share_settings_item.dart';
import 'single_line_item.dart';
import 'theme_settings_item.dart';
import 'version_widget.dart';

class SettingsSheet extends ConsumerStatefulWidget {
  const SettingsSheet({super.key});

  @override
  ConsumerState<SettingsSheet> createState() => _SettingsSheetState();
}

class _SettingsSheetState extends ConsumerState<SettingsSheet>
    with TickerProviderStateMixin {
  late final AnimationController _contactsController;
  late final Animation<Offset> _contactsOffsetFloat;

  late final AnimationController _securityController;
  late final Animation<Offset> _securityOffsetFloat;

  late final AnimationController _networkController;
  late final Animation<Offset> _networkOffsetFloat;

  late final AnimationController _advancedController;
  late final Animation<Offset> _advancedOffsetFloat;

  bool _securityOpen = false;
  bool _contactsOpen = false;
  bool _networkOpen = false;
  bool _advancedOpen = false;

  @override
  void initState() {
    super.initState();

    // Setup animation controller
    // For contacts menu
    _contactsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    // For security menu
    _securityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    // For network menu
    _networkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    // For advanced menu
    _advancedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );

    final beginOffset = const Offset(1.1, 0);
    final endOffset = const Offset(0, 0);
    _contactsOffsetFloat = Tween<Offset>(
      begin: beginOffset,
      end: endOffset,
    ).animate(_contactsController);
    _securityOffsetFloat = Tween<Offset>(
      begin: beginOffset,
      end: endOffset,
    ).animate(_securityController);
    _networkOffsetFloat = Tween<Offset>(
      begin: beginOffset,
      end: endOffset,
    ).animate(_networkController);
    _advancedOffsetFloat = Tween<Offset>(
      begin: beginOffset,
      end: endOffset,
    ).animate(_advancedController);
  }

  @override
  void dispose() {
    _contactsController.dispose();
    _securityController.dispose();
    _networkController.dispose();
    _advancedController.dispose();

    super.dispose();
  }

  void _onBackButtonPressed<T>(bool didPop, T result) {
    if (_contactsOpen) {
      setState(() => _contactsOpen = false);
      _contactsController.reverse();
    } else if (_securityOpen) {
      setState(() => _securityOpen = false);
      _securityController.reverse();
    } else if (_networkOpen) {
      setState(() => _networkOpen = false);
      _networkController.reverse();
    } else if (_advancedOpen) {
      setState(() => _advancedOpen = false);
      _advancedController.reverse();
    } else if (!didPop) {
      appRouter.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onBackButtonPressed,
      child: ClipRect(
        child: Stack(
          children: [
            Consumer(
              builder: (context, ref, _) {
                return Container(
                  color: ref.watch(themeProvider).backgroundDark,
                  constraints: .expand(),
                );
              },
            ),
            buildMainSettings(context),
            SlideTransition(
              position: _contactsOffsetFloat,
              child: ContactsWidget(
                onBackAction: () {
                  setState(() => _contactsOpen = false);
                  _contactsController.reverse();
                },
              ),
            ),
            SlideTransition(
              position: _securityOffsetFloat,
              child: SecurityMenu(
                onBackAction: () {
                  setState(() => _securityOpen = false);
                  _securityController.reverse();
                },
              ),
            ),
            SlideTransition(
              position: _networkOffsetFloat,
              child: NetworkMenu(
                onBackAction: () {
                  setState(() => _networkOpen = false);
                  _networkController.reverse();
                },
              ),
            ),
            SlideTransition(
              position: _advancedOffsetFloat,
              child: AdvancedMenu(
                onBackAction: () {
                  setState(() => _advancedOpen = false);
                  _advancedController.reverse();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMainSettings(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final theme = ref.watch(themeProvider);
        final l10n = l10nOf(context);
        final hasMnemonic = ref.watch(
          walletAuthProvider.select((auth) => auth.hasMnemonic),
        );

        final pushAvailable = ref.watch(pushAvailableProvider);
        //final canBuy = ref.watch(networkProvider) == .mainnet;

        final items = <Widget>[
          SettingsHeader(title: l10n.preferences),
          const CurrencySettingsItem(),
          const LanguageSettingsItem(),
          if (pushAvailable) const PushSettingsItem(),
          const ThemeSettingsItem(),

          SingleLineItem(
            heading: l10n.securityHeader,
            settingIcon: AppIcons.security,
            onPressed: () async {
              final authUtil = ref.read(authUtilProvider);
              final auth = await authUtil.authenticate(
                context,
                l10n.securitySettingsPin,
                l10n.securitySettingsBiometrics,
              );
              if (!auth || !context.mounted) return;
              setState(() => _securityOpen = true);
              _securityController.forward();
            },
          ),
          SingleLineItem(
            heading: l10n.networkHeader,
            settingIcon: Icons.language,
            iconSize: 28,
            onPressed: () {
              setState(() => _networkOpen = true);
              _networkController.forward();
            },
          ),
          Padding(
            padding: const .only(top: 20),
            child: SettingsHeader(title: l10n.manage),
          ),
          SingleLineItem(
            heading: l10n.contactsHeader,
            settingIcon: AppIcons.contact,
            onPressed: () {
              setState(() => _contactsOpen = true);
              _contactsController.forward();
            },
          ),
          SingleLineItem(
            heading: l10n.advancedHeader,
            settingIcon: Icons.settings_applications,
            iconSize: 30,
            onPressed: () {
              setState(() => _advancedOpen = true);
              _advancedController.forward();
            },
          ),
          if (hasMnemonic) const SecretPhraseSettingsItem(),
          //if (canBuy) const BuySettingsItem(),
          const ContactSupportSettingsItem(),
          const ShareSettingsItem(),
          const LogoutSettingsItem(),
          const VersionWidget(),
        ];

        return Container(
          decoration: BoxDecoration(color: theme.backgroundDark),
          child: SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: .only(top: 30),
                  child: AccountsArea(),
                ),
                // Settings items
                Expanded(
                  child: Stack(
                    children: [
                      ListView.separated(
                        primary: false,
                        padding: const .only(top: 15),
                        itemCount: items.length,
                        itemBuilder: (_, index) => items[index],
                        separatorBuilder: (_, _) => const ItemDivider(),
                      ),
                      const ListTopGradient(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
