import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaspium_push/push.dart';

import '../app_providers.dart';
import '../kaspa/kaspa.dart';
import '../util/platform.dart';
import 'push_claim_inbox.dart';
import 'push_clock_offset.dart';
import 'push_identity.dart';
import 'push_service.dart';
import 'push_settings_notifier.dart';
import 'push_settings_repository.dart';
import 'push_sync_notifier.dart';
import 'push_token_notifier.dart';
import 'push_types.dart';

final pushSupportedProvider = FutureProvider((ref) async {
  if (!kPlatformIsAndroid && !kPlatformIsIOS) return false;
  return Push.instance.isSupported;
});

final pushAvailableProvider = Provider((ref) {
  final network = ref.watch(networkProvider);
  final supported = ref.watch(pushSupportedProvider).valueOrNull ?? false;

  return (network == .mainnet && supported);
});

final pushTokenSettingsProvider = NotifierProvider(
  PushTokenSettingsNotifier.new,
);

final pushTokenProvider = Provider((ref) {
  final push = ref.watch(pushTokenSettingsProvider);
  return push.token;
});

final clientIdProvider = Provider.autoDispose((ref) {
  final push = ref.watch(pushTokenSettingsProvider);
  return push.clientId;
});

final supportIdProvider = Provider.autoDispose((ref) {
  final clientId = ref.watch(clientIdProvider);
  return supportIdFor(clientId);
});

final pushClaimInboxProvider = Provider((_) => PushClaimInbox());

final pushServiceProvider = Provider.autoDispose((ref) {
  final claimInbox = ref.watch(pushClaimInboxProvider);
  final settings = ref.watch(settingsRepositoryProvider);
  return PushService(
    claimInbox: claimInbox,
    clockOffset: SettingsClockOffsetStore(settings),
    log: ref.watch(loggerProvider),
  );
});

final pushSettingsRepositoryProvider = Provider.autoDispose((ref) {
  final db = ref.watch(dbProvider);
  final box = db.getTypedBox<PushSettings>(db.pushSettingsBox);
  return PushSettingsRepository(box);
});

final accountIndexForNotificationsProvider = Provider.autoDispose((ref) {
  final addressNotifier = ref.watch(addressNotifierProvider);
  return addressNotifier.defaultReceiveAddress.index;
});

final accountIdForPushProvider = Provider.autoDispose((ref) {
  final clientId = ref.watch(clientIdProvider);
  final walletId = ref.watch(walletProvider.select((wallet) => wallet.wid));
  final accountIndex = ref.watch(accountIndexForNotificationsProvider);
  final networkId = ref.watch(networkIdProvider);

  final key = '$clientId#$walletId#$accountIndex#$networkId';
  final id = hash(key);

  return AccountId(id);
});

final addressesForPushProvider = Provider.autoDispose((ref) {
  final receiveAddresses = ref.watch(
    addressNotifierProvider.select((value) => value.receiveAddresses),
  );
  final preferences = ref.watch(
    pushSettingsProvider.select((settings) => settings.watchPreferences),
  );

  return preferences.watchedAddresses(
    receiveAddresses.reversed.map((a) => a.encoded),
  );
});

final pushSyncProvider = NotifierProvider.autoDispose(PushSyncNotifier.new);

final pushSettingsProvider = NotifierProvider.autoDispose(
  PushSettingsNotifier.new,
);

final pushEnabledProvider = Provider.autoDispose((ref) {
  final settings = ref.watch(pushSettingsProvider);
  return settings.pushEnabled;
});

final notificationTapProvider = StateProvider<PushTap?>((ref) => null);
