import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import '../core/core_providers.dart';
import '../l10n/l10n.dart';
import '../wallet/wallet_list_widget.dart';
import '../widgets/content_wrapper.dart';
import 'intro_actions_widget.dart';

class IntroWallets extends ConsumerWidget {
  const IntroWallets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    return ContentWrapper(
      child: Column(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                Image.asset('assets/kaspa.png', width: 80, height: 80),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16, top: 8),
                  child: Center(
                    child: Stack(
                      children: [
                        Text(
                          kWalletTitle.toUpperCase(),
                          style: styles.textStyleSettingsHeader.copyWith(
                            letterSpacing: 3,
                          ),
                        ),
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
                Expanded(
                  child: const WalletListWidget(),
                ),
              ],
            ),
          ),
          const IntroActionsWidget(),
        ],
      ),
    );
  }
}
