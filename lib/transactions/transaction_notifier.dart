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

  var _serial = Future<void>.value();
  Future<T> _synchronized<T>(Future<T> Function() action) {
    final result = _serial.then((_) => action());
    _serial = result.then((_) {}, onError: (_) {});
    return result;
  }

  static const _mempoolRetention = Duration(seconds: 10);

  Future<void> updatePendingTxs(Iterable<Transaction> pendingTxs) async {
    final mempoolIds = Set.of(pendingTxs.map((tx) => tx.transactionId));
    final cutoff =
        DateTime.now().millisecondsSinceEpoch -
        _mempoolRetention.inMilliseconds;
    final kept = this.pendingTxs.where(
      (tx) =>
          !mempoolIds.contains(tx.id) &&
          !cache.isWalletTxId(tx.id) &&
          tx.lastUpdate > cutoff,
    );

    final txs = await cache.txsForApiTxs(pendingTxs);
    this.pendingTxs = txs.followedBy(kept).toIList();

    notifyListeners();
  }

  Future<void> processAcceptedTxs(Iterable<Transaction> txs) =>
      _synchronized(() async {
        try {
          final cached = <Tx>[];
          for (final tx in txs) {
            cached.add(await cache.addWalletTx(tx));
          }

          syncer.markExplained({
            for (final tx in cached)
              for (final input in tx.inputData.nonNulls) input.address,
            for (final apiTx in txs)
              for (final output in apiTx.outputs)
                output.scriptPublicKeyAddress,
          });

          await _run(() async {
            loadedTxs = await _loadTxs(count: loadedTxs.length + txs.length);
            _lastLoadedTxId = loadedTxs.lastOrNull?.id;

            notifyListeners();
          });
        } catch (e) {
          log.e('Failed to process accepted transactions', error: e);
        }
      });

  Future<void> processUnacceptedTxs(Iterable<String> txIds) =>
      _synchronized(() async {
        await cache.unacceptTxs(txIds);
        await reload();
      });

  Future<void> fetchNewTxsForAddresses(Iterable<String> addresses) async {
    syncer.scheduleFetch(addresses);
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

  Future<void> checkForMissingTxs(Iterable<String> txIds) =>
      _synchronized(() async {
        if (txIds.isEmpty) return;

        final unresolved = <String>{};
        for (final txId in txIds) {
          if (!cache.isWalletTxId(txId)) continue;

          final tx = await cache.txBox.tryGet(txId);
          if (tx == null || !tx.isAccepted) unresolved.add(txId);
        }

        final cached = await cache.cacheMissingWalletTxs(txIds);

        var refreshed = const <Tx>[];
        if (unresolved.isNotEmpty) {
          final txs = await api.getTxsWithIds(unresolved);
          if (txs.isNotEmpty) refreshed = await cache.cacheWalletTxs(txs);
        }

        if (cached.isEmpty && refreshed.isEmpty) return;

        await reload();
      });
}
