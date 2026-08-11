import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../widgets/content_wrapper.dart';

class SwitchWalletScreen extends HookConsumerWidget {
  final String walletId;

  const SwitchWalletScreen({super.key, required this.walletId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    Future<void> switchWallet() async {
      try {
        final notifier = ref.read(walletBundleProvider.notifier);
        final networkId = ref.read(networkIdProvider);

        final bundle = ref.read(walletBundleProvider);
        final wallet = bundle.wallets?.firstWhereOrNull(
          (wallet) => wallet.wid == walletId,
        );

        if (wallet != null) {
          await notifier.logout(networkId);
          await notifier.selectWallet(wallet, networkId);
        }
      } catch (e, st) {
        final log = ref.read(loggerProvider);
        log.e('Failed to switch wallet', error: e, stackTrace: st);
      }

      if (!context.mounted) return;
      appRouter.reload(context);
    }

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 1000), switchWallet);

      return null;
    }, const []);

    return ContentWrapper(
      child: Column(
        mainAxisAlignment: .spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: .center,
            children: [
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.4,
                  child: Image.asset('assets/kaspa.png'),
                ),
              ),
            ],
          ),
          Text(
            l10n.switchingWalletMessage,
            style: styles.textStyleSettingItemHeader.copyWith(fontSize: 18),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
