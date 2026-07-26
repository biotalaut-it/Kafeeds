import 'dart:async';
import 'dart:math';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:logger/logger.dart';

import '../kaspa/kaspa.dart';
import '../util/async_lock.dart';
import '../util/safe_change_notifier.dart';
import 'transaction_types.dart';
import 'tx_cache_service.dart';
import 'tx_sync/address_tx_sync_store.dart';
import 'tx_sync/address_tx_syncer.dart';
import 'tx_sync/tx_sync_types.dart';

class TransactionNotifier extends SafeChangeNotifier {
  static const kLoadCount = 10;

  static const kBulkLoadCount = ApiService.kMaxTxIdBatch;

  final TxCacheService cache;
  final AddressTxSyncStore syncStore;
  final int pageSize;
  final Duration addressGap;

  late final AddressTxSyncer syncer = AddressTxSyncer(
    cache: cache,
    store: syncStore,
    pageSize: pageSize,
    addressGap: addressGap,
    onTxsCached: _onTxsCached,
  );

  ApiService get api => cache.api;
  Logger get log => cache.log;

  var loadedTxs = IList<Tx>();
  bool get hasMore => loadedTxs.length < cache.txCount;

  var pendingTxs = IList<Tx>();

  final _loadLock = AsyncLock();

  int _pending = 0;
  bool get loading => _pending > 0;

  bool _reloadQueued = false;
  Future<void> _reloading = .value();

  String? _lastLoadedTxId;

  bool _firstLoad = true;
  bool get firstLoad => _firstLoad;

  TxSyncProgress get syncProgress => syncer.progress;

  TransactionNotifier({
    required this.cache,
    required this.syncStore,
    this.pageSize = AddressTxSyncer.kPageSize,
    this.addressGap = AddressTxSyncer.kAddressGap,
  }) {
    syncer.addListener(notifyListeners);
  }

  @override
  void dispose() {
    syncer.cancel();
    syncer.disposed = true;
    super.dispose();
  }

  Future<void> updatePendingTxs(Iterable<Transaction> pendingTxs) async {
    if (pendingTxs.isEmpty) {
      this.pendingTxs = this.pendingTxs.clear();
    } else {
      final txs = await cache.txsForApiTxs(pendingTxs);
      this.pendingTxs = txs.toIList();
    }

    notifyListeners();
  }

  void addToMemcache(Transaction tx) {
    // Don't cache coinbase transactions
    if (tx.inputs.isEmpty) {
      return;
    }
    cache.addToMemcache(tx);
  }

  Future<void> addWalletTx(Transaction apiTx) async {
    if (cache.isWalletTxId(apiTx.transactionId)) {
      return;
    }

    log.d('Adding wallet transaction ${apiTx.transactionId}');

    final tx = await cache.addWalletTx(apiTx);

    // The balance change this tx is about to cause is already accounted for
    syncer.markExplained({
      for (final input in tx.inputData.nonNulls) input.address,
      for (final output in apiTx.outputs) output.scriptPublicKeyAddress,
    });

    // Queued with the loads, so a rebuild that read the cache before this was
    // written cannot land on top of it and drop it again
    await _run(() async {
      // A rebuild that read the cache after it was written already has it
      if (loadedTxs.any((it) => it.id == tx.id)) return;

      loadedTxs = loadedTxs.insert(0, tx);

      notifyListeners();
    });
  }

  Future<void> processAcceptedTxIds(
    Iterable<String> acceptedTxIds, {
    required String acceptingBlockHash,
    required RpcService rpc,
  }) async {
    final walletIds = acceptedTxIds.where(cache.isWalletTxId);
    if (walletIds.isEmpty) {
      return;
    }

    final block = await rpc.getBlock(
      acceptingBlockHash,
      includeTransactions: false,
    );

    await cache.updateAcceptedTxs(
      walletIds,
      acceptingBlockHash: acceptingBlockHash,
      acceptingBlockBlueScore: block.verboseData?.blueScore ?? 0,
    );

    await reload();
  }

  Future<IList<Tx>> _loadTxs({String? startId, int count = kLoadCount}) async {
    final it = await cache.getWalletTxsAfter(txId: startId, count: count);
    final txs = it.toIList();

    return txs;
  }

  Future<void> _run(Future<void> Function() action) {
    _pending += 1;
    return _loadLock
        .synchronized(() async {
          try {
            await action();
          } catch (e) {
            log.e(e);
          }
        })
        .whenComplete(() => _pending -= 1);
  }

  Future<void> loadMore([int count = kLoadCount]) {
    return _run(() async {
      if (!hasMore) return;

      _firstLoad = loadedTxs.isEmpty;

      final txs = await _loadTxs(startId: _lastLoadedTxId, count: count);

      loadedTxs = loadedTxs.addAll(txs);
      _lastLoadedTxId = txs.lastOrNull?.id ?? _lastLoadedTxId;

      notifyListeners();
    });
  }

  Future<void> _onTxsCached(int newestBlockTime) {
    final oldestLoaded = loadedTxs.lastOrNull?.apiTx.blockTime;
    if (oldestLoaded != null && newestBlockTime < oldestLoaded) {
      return .value();
    }

    return reload();
  }

  Future<void> reload() {
    if (_reloadQueued) return _reloading;

    _reloadQueued = true;
    return _reloading = _run(() async {
      _reloadQueued = false;

      _firstLoad = loadedTxs.isEmpty;

      loadedTxs = await _loadTxs(count: max(loadedTxs.length, kLoadCount));
      _lastLoadedTxId = loadedTxs.lastOrNull?.id;

      notifyListeners();
    });
  }

  Future<IList<String>> refreshWalletTxs(Iterable<String> addresses) async {
    final active = await syncer.reconcile(addresses, recheck: true);
    return active.toIList();
  }

  Future<void> checkForMissingTxs(Iterable<String> txIds) async {
    if (txIds.isEmpty) return;

    final txs = await cache.cacheMissingWalletTxs(txIds);
    if (txs.isEmpty) return;

    await reload();
  }
}
