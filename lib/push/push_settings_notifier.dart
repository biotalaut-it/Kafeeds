import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import 'push_notifications.dart';
import 'push_service.dart';
import 'push_types.dart';

class PushSettingsNotifier extends AutoDisposeNotifier<PushSettings> {
  @override
  PushSettings build() {
    final repository = ref.watch(pushSettingsRepositoryProvider);
    final accountId = ref.watch(accountIdForPushProvider);

    final index = ref.watch(accountIndexForNotificationsProvider);
    final wallet = ref.watch(walletProvider);

    return repository.pushInfoForId(
      accountId,
      ifAbsent: () => PushSettings(
        accountId: accountId,
        walletId: wallet.wid,
        index: index,
        options: const PushOptions(),
      ),
    );
  }

  Future<void> setPush({required bool enabled}) async {
    if (state.pushEnabled == enabled) return;

    final tokenNotifier = ref.read(pushTokenSettingsProvider.notifier);
    final repository = ref.read(pushSettingsRepositoryProvider);
    final service = ref.read(pushServiceProvider);

    if (enabled) {
      final acquired = await acquirePushToken(ref);
      if (!acquired && ref.read(pushTokenProvider).isEmpty) {
        throw Exception('Failed to enable');
      }
    }

    final tokenSettings = ref.read(pushTokenSettingsProvider);

    if (!enabled && !repository.anyPushEnabledExcept(state.accountId)) {
      if (tokenSettings.token.isNotEmpty) {
        final result = await service.reset(
          clientId: tokenSettings.clientId,
          privateKey: tokenSettings.privateKey,
        );
        if (result == .retryable) throw Exception('Failed to disable');
      }

      await repository.clear();
      await forgetPushRegistration(
        tokenNotifier: tokenNotifier,
        log: ref.read(loggerProvider),
      );

      state = state.copyWith(
        options: const PushOptions(),
        addresses: [],
        watchPreferences: const WatchPreferences(),
        synced: true,
      );
      return;
    }

    final addresses = enabled
        ? state.watchPreferences.watchedAddresses(
            ref
                .read(addressNotifierProvider)
                .receiveAddresses
                .reversed
                .map((a) => a.encoded),
          )
        : <String>[];

    final options = PushOptions(enabled: enabled);
    var result = await service.updateSettings(
      pushToken: tokenSettings.published ? null : tokenSettings.token,
      clientId: tokenSettings.clientId,
      privateKey: tokenSettings.privateKey,
      accountId: state.accountId,
      options: options,
      addresses: addresses,
    );
    if (result == .unknownClient &&
        tokenSettings.published &&
        tokenSettings.token.isNotEmpty) {
      await repository.markEnabledUnsynced(except: state.accountId);
      await tokenNotifier.setPublished(false);
      result = await service.updateSettings(
        pushToken: tokenSettings.token,
        clientId: tokenSettings.clientId,
        privateKey: tokenSettings.privateKey,
        accountId: state.accountId,
        options: options,
        addresses: addresses,
      );
    }
    if (result == .claimPending) throw const PushClaimPendingException();

    if (!result.isSuccess) {
      throw Exception('Failed to ${enabled ? 'enable' : 'disable'}');
    }

    await tokenNotifier.setPublished(true);

    final settings = state.copyWith(
      options: options,
      addresses: addresses,
      synced: true,
    );

    await repository.setPushInfo(settings, id: state.accountId);

    state = settings;
  }

  void setWatchOverrides({
    required Set<String> pinned,
    required Set<String> excluded,
  }) {
    final preferences = WatchPreferences.derive(
      addresses: ref
          .read(addressNotifierProvider)
          .receiveAddresses
          .map((a) => a.encoded),
      pinned: pinned,
      excluded: excluded,
    );
    if (preferences == state.watchPreferences) return;

    final repository = ref.read(pushSettingsRepositoryProvider);
    final settings = state.copyWith(watchPreferences: preferences);
    repository.setPushInfo(settings, id: settings.accountId).catchError((_) {});
    state = settings;
  }

  Future<bool> markWatchedAddresses(List<String> addresses) async {
    if (!state.pushEnabled) return false;
    if (addresses.isEmpty) return false;
    if (listEquals(addresses, state.addresses)) return false;

    final repository = ref.read(pushSettingsRepositoryProvider);
    final settings = state.copyWith(addresses: addresses, synced: false);
    await repository.setPushInfo(settings, id: state.accountId);
    state = settings;

    return true;
  }

  Future<bool> resetSettings() async {
    try {
      final service = ref.read(pushServiceProvider);
      final tokenNotifier = ref.read(pushTokenSettingsProvider.notifier);
      final repository = ref.read(pushSettingsRepositoryProvider);
      final tokenSettings = ref.read(pushTokenSettingsProvider);

      if (tokenSettings.token.isNotEmpty) {
        final result = await service.reset(
          clientId: tokenSettings.clientId,
          privateKey: tokenSettings.privateKey,
        );
        if (result == .retryable) return false;
      }

      await repository.clear();
      await forgetPushRegistration(
        tokenNotifier: tokenNotifier,
        log: ref.read(loggerProvider),
      );

      state = state.copyWith(
        options: const PushOptions(),
        addresses: [],
        watchPreferences: const WatchPreferences(),
        synced: true,
      );
    } catch (_) {
      return false;
    }

    return true;
  }
}
