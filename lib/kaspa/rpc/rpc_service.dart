import 'dart:async';

import '../types.dart';

abstract class RpcService {
  Future<void> connect();
  Future<void> disconnect();

  /// Server Info
  Future<ServerInfo> getServerInfo();

  /// Blocks
  Future<Block> getBlock(String hash, {bool includeTransactions});

  /// Virtual Chain From Block (vspc v2)
  Future<VirtualChainSegment> getVirtualChainFromBlockV2(
    String startHash, {
    DataVerbosity verbosity,
    int? minConfirmationCount,
  });

  /// Balances
  Future<Iterable<AddressBalance>> getBalancesByAddresses(
    Iterable<String> addresses,
  );

  /// Utxos
  Future<Iterable<Utxo>> getUtxosByAddresses(Iterable<String> addresses);

  /// Mempool
  Future<Iterable<MempoolEntryByAddress>> getMempoolEntriesByAddresses(
    Iterable<String> addresses, {
    bool filterTransactionPool,
    bool includeOrphanPool,
  });

  /// Fee Estimate
  Future<FeeEstimate> getFeeEstimate();

  /// Submit Transaction
  Future<String> submitTransaction(
    RawTransaction transaction, {
    bool allowOrphan,
  });

  Future<(String, Transaction)> submitTransactionReplacement(
    RawTransaction transaction,
  );

  /// Notifications

  /// Block Added
  Stream<Block> notifyBlockAdded();
  Future<void> stopNotifyingBlockAdded();

  /// Utxos Changed
  Stream<UtxosChanged> notifyUtxosChanged(Iterable<String> addresses);
  Future<void> stopNotifyingUtxosChanged(Iterable<String> addresses);

  /// Virtual DAA Score Changed
  Stream<BigInt> notifyVirtualDaaScoreChanged();
  Future<void> stopNotifyingVirtualDaaScoreChanged();

  /// Sink Blue Score Changed
  Stream<BigInt> notifySinkBlueScoreChanged();
  Future<void> stopNotifyingSinkBlueScoreChanged();

  /// Virtual Chain Changed
  Stream<VirtualChainChanged> notifyVirtualChainChanged({
    bool includeAcceptedTransactionIds,
  });
  Future<void> stopNotifyingVirtualChainChanged();
}
