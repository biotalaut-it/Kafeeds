import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../app_providers.dart';
import '../wallet/wallet_types.dart';
import 'push_notifications.dart';
import 'push_service.dart';
import 'push_settings_repository.dart';
import 'push_token_notifier.dart';
import 'push_types.dart';

Future<void> disablePushForWallet(
  WidgetRef ref, {
  required WalletInfo wallet,
}) async {
  final log = ref.read(loggerProvider);
  final repository = ref.read(pushSettingsRepositoryProvider);
  final service = ref.read(pushServiceProvider);
  final tokenNotifier = ref.read(pushTokenSettingsProvider.notifier);
  final bundle = ref.read(walletBundleProvider);

  final lastWallet =
      bundle.wallets?.every((info) => info.wid == wallet.wid) ?? true;

  final pending = <PushSettings>[];
  for (final settings in repository.settingsForWallet(wallet.wid)) {
    if (!settings.pushEnabled && settings.synced) {
      await repository.removePushInfo(settings.accountId);
      continue;
    }
    final disabled = settings.copyWith(
      options: const PushOptions(),
      addresses: [],
      synced: false,
    );
    await repository.setPushInfo(disabled, id: settings.accountId);
    pending.add(disabled);
  }

  if (pending.isEmpty && !lastWallet) return;

  unawaited(
    _deliver(
      log: log,
      repository: repository,
      service: service,
      tokenNotifier: tokenNotifier,
      pending: pending,
      lastWallet: lastWallet,
    ),
  );
}

Future<void> _deliver({
  required Logger log,
  required PushSettingsRepository repository,
  required PushService service,
  required PushTokenSettingsNotifier tokenNotifier,
  required List<PushSettings> pending,
  required bool lastWallet,
}) async {
  try {
    final tokenSettings = tokenNotifier.settings;
    if (tokenSettings.token.isEmpty) {
      if (lastWallet) {
        await repository.clear();
      } else {
        for (final settings in pending) {
          await repository.removePushInfo(settings.accountId);
        }
      }
      return;
    }

    if (lastWallet) {
      final result = await service.reset(
        clientId: tokenSettings.clientId,
        privateKey: tokenSettings.privateKey,
      );
      if (result.isPending) return;

      await repository.clear();
      await forgetPushRegistration(tokenNotifier: tokenNotifier, log: log);
      return;
    }

    for (final settings in pending) {
      final result = await service.updateSettings(
        pushToken: tokenSettings.published ? null : tokenSettings.token,
        clientId: tokenSettings.clientId,
        privateKey: tokenSettings.privateKey,
        accountId: settings.accountId,
        options: settings.options,
        addresses: settings.addresses,
      );
      if (result.isPending) continue;

      await repository.removePushInfo(settings.accountId);
    }
  } catch (e, st) {
    log.e('Push cleanup failed', error: e, stackTrace: st);
  }
}
