import 'package:freezed_annotation/freezed_annotation.dart';

import 'transaction.dart';

part 'block.freezed.dart';

@freezed
sealed class BlockHeader with _$BlockHeader {
  const factory BlockHeader({
    //required String hash,
    required int version,
    //required Iterable<Iterable<String>> parentsByLevel,
    //required String hashMerkleRoot,
    //required String acceptedIdMerkleRoot,
    //required String utxoCommitment,
    required int timestamp,
    required int bits,
    required int nonce,
    required int daaScore,
    //required Iterable<int> blueWork,
    required int blueScore,
    //required String prunningPoint,
  }) = _BlockHeader;
}

@freezed
sealed class BlockVerboseData with _$BlockVerboseData {
  const factory BlockVerboseData({
    required String hash,
    required double difficulty,
    required String selectedParentHash,
    required Iterable<String> transactionIds,
    required bool isHeaderOnly,
    required int blueScore,
    //required Iterable<String> childrenHashes,
    //required Iterable<String> mergeSetBlueHashes,
    //required Iterable<String> mergeSetRedHashes,
    required bool isChainBlock,
  }) = _BlockVerboseData;
}

@freezed
sealed class Block with _$Block {
  const factory Block({
    required BlockHeader header,
    required Iterable<Transaction> transactions,
    BlockVerboseData? verboseData,
  }) = _Block;
}
