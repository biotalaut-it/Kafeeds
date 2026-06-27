// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Utxo _$UtxoFromJson(Map json) => _Utxo(
  address: json['address'] as String,
  outpoint: Outpoint.fromJson(
    Map<String, dynamic>.from(json['outpoint'] as Map),
  ),
  utxoEntry: UtxoEntry.fromJson(
    Map<String, dynamic>.from(json['utxoEntry'] as Map),
  ),
);

Map<String, dynamic> _$UtxoToJson(_Utxo instance) => <String, dynamic>{
  'address': instance.address,
  'outpoint': instance.outpoint.toJson(),
  'utxoEntry': instance.utxoEntry.toJson(),
};

_UtxoEntry _$UtxoEntryFromJson(Map json) => _UtxoEntry(
  amount: BigInt.parse(json['amount'] as String),
  scriptPublicKey: ScriptPublicKey.fromJson(
    Map<String, dynamic>.from(json['scriptPublicKey'] as Map),
  ),
  blockDaaScore: BigInt.parse(json['blockDaaScore'] as String),
  isCoinbase: json['isCoinbase'] as bool,
  covenantId: maybeHexToBytes(json['covenantId'] as String?),
);

Map<String, dynamic> _$UtxoEntryToJson(_UtxoEntry instance) =>
    <String, dynamic>{
      'amount': instance.amount.toString(),
      'scriptPublicKey': instance.scriptPublicKey.toJson(),
      'blockDaaScore': instance.blockDaaScore.toString(),
      'isCoinbase': instance.isCoinbase,
      'covenantId': ?maybeBytesToHex(instance.covenantId),
    };

_ScriptPublicKey _$ScriptPublicKeyFromJson(Map json) => _ScriptPublicKey(
  scriptPublicKey: hexToBytes(json['scriptPublicKey'] as String),
  version: (json['version'] as num).toInt(),
);

Map<String, dynamic> _$ScriptPublicKeyToJson(_ScriptPublicKey instance) =>
    <String, dynamic>{
      'scriptPublicKey': bytesToHex(instance.scriptPublicKey),
      'version': instance.version,
    };

_Outpoint _$OutpointFromJson(Map json) => _Outpoint(
  transactionId: json['transactionId'] as String,
  index: (json['index'] as num).toInt(),
);

Map<String, dynamic> _$OutpointToJson(_Outpoint instance) => <String, dynamic>{
  'transactionId': instance.transactionId,
  'index': instance.index,
};

_TransactionInput _$TransactionInputFromJson(Map json) => _TransactionInput(
  transactionId: json['transaction_id'] as String,
  index: (json['index'] as num).toInt(),
  previousOutpointHash: json['previous_outpoint_hash'] as String,
  previousOutpointIndex: BigInt.parse(
    json['previous_outpoint_index'] as String,
  ),
  signatureScript: json['signature_script'] as String,
  sigOpCount: _sigOpCountFromJson(json['sig_op_count']),
  previousOutpointAddress: json['previous_outpoint_address'] as String?,
  previousOutpointAmount: (json['previous_outpoint_amount'] as num?)?.toInt(),
);

Map<String, dynamic> _$TransactionInputToJson(_TransactionInput instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'index': instance.index,
      'previous_outpoint_hash': instance.previousOutpointHash,
      'previous_outpoint_index': instance.previousOutpointIndex.toString(),
      'signature_script': instance.signatureScript,
      'sig_op_count': instance.sigOpCount,
      'previous_outpoint_address': ?instance.previousOutpointAddress,
      'previous_outpoint_amount': ?instance.previousOutpointAmount,
    };

_TransactionOutput _$TransactionOutputFromJson(Map json) => _TransactionOutput(
  transactionId: json['transaction_id'] as String,
  index: (json['index'] as num).toInt(),
  amount: (json['amount'] as num).toInt(),
  scriptPublicKey: json['script_public_key'] as String,
  scriptPublicKeyAddress: json['script_public_key_address'] as String,
  scriptPublicKeyType: json['script_public_key_type'] as String,
);

Map<String, dynamic> _$TransactionOutputToJson(_TransactionOutput instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'index': instance.index,
      'amount': instance.amount,
      'script_public_key': instance.scriptPublicKey,
      'script_public_key_address': instance.scriptPublicKeyAddress,
      'script_public_key_type': instance.scriptPublicKeyType,
    };

_Transaction _$TransactionFromJson(Map json) => _Transaction(
  subnetworkId: json['subnetwork_id'] as String?,
  transactionId: json['transaction_id'] as String,
  blockTime: (json['block_time'] as num).toInt(),
  isAccepted: json['is_accepted'] as bool,
  acceptingBlockHash: json['accepting_block_hash'] as String?,
  acceptingBlockBlueScore: (json['accepting_block_blue_score'] as num?)
      ?.toInt(),
  inputs:
      (json['inputs'] as List<dynamic>?)
          ?.map(
            (e) =>
                TransactionInput.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList() ??
      const [],
  outputs:
      (json['outputs'] as List<dynamic>?)
          ?.map(
            (e) =>
                TransactionOutput.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList() ??
      const [],
  payload: json['payload'] as String? ?? '',
);

Map<String, dynamic> _$TransactionToJson(_Transaction instance) =>
    <String, dynamic>{
      'subnetwork_id': ?instance.subnetworkId,
      'transaction_id': instance.transactionId,
      'block_time': instance.blockTime,
      'is_accepted': instance.isAccepted,
      'accepting_block_hash': ?instance.acceptingBlockHash,
      'accepting_block_blue_score': ?instance.acceptingBlockBlueScore,
      'inputs': instance.inputs.map((e) => e.toJson()).toList(),
      'outputs': instance.outputs.map((e) => e.toJson()).toList(),
      'payload': instance.payload,
    };
