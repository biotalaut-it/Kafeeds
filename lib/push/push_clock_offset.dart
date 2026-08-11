import '../settings/settings_repository.dart';

abstract class ClockOffsetStore {
  int get offsetMs;

  Future<void> save(int offsetMs);
}

const _kPushClockOffsetMs = '_kPushClockOffsetMs';

class SettingsClockOffsetStore implements ClockOffsetStore {
  final SettingsRepository repository;

  SettingsClockOffsetStore(this.repository);

  @override
  int get offsetMs => repository.get(_kPushClockOffsetMs, ifAbsent: () => 0);

  @override
  Future<void> save(int offsetMs) =>
      repository.box.set(_kPushClockOffsetMs, offsetMs);
}
