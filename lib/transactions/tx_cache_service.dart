import 'dart:async';

import 'package:logger/logger.dart';

import '../database/boxes.dart';
import '../kaspa/kaspa.dart';
import '../util/async_lock.dart';
import 'transaction_types.dart';
import 'tx_cache_index.dart';

class TxCacheService {
  // Index of transaction ids ordered by timestamp
  final TxCacheIndex _txIndex;

  // Wallet transactions with cached input addresses and amounts
  final LazyTypedBox<Tx> txBox;

  // A cache of transactions that are currently loaded in memory
  final memCache = <String, Transaction>{};

  final _lock = AsyncLock();

  final _fetchingTxIds = <String>{};

  late ApiService api;
  final Logger log;

  int get txCount => _txIndex.length;

  int get newestIndexedBlockTime => _txIndex.newestBlockTime;

  TxCacheService({
    required IndexedTypedBox<TxIndex> txIndexBox,
    required this.txBox,
    required this.log,
  }) : _txIndex = TxCacheIndex(txIndexBox);

  Future<void> _cacheInputsFor(Iterable<Transaction> txs) async {
    final missingIds = <String>{};
    for (final tx in txs) {
      for (final input in tx.inputs) {
        if (input.previousOutpointAmount != null &&
            input.previousOutpointAddress != null) {
          continue;
        }
        final hash = input.previousOutpointHash;
        if (!memCache.containsKey(hash)) {
          missingIds.add(hash);
        }
      }
    }

    if (missingIds.isEmpty) {
      return;
    }

    final cachedIds = <String>{};
    for (final inputId in missingIds) {
      if (_txIndex.contains(inputId)) {
        final tx = await txBox.tryGet(inputId);
        if (tx != null) {
          memCache[inputId] = tx.apiTx;
          cachedIds.add(inputId);
        }
      }
    }

    missingIds.removeAll(cachedIds);
    final extraTxs = await api.getTxsWithIds(missingIds);
    memCache.addEntries(extraTxs.map((e) => MapEntry(e.transactionId, e)));
  }

  // Builds a Tx object from an Transaction object using cached input txs
  Tx _txForApiTx(Transaction apiTx) {
    final inputs = apiTx.inputs.map((input) {
      // use new available input amount and address from apiTx
      if (input.previousOutpointAmount != null &&
          input.previousOutpointAddress != null) {
        return TxInputData(
          address: input.previousOutpointAddress!,
          amount: input.previousOutpointAmount!,
        );
      }

      final inputTx = memCache[input.previousOutpointHash];
      if (inputTx == null) {
        log.e('Missing input tx for $input');
        return null;
      }

      final outpointIndex = input.previousOutpointIndex.toInt();
      final outpoint = inputTx.outputs[outpointIndex];
      return TxInputData(
        address: outpoint.scriptPublicKeyAddress,
        amount: outpoint.amount,
      );
    }).toList();

    final tx = Tx(
      apiTx: apiTx,
      inputData: inputs,
      lastUpdate: _refreshTimestamp,
    );

    return tx;
  }

  Future<Iterable<Tx>> txsForApiTxs(Iterable<Transaction> apiTxs) async {
    await _cacheInputsFor(apiTxs);

    final txs = apiTxs.map(_txForApiTx);

    return txs;
  }

  Future<List<Tx>> cacheWalletTxs(Iterable<Transaction> apiTxs) {
    return _lock.synchronized(() => _cacheWalletTxs(apiTxs));
  }

  Future<List<Tx>> _cacheWalletTxs(Iterable<Transaction> apiTxs) async {
    memCache.addEntries(apiTxs.map((e) => MapEntry(e.transactionId, e)));

    final txs = (await txsForApiTxs(apiTxs)).toList();

    final txIndexes = txs.map(
      (tx) => TxIndex(
        txId: tx.id,
        blockTime: tx.apiTx.blockTime,
      ),
    );

    await _txIndex.addAll(txIndexes);

    await txBox.setAll({
      for (final tx in txs) tx.id: tx,
    });

    return txs;
  }

  Future<List<Tx>> cacheMissingWalletTxs(Iterable<String> txIds) async {
    final missing = <String>{};
    for (final txId in txIds) {
      if (_txIndex.contains(txId)) continue;
      if (_fetchingTxIds.contains(txId)) continue;
      missing.add(txId);
    }

    if (missing.isEmpty) return const [];

    _fetchingTxIds.addAll(missing);
    try {
      final txs = await api.getTxsWithIds(missing);
      if (txs.isEmpty) return const [];
      return await cacheWalletTxs(txs);
    } finally {
      _fetchingTxIds.removeAll(missing);
    }
  }

