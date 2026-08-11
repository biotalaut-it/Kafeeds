import '../database/boxes.dart';

class SettingsRepository {
  final GenericBox box;
  const SettingsRepository(this.box);

  Future<void> remove(String key) => box.remove(key);

  T get<T>(
    String key, {
    TypeFactory<T>? typeFactory,
    required T Function() ifAbsent,
  }) =>
      box.tryGet(key, typeFactory: typeFactory) ??
      () {
        final value = ifAbsent();
        box.set(key, value).catchError((_) {});
        return value;
      }();
}
