import 'dart:async';

import 'package:logger/logger.dart';

import '../kaspa/kaspa.dart';

typedef TxsAcceptedCallback = Future<void> Function(List<Transaction> txs);
typedef TxIdsCallback = Future<void> Function(Set<String> txIds);
typedef AddressesCallback = Future<void> Function(Set<String> addresses);

class TxMonitor {
  final RpcService rpc;

  final bool Function(String txId) isWalletTxId;
  final bool Function(Transaction tx) isWalletTx;

  final TxsAcceptedCallback onTxsAccepted;
  final TxIdsCallback onTxsUnaccepted;
  final TxIdsCallback onWatchesExpired;
  final AddressesCallback onOutpointsExpired;

  final Duration pullLag;
  final Duration watchTimeout;
  final Duration reorgGracePeriod;

  final DateTime Function() _now;
  final Logger? log;

  TxMonitor({
    required this.rpc,
    required this.isWalletTxId,
    required this.isWalletTx,
    required this.onTxsAccepted,
    required this.onTxsUnaccepted,
    required this.onWatchesExpired,
    required this.onOutpointsExpired,
    this.pullLag = const Duration(seconds: 15),
    this.watchTimeout = const Duration(seconds: 60),
    this.reorgGracePeriod = const Duration(seconds: 2),
    this.log,
    DateTime Function()? now,
  }) : _now = now ?? DateTime.now;

  bool disposed = false;

  final _watched = <String, DateTime>{};
  final _watchedOutpoints = <Outpoint, (DateTime, String)>{};
  final _recentAccepted = <String, DateTime>{};
  final _tipHistory = <(String, DateTime)>[];
  final _acceptedWalletTxs = <String, Set<String>>{};
  final _pendingUnaccepts = <String, DateTime>{};

  static const _maxAcceptedBlocks = 1000;

  bool _pulling = false;
  bool _pullAgain = false;

  void dispose() => disposed = true;

  Future<void> watch(String txId) async {
    if (disposed || !_addWatch(txId)) {
      return;
    }

    if (_recentAccepted.containsKey(txId)) {
      await _schedulePull();
    }
  }

  bool _addWatch(String txId) {
    if (_watched.containsKey(txId)) {
      return false;
    }
    _watched[txId] = _now();
    return true;
  }

  Future<void> watchSpentUtxos(Iterable<Utxo> utxos) async {
    if (disposed) return;

    final now = _now();
    bool added = false;
    for (final utxo in utxos) {
      if (_watchedOutpoints.containsKey(utxo.outpoint)) continue;
      _watchedOutpoints[utxo.outpoint] = (now, utxo.address);
      added = true;
    }

    if (added) {
      log?.d(
        'TxMonitor - watching ${_watchedOutpoints.length} spent outpoints',
      );
      await _schedulePull();
    }
  }

  bool _unwatchOutpointsOf(Transaction tx) {
    if (_watchedOutpoints.isEmpty) return false;
    bool found = false;
    for (final input in tx.inputs) {
      if (_watchedOutpoints.remove(input.previousOutpoint) != null) {
        found = true;
      }
    }
    return found;
  }

  Future<void> onVirtualChainChanged(VirtualChainChanged message) async {
    if (disposed) return;
    final now = _now();

    if (message.removedChainBlockHashes.isNotEmpty) {
      await _handleReorg(message.removedChainBlockHashes);
      if (disposed) return;
    }

    bool hit = false;
    for (final accepted in message.acceptedTransactionIds) {
      for (final id in accepted.acceptedTransactionIds) {
        _recentAccepted[id] = now;
        if (_watched.containsKey(id) || isWalletTxId(id)) {
          hit = true;
          _addWatch(id);
        }
      }
    }

    if (message.addedChainBlockHashes.isNotEmpty) {
      _tipHistory.add((message.addedChainBlockHashes.last, now));
    }

    _prune(now);

    await _sweepExpiredWatches();
    if (disposed) return;

    hit = hit || _watchedOutpoints.isNotEmpty;

    if (hit) {
      await _schedulePull();
      if (disposed) return;
    }

    await _sweepPendingUnaccepts(now);
  }

  String? _anchor() {
    if (_tipHistory.isEmpty) {
      return null;
    }
    final cutoff = _now().subtract(pullLag);
    String? anchor;
    for (final (hash, time) in _tipHistory) {
      if (!time.isBefore(cutoff)) break;
      anchor = hash;
    }
    return anchor ?? _tipHistory.first.$1;
  }

  Future<void> _schedulePull() async {
    if (_pulling) {
      _pullAgain = true;
      return;
    }
    _pulling = true;
    try {
      do {
        _pullAgain = false;
        await _pull();
      } while (_pullAgain && !disposed);
    } finally {
      _pulling = false;
    }
  }