  Future<void> addWalletTxIds(Iterable<ApiTxId> apiTxIds) {
    return _lock.synchronized(
      () => _txIndex.addAll(
        apiTxIds.map(
          (e) => TxIndex(txId: e.transactionId, blockTime: e.blockTime),
        ),
      ),
    );
  }

  bool isWalletTxId(String id) {
    return _txIndex.contains(id);
  }

  void addToMemcache(Transaction apiTx) {
    memCache[apiTx.transactionId] = apiTx;
  }

  void trimMemCache({int maxSize = 1000}) {
    final excess = memCache.length - maxSize;
    if (excess <= 0) {
      return;
    }
    final oldest = memCache.keys.take(excess).toList(growable: false);
    oldest.forEach(memCache.remove);
  }

  Future<Tx> addWalletTx(Transaction apiTx) {
    return _lock.synchronized(() => _addWalletTx(apiTx));
  }

  Future<Tx> _addWalletTx(Transaction apiTx) async {
    addToMemcache(apiTx);

    final txIndex = TxIndex(
      txId: apiTx.transactionId,
      blockTime: apiTx.blockTime,
    );
    await _txIndex.add(txIndex);

    await _cacheInputsFor([apiTx]);

    final tx = _txForApiTx(apiTx);
    await txBox.set(tx.id, tx);

    return tx;
  }

  int get _refreshTimestamp => DateTime.now().millisecondsSinceEpoch;

  bool _needsRefresh(Tx tx) {
    final delta = Duration(seconds: 100).inMilliseconds;
    final notFresh = _refreshTimestamp > tx.lastUpdate + 3000;
    final needsRefresh = tx.lastUpdate < tx.apiTx.blockTime + delta;
    return notFresh &&
        needsRefresh &&
        (!tx.apiTx.isAccepted || tx.apiTx.isCoinbase);
  }

  Future<Iterable<Tx>> getWalletTxsAfter({String? txId, int count = 10}) {
    return _lock.synchronized(() => _getWalletTxsAfter(txId, count));
  }

  Future<Iterable<Tx>> _getWalletTxsAfter(String? txId, int count) async {
    final txs = <Tx?>[];
    final missingTxIds = <String, int>{};
    for (final index in _txIndex.indexAfter(txId).take(count)) {
      final tx = await txBox.tryGet(index.txId);
      if ((tx == null || _needsRefresh(tx)) &&
          !_fetchingTxIds.contains(index.txId)) {
        missingTxIds[index.txId] = txs.length;
      }
      txs.add(tx);
    }
    if (missingTxIds.isNotEmpty) {
      _fetchingTxIds.addAll(missingTxIds.keys);
      try {
        final missingTxs = await api.getTxsWithIds(missingTxIds.keys);
        for (final tx in missingTxs) {
          final index = missingTxIds[tx.transactionId];
          if (index == null) {
            log.e('Missing tx index for ${tx.transactionId}');
            continue;
          }
          txs[index] = await _addWalletTx(tx);
        }
      } finally {
        _fetchingTxIds.removeAll(missingTxIds.keys);
      }
      trimMemCache();
    }

    return txs.whereType<Tx>();
  }

  Future<Transaction?> _getApiTxWithId(String id) async {
    if (memCache[id] case final apiTx?) {
      return apiTx;
    }

    final tx = await txBox.tryGet(id);
    if (tx?.apiTx case final apiTx?) {
      return apiTx;
    }

    final remote = await api.getTxWithId(id);
    return remote;
  }

  Future<void> updateAcceptedTxs(
    Iterable<String> acceptedTxIds, {
    required String acceptingBlockHash,
    required int acceptingBlockBlueScore,
  }) {
    return _lock.synchronized(() async {
      final walletTxs = <Transaction>[];
      for (final id in acceptedTxIds) {
        final tx = await _getApiTxWithId(id);
        if (tx == null) {
          continue;
        }
        walletTxs.add(tx);
      }

      for (final tx in walletTxs) {
        final newTx = tx.copyWith(
          isAccepted: true,
          acceptingBlockHash: acceptingBlockHash,
          acceptingBlockBlueScore: acceptingBlockBlueScore,
        );
        await _addWalletTx(newTx);
      }
    });
  }
}
