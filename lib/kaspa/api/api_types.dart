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
    int? lastTxBlockTime,
  }) = _ApiActiveAddress;

  factory ApiActiveAddress.fromJson(Map<String, dynamic> json) =>
      _$ApiActiveAddressFromJson(json);
}

abstract interface class ApiPage {
  int? get nextBefore;

  int? get nextAfter;

  Iterable<int> get blockTimes;

  bool get isEmpty;
  bool get isNotEmpty;
}

class ApiTxPage implements ApiPage {
  final List<ApiTransaction> txs;

  @override
  final int? nextBefore;
  @override
  final int? nextAfter;

  const ApiTxPage({
    required this.txs,
    this.nextBefore,
    this.nextAfter,
  });

  static const empty = ApiTxPage(txs: []);

  @override
  Iterable<int> get blockTimes => txs.map((tx) => tx.blockTime);

  @override
  bool get isEmpty => txs.isEmpty;
  @override
  bool get isNotEmpty => txs.isNotEmpty;
}

class ApiTxIdPage implements ApiPage {
  final List<ApiTxId> ids;

  @override
  final int? nextBefore;
  @override
  final int? nextAfter;

  const ApiTxIdPage({
    required this.ids,
    this.nextBefore,
    this.nextAfter,
  });

  static const empty = ApiTxIdPage(ids: []);

  @override
  Iterable<int> get blockTimes => ids.map((id) => id.blockTime);

  @override
  bool get isEmpty => ids.isEmpty;
  @override
  bool get isNotEmpty => ids.isNotEmpty;
}

@freezed
sealed class ApiTxId with _$ApiTxId {
  @JsonSerializable(fieldRename: .snake)
  const factory ApiTxId({
    required String transactionId,
    required int blockTime,
  }) = _ApiTxId;

  factory ApiTxId.fromJson(Map<String, dynamic> json) =>
      _$ApiTxIdFromJson(json);
}

typedef ApiTransaction = Transaction;
