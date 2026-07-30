import 'package:freezed_annotation/freezed_annotation.dart';

import '../types.dart';

part 'notifications.freezed.dart';

@freezed
sealed class UtxosChanged with _$UtxosChanged {
  const factory UtxosChanged({
    required Iterable<Utxo> added,
    required Iterable<Utxo> removed,
  }) = _UtxosChanged;

  static UtxosChanged merge(Iterable<UtxosChanged> changes) {
    final added = <Outpoint, Utxo>{};
    final removed = <Outpoint, Utxo>{};

    for (final change in changes) {
      for (final utxo in change.removed) {
        added.remove(utxo.outpoint);
        removed[utxo.outpoint] = utxo;
      }
      for (final utxo in change.added) {
        removed.remove(utxo.outpoint);
        added[utxo.outpoint] = utxo;
      }
    }
    return UtxosChanged(added: added.values, removed: removed.values);
  }
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
