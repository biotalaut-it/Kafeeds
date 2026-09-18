import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../database/database.dart';
import '../intro/intro_providers.dart';
import '../l10n/l10n.dart';
import '../util/ui_util.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExiting = useState(false);
    final splashStartedAt = useRef(DateTime.now());

    Future<void> finishSplash(VoidCallback route) async {
      if (isExiting.value) return;

      final elapsed = DateTime.now().difference(splashStartedAt.value);
      final remaining = const Duration(seconds: 3) - elapsed;
      if (remaining > Duration.zero) {
        await Future<void>.delayed(remaining);
      }

      if (!context.mounted) return;
      isExiting.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 360));
      if (!context.mounted) return;
      route();
    }

    Future<void> checkWalletStatus() async {
      final walletBundle = ref.read(walletBundleProvider);
      final wallet = walletBundle.selected;
      if (wallet == null) {
        if (walletBundle.wallets == null) {
          final vault = ref.read(vaultProvider);
          final pinIsSet = await vault.pinIsSet;
          // on iOS the Vault is not cleared on app uninstall
          // check if pin is set but wallets is null then reset vault and database
          if (pinIsSet) {
            await vault.deleteAll();
            final db = await Database.reset();
            ref.read(dbProvider.notifier).state = db;
          }
        }

        ref.read(introDataProvider.notifier).clear();

        if (!context.mounted) return;
        await finishSplash(() => appRouter.startIntro(context));
        return;
      }

      final authNotifier = ref.read(walletAuthNotifierProvider);
      if (authNotifier == null) {
        final l10n = l10nOf(context);
        UIUtil.showSnackbar(l10n.somethingWentWrong);
        await finishSplash(() => appRouter.startIntro(context));
        return;
      }

      await authNotifier.syncState();
      if (!context.mounted) return;

      if (authNotifier.walletIsLocked) {
        if (authNotifier.needsLegacyPasswordAuth) {
          await finishSplash(() => appRouter.requirePassword(context));
          return;
        }

        await finishSplash(() => appRouter.requireUnlock(context));
        return;
      }
      // open database boxes for selected wallet
      final walletRepository = ref.read(walletRepositoryProvider);
      final networkId = ref.read(networkIdProvider);
      await walletRepository.openWalletBoxes(wallet, networkId: networkId);

      if (!context.mounted) return;
      await finishSplash(() => appRouter.openWallet(context));
    }

    useEffect(() {
      Future.microtask(() async {
        //await checkNotice();
        checkWalletStatus();
      });
      return;
    }, const []);

    return Scaffold(
      backgroundColor: const Color(0xFF050B12),
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 320),
        opacity: isExiting.value ? 0 : 1,
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: Image(
                  image: AssetImage('assets/icon/icon.png'),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Powered by Kaspa',
                style: TextStyle(
                  color: Color(0xFFF2FBFF),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
