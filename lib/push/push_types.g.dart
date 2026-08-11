// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PushTokenSettings _$PushTokenSettingsFromJson(Map json) => _PushTokenSettings(
  token: json['token'] as PushToken,
  clientId: json['clientId'] as ClientId,
  privateKey: json['privateKey'] as String,
  published: json['published'] as bool? ?? false,
);

Map<String, dynamic> _$PushTokenSettingsToJson(_PushTokenSettings instance) =>
    <String, dynamic>{
      'token': instance.token,
      'clientId': instance.clientId,
      'privateKey': instance.privateKey,
      'published': instance.published,
    };

_PushOptions _$PushOptionsFromJson(Map json) =>
    _PushOptions(enabled: json['enabled'] as bool? ?? false);

Map<String, dynamic> _$PushOptionsToJson(_PushOptions instance) =>
    <String, dynamic>{'enabled': instance.enabled};

_WatchPreferences _$WatchPreferencesFromJson(Map json) => _WatchPreferences(
  pinnedAddresses:
      (json['pinnedAddresses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet() ??
      const <String>{},
  excludedAddresses:
      (json['excludedAddresses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet() ??
      const <String>{},
  autoWatch: json['autoWatch'] as bool? ?? true,
);

Map<String, dynamic> _$WatchPreferencesToJson(_WatchPreferences instance) =>
    <String, dynamic>{
      'pinnedAddresses': instance.pinnedAddresses.toList(),
      'excludedAddresses': instance.excludedAddresses.toList(),
      'autoWatch': instance.autoWatch,
    };

_PushInfo _$PushInfoFromJson(Map json) => _PushInfo(
  accountId: json['accountId'] as AccountId,
  walletId: json['walletId'] as String,
  index: (json['index'] as num).toInt(),
  options: json['options'] == null
      ? const PushOptions()
      : PushOptions.fromJson(Map<String, dynamic>.from(json['options'] as Map)),
  addresses:
      (json['addresses'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  watchPreferences: json['watchPreferences'] == null
      ? const WatchPreferences()
      : WatchPreferences.fromJson(
          Map<String, dynamic>.from(json['watchPreferences'] as Map),
        ),
  synced: json['synced'] as bool? ?? true,
);

Map<String, dynamic> _$PushInfoToJson(_PushInfo instance) => <String, dynamic>{
  'accountId': instance.accountId,
  'walletId': instance.walletId,
  'index': instance.index,
  'options': instance.options.toJson(),
  'addresses': instance.addresses,
  'watchPreferences': instance.watchPreferences.toJson(),
  'synced': instance.synced,
};

_PushApiData _$PushApiDataFromJson(Map json) => _PushApiData(
  token: json['token'] as PushToken?,
  clientId: json['clientId'] as ClientId?,
  accountId: json['accountId'] as AccountId?,
  options: json['options'] == null
      ? null
      : PushOptions.fromJson(Map<String, dynamic>.from(json['options'] as Map)),
  addresses: (json['addresses'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  ts: (json['ts'] as num?)?.toInt(),
  reset: json['reset'] as bool? ?? false,
  claim: json['claim'] as String?,
);

Map<String, dynamic> _$PushApiDataToJson(_PushApiData instance) =>
    <String, dynamic>{
      'token': ?instance.token,
      'clientId': ?instance.clientId,
      'accountId': ?instance.accountId,
      'options': ?instance.options?.toJson(),
      'addresses': ?instance.addresses,
      'ts': ?instance.ts,
      'reset': instance.reset,
      'claim': ?instance.claim,
    };
