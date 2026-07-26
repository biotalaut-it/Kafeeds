// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tx_sync_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddressTxSync _$AddressTxSyncFromJson(Map json) => _AddressTxSync(
  address: json['address'] as String,
  newestBlockTime: (json['newestBlockTime'] as num?)?.toInt() ?? 0,
  oldestBlockTime: (json['oldestBlockTime'] as num?)?.toInt() ?? 0,
  backfilled: json['backfilled'] as bool? ?? false,
  lastSyncMs: (json['lastSyncMs'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$AddressTxSyncToJson(_AddressTxSync instance) =>
    <String, dynamic>{
      'address': instance.address,
      'newestBlockTime': instance.newestBlockTime,
      'oldestBlockTime': instance.oldestBlockTime,
      'backfilled': instance.backfilled,
      'lastSyncMs': instance.lastSyncMs,
    };
