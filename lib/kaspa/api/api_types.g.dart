// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiActiveAddress _$ApiActiveAddressFromJson(Map json) => _ApiActiveAddress(
  address: json['address'] as String,
  active: json['active'] as bool,
  lastTxBlockTime: (json['lastTxBlockTime'] as num?)?.toInt(),
);

Map<String, dynamic> _$ApiActiveAddressToJson(_ApiActiveAddress instance) =>
    <String, dynamic>{
      'address': instance.address,
      'active': instance.active,
      'lastTxBlockTime': ?instance.lastTxBlockTime,
    };

_ApiTxId _$ApiTxIdFromJson(Map json) => _ApiTxId(
  transactionId: json['transaction_id'] as String,
  blockTime: (json['block_time'] as num).toInt(),
);

Map<String, dynamic> _$ApiTxIdToJson(_ApiTxId instance) => <String, dynamic>{
  'transaction_id': instance.transactionId,
  'block_time': instance.blockTime,
};