  Future<void> _pull() async {
    final startHash = _anchor();
    if (startHash == null) {
      log?.d('TxMonitor - no anchor to pull from yet');
      return;
    }

    final VirtualChainSegment segment;
    try {
      segment = await rpc.getVirtualChainFromBlockV2(startHash);
    } catch (e) {
      if (disposed) return;
      log?.e('TxMonitor - pull from $startHash failed', error: e);
      _tipHistory.clear();
      return;
    }
    if (disposed) return;

    await _processSegment(segment);
  }

  Future<void> _processSegment(VirtualChainSegment segment) async {
    if (segment.removedChainBlockHashes.isNotEmpty) {
      await _handleReorg(segment.removedChainBlockHashes);
      if (disposed) return;
    }

    final accepted = <Transaction>[];
    for (final block in segment.chainBlocks) {
      final delivered = _acceptedWalletTxs[block.chainBlockHash] ??= {};
      for (final tx in block.acceptedTransactions) {
        final id = tx.transactionId;
        final spendsWatched = _unwatchOutpointsOf(tx);
        if (delivered.contains(id)) continue;

        final relevant =
            _watched.containsKey(id) ||
            spendsWatched ||
            isWalletTxId(id) ||
            isWalletTx(tx);
        if (!relevant) continue;

        accepted.add(tx);
        delivered.add(id);
        _watched.remove(id);
        _pendingUnaccepts.remove(id);
      }
    }

    while (_acceptedWalletTxs.length > _maxAcceptedBlocks) {
      _acceptedWalletTxs.remove(_acceptedWalletTxs.keys.first);
    }

    if (_watchedOutpoints.isNotEmpty) {
      log?.d(
        'TxMonitor - segment of ${segment.chainBlocks.length} blocks '
        'left ${_watchedOutpoints.length} outpoints unresolved',
      );
    }

    if (accepted.isNotEmpty) {
      log?.d(
        'TxMonitor - delivering '
        '${accepted.map((tx) => tx.transactionId).join(', ')}',
      );
      unawaited(onTxsAccepted(accepted));
    }
  }

  Future<void> _handleReorg(Iterable<String> removedHashes) async {
    final removed = Set.of(removedHashes);
    _tipHistory.removeWhere((tip) => removed.contains(tip.$1));

    final txIds = <String>{};
    for (final hash in removed) {
      final ids = _acceptedWalletTxs.remove(hash);
      if (ids != null) txIds.addAll(ids);
    }
    if (txIds.isEmpty) {
      return;
    }

    final now = _now();
    for (final id in txIds) {
      _watched[id] = now;
      _pendingUnaccepts.putIfAbsent(id, () => now);
    }
  }

  Future<void> _sweepPendingUnaccepts(DateTime now) async {
    if (_pendingUnaccepts.isEmpty) return;

    final cutoff = now.subtract(reorgGracePeriod);
    final expired = <String>{};
    _pendingUnaccepts.removeWhere((id, time) {
      if (!time.isBefore(cutoff)) return false;
      expired.add(id);
      return true;
    });
    if (expired.isEmpty) return;

    unawaited(onTxsUnaccepted(expired));
  }

  Future<void> _sweepExpiredWatches() async {
    final now = _now();
    final cutoff = now.subtract(watchTimeout);
    final outpointCutoff = now.subtract(pullLag * 2);
    final lostAddresses = <String>{};
    _watchedOutpoints.removeWhere((_, watch) {
      if (!watch.$1.isBefore(outpointCutoff)) return false;
      lostAddresses.add(watch.$2);
      return true;
    });
    if (lostAddresses.isNotEmpty) {
      log?.w('TxMonitor - recovering spends from $lostAddresses via the api');
      unawaited(onOutpointsExpired(lostAddresses));
    }
    final expired = <String>{};
    _watched.removeWhere((id, time) {
      if (!time.isBefore(cutoff)) return false;
      expired.add(id);
      return true;
    });
    await _expireWatches(expired);
  }

  Future<void> _expireWatches(Set<String> txIds) async {
    if (txIds.isEmpty) {
      return;
    }
    log?.d('TxMonitor - expiring watches for ${txIds.join(', ')}');
    for (final id in txIds) {
      _watched.remove(id);
    }
    unawaited(onWatchesExpired(txIds));
  }

  void _prune(DateTime now) {
    final tipCutoff = now.subtract(pullLag);
    while (_tipHistory.length > 1 && _tipHistory[1].$2.isBefore(tipCutoff)) {
      _tipHistory.removeAt(0);
    }

    final acceptedCutoff = now.subtract(watchTimeout + pullLag);
    _recentAccepted.removeWhere((_, time) => time.isBefore(acceptedCutoff));
  }
}
