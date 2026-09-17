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
    final splashController = useAnimationController(
      duration: const Duration(milliseconds: 1700),
    );
    final isExiting = useState(false);

    Future<void> finishSplash(VoidCallback route) async {
      if (isExiting.value) return;
      isExiting.value = true;
      await Future<void>.delayed(const Duration(milliseconds: 1200));
      await Future<void>.delayed(const Duration(milliseconds: 320));
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
      splashController.forward();
      Future.microtask(() async {
        //await checkNotice();
        checkWalletStatus();
      });
      return;
    }, const []);

    final logoCurve = CurvedAnimation(
      parent: splashController,
      curve: const Interval(0, 0.32, curve: Curves.easeOutCubic),
    );
    final titleCurve = CurvedAnimation(
      parent: splashController,
      curve: const Interval(0.20, 0.52, curve: Curves.easeOut),
    );
    final taglineCurve = CurvedAnimation(
      parent: splashController,
      curve: const Interval(0.32, 0.64, curve: Curves.easeOut),
    );
    final exitCurve = CurvedAnimation(
      parent: splashController,
      curve: const Interval(0.78, 1, curve: Curves.easeIn),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF050B12),
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 320),
        opacity: isExiting.value ? 0 : 1,
        child: Stack(
          fit: StackFit.expand,
          children: [
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF050B12), Color(0xFF071521)],
                ),
              ),
            ),
            SafeArea(
              child: Center(
                child: FractionallySizedBox(
                  heightFactor: 0.90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScaleTransition(
                        scale: Tween<double>(begin: 0.88, end: 1).animate(logoCurve),
                        child: FadeTransition(
                          opacity: logoCurve,
                          child: Container(
                            width: 96,
                            height: 96,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF18D8E8).withValues(alpha: 0.16),
                                  blurRadius: 34,
                                  spreadRadius: 8,
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/kaspa_transparent_180.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      FadeTransition(
                        opacity: titleCurve,
                        child: const Text(
                          'Kafeeds',
                          style: TextStyle(
                            color: Color(0xFFF2FBFF),
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      FadeTransition(
                        opacity: taglineCurve,
                        child: const Text(
                          'POWERED BY KASPA',
                          style: TextStyle(
                            color: Color(0xFF25D9E8),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            IgnorePointer(child: FadeTransition(opacity: exitCurve, child: const SizedBox.expand())),
          ],
        ),
      ),
    );
  }
}
