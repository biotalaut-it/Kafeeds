import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_types.freezed.dart';
part 'push_types.g.dart';

extension type PushToken(String id) implements String {}
extension type ClientId(String id) implements String {}
extension type AccountId(String id) implements String {}

typedef PushTap = ({AccountId accountId, String? txId});

@freezed
sealed class PushTokenSettings with _$PushTokenSettings {
  const PushTokenSettings._();

  const factory PushTokenSettings({
    required PushToken token,
    required ClientId clientId,
    required String privateKey,
    @Default(false) bool published,
  }) = _PushTokenSettings;

  factory PushTokenSettings.fromJson(Map<String, dynamic> json) =>
      _$PushTokenSettingsFromJson(json);
}

@freezed
sealed class PushOptions with _$PushOptions {
  const PushOptions._();

  const factory PushOptions({
    @Default(false) bool enabled,
  }) = _PushOptions;

  factory PushOptions.fromJson(Map<String, dynamic> json) =>
      _$PushOptionsFromJson(json);
}

const kMaxWatchedAddressesPerAccount = 100;

@freezed
sealed class WatchPreferences with _$WatchPreferences {
  const WatchPreferences._();

  const factory WatchPreferences({
    @Default(<String>{}) Set<String> pinnedAddresses,
    @Default(<String>{}) Set<String> excludedAddresses,
    @Default(true) bool autoWatch,
  }) = _WatchPreferences;

  factory WatchPreferences.derive({
    required Iterable<String> addresses,
    required Set<String> pinned,
    required Set<String> excluded,
  }) {
    final autoWatch = addresses.any(
      (a) => !pinned.contains(a) && !excluded.contains(a),
    );

    return WatchPreferences(
      pinnedAddresses: pinned,
      excludedAddresses: excluded,
      autoWatch: autoWatch,
    );
  }

  List<String> watchedAddresses(Iterable<String> newestFirst) {
    final watched = newestFirst.where(pinnedAddresses.contains).toList();
    final windowSize = kMaxWatchedAddressesPerAccount - watched.length;
    if (autoWatch && windowSize > 0) {
      final window = newestFirst
          .where(
            (a) =>
                !pinnedAddresses.contains(a) && !excludedAddresses.contains(a),
          )
          .take(windowSize);
      watched.addAll(window);
    }

    return watched.take(kMaxWatchedAddressesPerAccount).toList()..sort();
  }

  factory WatchPreferences.fromJson(Map<String, dynamic> json) =>
      _$WatchPreferencesFromJson(json);
}

@freezed
sealed class PushSettings with _$PushSettings {
  const PushSettings._();

  factory PushSettings({
    required AccountId accountId,
    required String walletId,
    required int index,
    @Default(PushOptions()) PushOptions options,
    @Default([]) List<String> addresses,
    @Default(WatchPreferences()) WatchPreferences watchPreferences,
    @Default(true) bool synced,
  }) = _PushInfo;

  bool get pushEnabled => options.enabled;

  factory PushSettings.fromJson(Map<String, dynamic> json) =>
      _$PushInfoFromJson(json);
}

@freezed
sealed class PushApiData with _$PushApiData {
  const factory PushApiData({
    PushToken? token,
    ClientId? clientId,
    AccountId? accountId,
    PushOptions? options,
    List<String>? addresses,
    int? ts,
    @Default(false) bool reset,
    String? claim,
  }) = _PushApiData;

  factory PushApiData.fromJson(Map<String, dynamic> json) =>
      _$PushApiDataFromJson(json);
}
