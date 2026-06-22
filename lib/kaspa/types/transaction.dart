import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
sealed class Utxo with _$Utxo {
  const Utxo._();
  const factory Utxo({
    required String address,
    required Outpoint outpoint,
    required UtxoEntry utxoEntry,
  }) = _Utxo;

  factory Utxo.fromJson(Map<String, dynamic> json) => _$UtxoFromJson(json);
}

// blockDaaScore can change
@Freezed(equal: false)
sealed class UtxoEntry with _$UtxoEntry {
  const UtxoEntry._();
  const factory UtxoEntry({
    required BigInt amount,
    required ScriptPublicKey scriptPublicKey,
    required BigInt blockDaaScore,
    required bool isCoinbase,
  }) = _UtxoEntry;

  factory UtxoEntry.fromJson(Map<String, dynamic> json) =>
      _$UtxoEntryFromJson(json);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UtxoEntry &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.scriptPublicKey, scriptPublicKey) ||
                other.scriptPublicKey == scriptPublicKey) &&
            (identical(other.isCoinbase, isCoinbase) ||
                other.isCoinbase == isCoinbase));
  }

  @JsonKey(includeToJson: false, includeFromJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, scriptPublicKey, isCoinbase);
}

@freezed
sealed class ScriptPublicKey with _$ScriptPublicKey {
  const ScriptPublicKey._();
  const factory ScriptPublicKey({
    @JsonKey(fromJson: hexToBytes, toJson: bytesToHex)
    required Uint8List scriptPublicKey,
    /*uint16*/ required int version,
  }) = _ScriptPublicKey;

  factory ScriptPublicKey.fromJson(Map<String, dynamic> json) =>
      _$ScriptPublicKeyFromJson(json);
}

@freezed
sealed class Outpoint with _$Outpoint {
  Outpoint._();
  factory Outpoint({
    required String transactionId,
    required int /*uint32*/ index,
  }) = _Outpoint;

  factory Outpoint.fromJson(Map<String, dynamic> json) =>
      _$OutpointFromJson(json);
}

int _sigOpCountFromJson(Object? value) {
  if (value is int) {
    return value;
  }
  if (value is String) {
    return int.tryParse(value) ?? 0;
  }
  return 0;
}

@freezed
sealed class TransactionInput with _$TransactionInput {
  @JsonSerializable(fieldRename: .snake)
  const factory TransactionInput({
    required String transactionId,
    required int index,
    required String previousOutpointHash,
    required BigInt previousOutpointIndex,
    required String signatureScript,
    @JsonKey(fromJson: _sigOpCountFromJson) required int sigOpCount,
    // new fields
    String? previousOutpointAddress,
    int? previousOutpointAmount,
  }) = _TransactionInput;

  factory TransactionInput.fromJson(Map<String, dynamic> json) =>
      _$TransactionInputFromJson(json);
}

@freezed
sealed class TransactionOutput with _$TransactionOutput {
  @JsonSerializable(fieldRename: .snake)
  const factory TransactionOutput({
    required String transactionId,
    required int index,
    required int amount,
    required String scriptPublicKey,
    required String scriptPublicKeyAddress,
    required String scriptPublicKeyType,
  }) = _TransactionOutput;

  factory TransactionOutput.fromJson(Map<String, dynamic> json) =>
      _$TransactionOutputFromJson(json);
}

@freezed
sealed class Transaction with _$Transaction {
  const Transaction._();

  @JsonSerializable(fieldRename: .snake)
  factory Transaction({
    String? subnetworkId,
    required String transactionId,
    @Default([]) List<String> blockHash,
    required int blockTime,
    required bool isAccepted,
    String? acceptingBlockHash,
    int? acceptingBlockBlueScore,
    @Default([]) List<TransactionInput> inputs,
    @Default([]) List<TransactionOutput> outputs,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  bool get isCoinbase => inputs.isEmpty;
}
