import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import '../core/core_providers.dart';
import '../l10n/l10n.dart';
import '../wallet/wallet_list_widget.dart';
import 'intro_actions_widget.dart';

class IntroWallets extends ConsumerWidget {
  const IntroWallets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final height = MediaQuery.heightOf(context);
    final top = height * 0.12;
    final bottom = height * 0.035;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.backgroundDark,
      body: SafeArea(
        minimum: .only(top: top, bottom: bottom),
        child: Column(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/kaspa.png', width: 80, height: 80),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16, top: 8),
                    child: Center(
                      child: Stack(
                        children: [
                          Text(
                            kWalletTitle.toUpperCase(),
                            style: styles.textStyleSettingsHeader
                                .copyWith(fontWeight: FontWeight.w700)
                                .copyWith(letterSpacing: 3)
                                .copyWith(color: theme.text),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 34),
                    child: Text(
                      l10n.walletsTitle.toUpperCase(),
                      style: styles.textStyleLogoutButton,
                    ),
                  ),
                  Flexible(
                    child: const WalletListWidget(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const IntroActionsWidget(),
          ],
        ),
      ),
    );
  }
}
