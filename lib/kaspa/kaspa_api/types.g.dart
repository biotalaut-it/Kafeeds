// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiAddressBalance _$ApiAddressBalanceFromJson(Map json) => _ApiAddressBalance(
  address: json['address'] as String,
  balance: (json['balance'] as num).toInt(),
);

Map<String, dynamic> _$ApiAddressBalanceToJson(_ApiAddressBalance instance) =>
    <String, dynamic>{'address': instance.address, 'balance': instance.balance};

_ApiUtxo _$ApiUtxoFromJson(Map json) => _ApiUtxo(
  address: json['address'] as String,
  outpoint: ApiOutpoint.fromJson(
    Map<String, dynamic>.from(json['outpoint'] as Map),
  ),
  utxoEntry: ApiUtxoEntry.fromJson(
    Map<String, dynamic>.from(json['utxoEntry'] as Map),
  ),
);

Map<String, dynamic> _$ApiUtxoToJson(_ApiUtxo instance) => <String, dynamic>{
  'address': instance.address,
  'outpoint': instance.outpoint.toJson(),
  'utxoEntry': instance.utxoEntry.toJson(),
};

_Outpoint _$OutpointFromJson(Map json) => _Outpoint(
  transactionId: json['transactionId'] as String,
  index: (json['index'] as num).toInt(),
);

Map<String, dynamic> _$OutpointToJson(_Outpoint instance) => <String, dynamic>{
  'transactionId': instance.transactionId,
  'index': instance.index,
};

_ApiUtxoEntry _$ApiUtxoEntryFromJson(Map json) => _ApiUtxoEntry(
  amount: BigInt.parse(json['amount'] as String),
  scriptPublicKey: ApiScriptPublicKey.fromJson(
    Map<String, dynamic>.from(json['scriptPublicKey'] as Map),
  ),
  blockDaaScore: BigInt.parse(json['blockDaaScore'] as String),
  isCoinbase: json['isCoinbase'] as bool? ?? false,
);

Map<String, dynamic> _$ApiUtxoEntryToJson(_ApiUtxoEntry instance) =>
    <String, dynamic>{
      'amount': instance.amount.toString(),
      'scriptPublicKey': instance.scriptPublicKey.toJson(),
      'blockDaaScore': instance.blockDaaScore.toString(),
      'isCoinbase': instance.isCoinbase,
    };

_ApiScriptPublicKey _$ApiScriptPublicKeyFromJson(Map json) =>
    _ApiScriptPublicKey(
      scriptPublicKey: json['scriptPublicKey'] as String,
      version: (json['version'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ApiScriptPublicKeyToJson(_ApiScriptPublicKey instance) =>
    <String, dynamic>{
      'scriptPublicKey': instance.scriptPublicKey,
      'version': instance.version,
    };

_ApiTxLink _$ApiTxLinkFromJson(Map json) => _ApiTxLink(
  txReceived: json['tx_received'] as String?,
  txSpent: json['tx_spent'] as String?,
);

Map<String, dynamic> _$ApiTxLinkToJson(_ApiTxLink instance) =>
    <String, dynamic>{
      'tx_received': ?instance.txReceived,
      'tx_spent': ?instance.txSpent,
    };

_ApiTxId _$ApiTxIdFromJson(Map json) => _ApiTxId(
  transactionId: json['transaction_id'] as String,
  blockTime: (json['block_time'] as num?)?.toInt(),
);

Map<String, dynamic> _$ApiTxIdToJson(_ApiTxId instance) => <String, dynamic>{
  'transaction_id': instance.transactionId,
  'block_time': ?instance.blockTime,
};
