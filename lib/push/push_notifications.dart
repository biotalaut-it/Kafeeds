import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaspium_push/push.dart';
import 'package:logger/logger.dart';

import '../app_providers.dart';
import '../util/platform.dart';
import 'push_token_notifier.dart';
import 'push_types.dart';

String? _getClaimNonce(Map<String, Object?>? data) {
  if (data case {'type': 'push_claim', 'nonce': final String nonce}) {
    return nonce;
  }
  return null;
}

PushTap? _getTapFromData(Map<String, Object?> data) {
  if (data case {'data': final Map<String, Object?> nested}) {
    return _getTapFromData(nested);
  }
  if (data case {'id': String id}) {
    final txId = data['txId'];
    return (accountId: AccountId(id), txId: txId is String ? txId : null);
  }
  return null;
}

Future<PushToken> _serverTokenFor(String token) async {
  if (!kPlatformIsIOS && !kPlatformIsMacOS) return PushToken(token);

  final environment = await Push.instance.apnsEnvironment;
  return switch (environment) {
    .production => PushToken('p_$token'),
    .sandbox => PushToken('s_$token'),
  };
}

Future<bool> acquirePushToken(Ref ref) async {
  if (!kPlatformIsAndroid && !kPlatformIsIOS) return false;

  try {
    final push = Push.instance;
    if (kPlatformIsIOS) push.registerForRemoteNotifications();

    final token = await push.token;
    if (token == null || token.isEmpty) return false;

    final pushToken = await _serverTokenFor(token);
    final notifier = ref.read(pushTokenSettingsProvider.notifier);
    await notifier.setToken(pushToken);

    return true;
  } catch (e, st) {
    final log = ref.read(loggerProvider);
    log.e('Failed to acquire push token', error: e, stackTrace: st);
    return false;
  }
}

Future<void> forgetPushRegistration({
  required PushTokenSettingsNotifier tokenNotifier,
  required Logger log,
}) async {
  try {
    final push = Push.instance;
    if (kPlatformIsIOS) {
      push.unregisterForRemoteNotifications();
    } else if (kPlatformIsAndroid) {
      await push.deleteToken();
    }
  } catch (e, st) {
    log.e('Failed to release the push token', error: e, stackTrace: st);
  }
  await tokenNotifier.resetIdentity();
}

void Function() setupPushNotifications(WidgetRef ref) {
  final push = Push.instance;

  Future<void> onNewToken(String token) async {
    final pushToken = await _serverTokenFor(token);
    final notifier = ref.read(pushTokenSettingsProvider.notifier);
    await notifier.setToken(pushToken);
  }

  final cancelOnNewToken = push.addOnNewToken(onNewToken);

  push.notificationTapWhichLaunchedAppFromTerminated.then((data) {
    if (data == null) return;

    final tap = _getTapFromData(data);
    if (tap == null) return;

    final notifier = ref.read(notificationTapProvider.notifier);
    notifier.state = tap;
  });

  final cancelOnNotificationTap = push.addOnNotificationTap((data) {
    final tap = _getTapFromData(data);
    if (tap == null) return;

    final notifier = ref.read(notificationTapProvider.notifier);
    notifier.state = tap;
  });

  final cancelOnMessage = push.addOnMessage((message) {
    final nonce = _getClaimNonce(message.data);
    if (nonce == null) return;

    ref.read(pushClaimInboxProvider).submit(nonce);
  });

  return () {
    cancelOnNewToken();
    cancelOnNotificationTap();
    cancelOnMessage();
  };
}
