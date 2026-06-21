import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../intro/intro.dart';
import '../intro/intro_providers.dart';
import '../intro/intro_types.dart';
import '../intro/intro_wallet_name.dart';
import '../l10n/l10n.dart';
import '../widgets/pin_screen.dart';

class IntroScreen extends HookConsumerWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletBundle = ref.watch(walletBundleProvider);

    Future<bool> checkPin() async {
      final l10n = l10nOf(context);

      final vault = ref.read(vaultProvider);
      final pinIsSet = await vault.pinIsSet;

      if (!context.mounted) return false;

      if (pinIsSet) {
        final authUtil = ref.read(authUtilProvider);
        final auth = authUtil.authenticate(
          context,
          l10n.authPinMessage,
          l10n.authBiometricMessage,
        );
        return auth;
      }

      final pin = await appRouter.push(
        context,
        MaterialPageRoute<String>(
          builder: (_) => PinScreen(.NEW_PIN, l10n: l10n),
        ),
      );
      if (pin != null && pin.length > 5) {
        try {
          await vault.setPin(pin);
          return true;
        } catch (e, st) {
          final log = ref.read(loggerProvider);
          log.e('Failed to save pin to vault', error: e, stackTrace: st);
          return false;
        }
      }
      return false;
    }

    ref.listen<IntroData>(introDataProvider, (_, data) async {
      if (!data.completed) {
        return;
      }
      final pinOk = await checkPin();

      if (!context.mounted) return;

      if (!pinOk) {
        final notifier = ref.read(introDataProvider.notifier);
        notifier.unComplete();
        return;
      }

      appRouter.setupWallet(context);
    });

    Widget widgetForPage(IntroPage page) {
      return switch (page) {
        .walletName => const IntroWalletName(),
        .passwordOnLaunch => const IntroPasswordOnLaunch(),
        .password => const IntroPassword(),
        .importSelect => const IntroImportSelect(),
        .importSeed => const IntroImportSeed(),
        .importLegacySeed => const IntroImportSeed(isLegacy: true),
        .importKpub => const IntroImportKpub(),
        .backupSeed => const IntroBackupSeed(),
        .backupSafety => const IntroBackupSafety(),
        .backupConfirm => const IntroBackupConfirm(),
      };
    }

    ref.listen<IntroState>(introStateProvider, (_, state) {
      state.whenOrNull(
        push: (page) {
          final widget = widgetForPage(page);
          appRouter.push(
            context,
            MaterialPageRoute(builder: (_) => widget),
          );
        },
        pop: () => appRouter.pop(context),
      );
    });

    final wallets = walletBundle.wallets;
    if (wallets != null && wallets.isNotEmpty) {
      return const IntroWallets();
    }
    return const IntroWelcome();
  }
}
