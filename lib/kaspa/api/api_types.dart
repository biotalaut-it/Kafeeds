import 'package:freezed_annotation/freezed_annotation.dart';

import '../types/transaction.dart';

part 'api_types.freezed.dart';
part 'api_types.g.dart';

enum ResolvePreviousOutpoints { no, light, full }

@freezed
sealed class ApiActiveAddress with _$ApiActiveAddress {
  const factory ApiActiveAddress({
    required String address,
    required bool active,
  }) = _ApiActiveAddress;

  factory ApiActiveAddress.fromJson(Map<String, dynamic> json) =>
      _$ApiActiveAddressFromJson(json);
}

@freezed
sealed class ApiTxId with _$ApiTxId {
  @JsonSerializable(fieldRename: .snake)
  const factory ApiTxId({
    required String transactionId,
    int? blockTime,
  }) = _ApiTxId;

  factory ApiTxId.fromJson(Map<String, dynamic> json) =>
      _$ApiTxIdFromJson(json);
}

typedef ApiTransaction = Transaction;
