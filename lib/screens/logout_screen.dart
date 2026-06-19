import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../widgets/content_wrapper.dart';

class LogoutScreen extends HookConsumerWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    Future<void> logout() async {
      try {
        final notifier = ref.read(walletBundleProvider.notifier);
        final networkId = ref.read(networkIdProvider);
        await notifier.logout(networkId);
      } catch (e, st) {
        final log = ref.read(loggerProvider);
        log.e('Failed to logout', error: e, stackTrace: st);
      }

      if (!context.mounted) return;
      appRouter.reload(context);
    }

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 1000), logout);

      return null;
    }, const []);

    return ContentWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            l10n.loggingOutMessage,
            style: styles.textStyleSettingItemHeader.copyWith(fontSize: 18),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
