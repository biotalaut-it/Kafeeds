import 'package:freezed_annotation/freezed_annotation.dart';

import '../types/transaction.dart';

part 'types.freezed.dart';
part 'types.g.dart';

enum ResolvePreviousOutpoints {
  no,
  light,
  full,
}

@freezed
sealed class ApiAddressBalance with _$ApiAddressBalance {
  const factory ApiAddressBalance({
    required String address,
    required int balance,
  }) = _ApiAddressBalance;

  factory ApiAddressBalance.fromJson(Map<String, dynamic> json) =>
      _$ApiAddressBalanceFromJson(json);
}

@freezed
sealed class ApiUtxo with _$ApiUtxo {
  const factory ApiUtxo({
    required String address,
    required ApiOutpoint outpoint,
    required ApiUtxoEntry utxoEntry,
  }) = _ApiUtxo;

  factory ApiUtxo.fromJson(Map<String, dynamic> json) =>
      _$ApiUtxoFromJson(json);
}

@freezed
sealed class ApiOutpoint with _$ApiOutpoint {
  const factory ApiOutpoint({
    required String transactionId,
    required int index,
  }) = _Outpoint;

  factory ApiOutpoint.fromJson(Map<String, dynamic> json) =>
      _$ApiOutpointFromJson(json);
}

@freezed
sealed class ApiUtxoEntry with _$ApiUtxoEntry {
  const factory ApiUtxoEntry({
    required BigInt amount,
    required ApiScriptPublicKey scriptPublicKey,
    required BigInt blockDaaScore,
    @Default(false) bool isCoinbase,
  }) = _ApiUtxoEntry;

  factory ApiUtxoEntry.fromJson(Map<String, dynamic> json) =>
      _$ApiUtxoEntryFromJson(json);
}

@freezed
sealed class ApiScriptPublicKey with _$ApiScriptPublicKey {
  const factory ApiScriptPublicKey({
    required String scriptPublicKey,
    @Default(0) int version,
  }) = _ApiScriptPublicKey;

  factory ApiScriptPublicKey.fromJson(Map<String, dynamic> json) =>
      _$ApiScriptPublicKeyFromJson(json);
}

@freezed
sealed class ApiTxLink with _$ApiTxLink {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ApiTxLink({
    String? txReceived,
    String? txSpent,
  }) = _ApiTxLink;

  factory ApiTxLink.fromJson(Map<String, dynamic> json) =>
      _$ApiTxLinkFromJson(json);
}

@freezed
sealed class ApiTxId with _$ApiTxId {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ApiTxId({
    required String transactionId,
    int? blockTime,
  }) = _ApiTxId;

  factory ApiTxId.fromJson(Map<String, dynamic> json) =>
      _$ApiTxIdFromJson(json);
}

typedef ApiTransaction = Transaction;
