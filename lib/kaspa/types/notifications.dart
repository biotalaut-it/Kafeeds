import 'package:freezed_annotation/freezed_annotation.dart';

import '../types.dart';

part 'notifications.freezed.dart';

@freezed
sealed class UtxosChanged with _$UtxosChanged {
  const factory UtxosChanged({
    required Iterable<Utxo> added,
    required Iterable<Utxo> removed,
  }) = _UtxosChanged;
}

@freezed
sealed class AcceptedTransactionIds with _$AcceptedTransactionIds {
  const factory AcceptedTransactionIds({
    required String acceptingBlockHash,
    required Iterable<String> acceptedTransactionIds,
  }) = _AcceptedTransactionIds;
}

@freezed
sealed class VirtualChainChanged with _$VirtualChainChanged {
  const factory VirtualChainChanged({
    required Iterable<String> removedChainBlockHashes,
    required Iterable<String> addedChainBlockHashes,
    required Iterable<AcceptedTransactionIds> acceptedTransactionIds,
  }) = _VirtualChainChanged;
}
