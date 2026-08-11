import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/settings_providers.dart';
import '../settings/settings_repository.dart';
import 'push_identity.dart';
import 'push_types.dart';

const _kPushSettingsPushTokenSettings = '_kPushSettingsPushIdentity';

PushTokenSettings _freshTokenSettings() {
  final identity = generatePushIdentity();

  return PushTokenSettings(
    clientId: identity.clientId,
    privateKey: identity.privateKey,
    token: PushToken(''),
    published: true,
  );
}

extension PushSettingsExt on SettingsRepository {
  PushTokenSettings _getTokenSettings() {
    final settings = get(
      _kPushSettingsPushTokenSettings,
      typeFactory: PushTokenSettings.fromJson,
      ifAbsent: _freshTokenSettings,
    );

    return settings;
  }

  Future<void> _setTokenSettings(PushTokenSettings settings) =>
      box.set(_kPushSettingsPushTokenSettings, settings);
}

class PushTokenSettingsNotifier extends Notifier<PushTokenSettings> {
  @override
  PushTokenSettings build() {
    final repository = ref.watch(settingsRepositoryProvider);
    return repository._getTokenSettings();
  }

  Future<void> setToken(PushToken token) async {
    if (state.token == token) return;

    final settings = state.copyWith(
      token: token,
      published: false,
    );

    final repository = ref.read(settingsRepositoryProvider);
    await repository._setTokenSettings(settings);

    state = settings;
  }

  Future<void> setPublished(bool published) async {
    if (state.published == published) return;

    final settings = state.copyWith(published: published);

    final repository = ref.read(settingsRepositoryProvider);
    await repository._setTokenSettings(settings);

    state = settings;
  }

  Future<void> resetIdentity() async {
    final settings = _freshTokenSettings();

    final repository = ref.read(settingsRepositoryProvider);
    await repository._setTokenSettings(settings);

    state = settings;
  }

  PushTokenSettings get settings => state;
}
