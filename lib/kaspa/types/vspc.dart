import 'package:freezed_annotation/freezed_annotation.dart';

import 'transaction.dart';

part 'vspc.freezed.dart';

enum DataVerbosity { none, low, high, full }

@freezed
sealed class ChainAcceptedTransactions with _$ChainAcceptedTransactions {
  const factory ChainAcceptedTransactions({
    required String chainBlockHash,
    required int blueScore,
    required int daaScore,
    required int timestamp,
    required Iterable<Transaction> acceptedTransactions,
  }) = _ChainAcceptedTransactions;
}

@freezed
sealed class VirtualChainSegment with _$VirtualChainSegment {
  const factory VirtualChainSegment({
    required Iterable<String> removedChainBlockHashes,
    required Iterable<String> addedChainBlockHashes,
    required Iterable<ChainAcceptedTransactions> chainBlocks,
  }) = _VirtualChainSegment;
}
