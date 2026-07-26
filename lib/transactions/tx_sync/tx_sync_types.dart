import 'package:freezed_annotation/freezed_annotation.dart';

part 'tx_sync_types.freezed.dart';
part 'tx_sync_types.g.dart';

enum TxSyncAction {
  none,

  backfill,

  fetchForward,
}

@freezed
sealed class TxSyncProgress with _$TxSyncProgress {
  const TxSyncProgress._();

  const factory TxSyncProgress({
    @Default(0) int completed,
    @Default(0) int total,
  }) = _TxSyncProgress;

  static const idle = TxSyncProgress();

  bool get isSyncing => completed < total;
}

@freezed
sealed class AddressTxSync with _$AddressTxSync {
  const AddressTxSync._();

  const factory AddressTxSync({
    required String address,
    @Default(0) int newestBlockTime,
    @Default(0) int oldestBlockTime,
    @Default(false) bool backfilled,
    @Default(0) int lastSyncMs,
  }) = _AddressTxSync;

  factory AddressTxSync.fromJson(Map<String, dynamic> json) =>
      _$AddressTxSyncFromJson(json);

  TxSyncAction get pendingAction =>
      actionFor(active: true, lastTxBlockTime: newestBlockTime);

  TxSyncAction actionFor({required bool active, int? lastTxBlockTime}) {
    if (!active || lastTxBlockTime == null) {
      return .none;
    }
    if (!backfilled) {
      return .backfill;
    }
    if (lastTxBlockTime > newestBlockTime) {
      return .fetchForward;
    }
    return .none;
  }
}
