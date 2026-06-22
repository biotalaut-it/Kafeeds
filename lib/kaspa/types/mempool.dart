import 'package:freezed_annotation/freezed_annotation.dart';

import 'transaction.dart';

part 'mempool.freezed.dart';

@freezed
sealed class MempoolEntry with _$MempoolEntry {
  const MempoolEntry._();
  const factory MempoolEntry({
    required int fee,
    required Transaction transaction,
    required bool isOrphan,
  }) = _MempoolEntry;
}

@freezed
sealed class MempoolEntryByAddress with _$MempoolEntryByAddress {
  const MempoolEntryByAddress._();
  const factory MempoolEntryByAddress({
    required String address,
    @Default([]) Iterable<MempoolEntry> sending,
    @Default([]) Iterable<MempoolEntry> receiving,
  }) = _MempoolEntryByAddress;
}
