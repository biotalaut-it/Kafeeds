import 'dart:async';

import '../database/boxes.dart';
import 'push_types.dart';

class PushSettingsRepository {
  final TypedBox<PushSettings> box;

  PushSettingsRepository(this.box);

  bool get anyPushEnabled =>
      box.getAll().values.any((pushInfo) => pushInfo.pushEnabled);

  bool anyPushEnabledForWalletId(String walletId) => box.getAll().values.any(
    (pushInfo) => pushInfo.pushEnabled && pushInfo.walletId == walletId,
  );

  bool anyPushEnabledExcept(String accountId) => box.getAll().values.any(
    (pushInfo) => pushInfo.pushEnabled && pushInfo.accountId != accountId,
  );

  Iterable<PushSettings> get unsyncedSettings =>
      box.getAll().values.where((pushInfo) => !pushInfo.synced);

  Future<void> markEnabledUnsynced({String? except}) async {
    for (final settings in box.getAll().values) {
      if (!settings.pushEnabled || !settings.synced) continue;
      if (settings.accountId == except) continue;
      await box.set(settings.accountId, settings.copyWith(synced: false));
    }
  }

  PushSettings? settingsForAccount(String accountId) => box.tryGet(accountId);

  Iterable<PushSettings> settingsForWallet(String walletId) =>
      box.getAll().values.where((pushInfo) => pushInfo.walletId == walletId);

  Future<void> removePushInfo(String id) => box.remove(id);

  PushSettings pushInfoForId(
    String id, {
    required PushSettings Function() ifAbsent,
  }) =>
      box.tryGet(id) ??
      () {
        final pushInfo = ifAbsent();
        setPushInfo(pushInfo, id: id).catchError((_) {});
        return pushInfo;
      }();

  Future<void> setPushInfo(PushSettings pushInfo, {required String id}) =>
      box.set(id, pushInfo);

  Future<void> clear() => box.clear();
}
