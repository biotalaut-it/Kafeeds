import 'dart:async';
import 'dart:math';

import 'package:logger/logger.dart';

import '../../kaspa/kaspa.dart';
import '../../util/safe_change_notifier.dart';
import '../tx_cache_service.dart';
import 'address_tx_sync_store.dart';
import 'tx_sync_types.dart';

class AddressTxSyncer extends SafeChangeNotifier {
  static const kPageSize = 500;

  static const kAddressGap = Duration(milliseconds: 1000);

  static const kMinBlockTime = 1600000000000;

  final TxCacheService cache;
  final AddressTxSyncStore store;
  final int pageSize;

  final Duration addressGap;

  final Future<void> Function(int newestBlockTime)? onTxsCached;

  ApiService get api => cache.api;
  Logger get log => cache.log;

  final _queue = <String, ({TxSyncAction action, int activity, bool quiet})>{};

  final _explained = <String>{};

  final _checked = <String>{};

  bool _running = false;
  bool _cancelled = false;
  bool _seeded = false;
  Future<void>? _worker;
  Future<void>? _seeding;

  int _completed = 0;
  int _queued = 0;

  TxSyncProgress get progress =>
      TxSyncProgress(completed: _completed, total: _queued);

  bool get isSyncing => _running;

  AddressTxSyncer({
    required this.cache,
    required this.store,
    this.pageSize = kPageSize,
    this.addressGap = kAddressGap,
    this.onTxsCached,
  });

  Future<List<String>> reconcile(
    Iterable<String> addresses, {
    bool recheck = false,
  }) async {
    if (addresses.isEmpty || _cancelled) {
      return const [];
    }

    final seed = _claimSeed();
    try {
      final unchecked = <String>[];
      for (final address in addresses) {
        if (!recheck && _checked.contains(address)) continue;

        final record = recheck ? null : store.tryGet(address);
        if (record == null) {
          unchecked.add(address);
          continue;
        }
        final action = record.pendingAction;
        if (action != .none) {
          _enqueue(address, action, record.newestBlockTime);
        }
        _checked.add(address);
      }

      final List<ApiActiveAddress> results;
      try {
        results = await api.checkActive(addresses: unchecked);
      } catch (e) {
        log.e('Failed to check for active addresses', error: e);
        _releaseSeed(seed);
        _pump();
        return const [];
      }

      if (_cancelled) {
        _releaseSeed(seed);
        return const [];
      }

      _checked.addAll(unchecked);

      final active = [
        for (final result in results)
          if (result.active) result.address,
      ];

      if (seed != null) {
        try {
          await _writeSeed(head: seed.head, addresses: active);
        } catch (e, st) {
          log.e('Failed to seed the tx sync state', error: e, stackTrace: st);
          _releaseSeed(seed);
        }
      }

      for (final result in results) {
        final action = store
            .get(result.address)
            .actionFor(
              active: result.active,
              lastTxBlockTime: result.lastTxBlockTime,
            );
        if (action != .none) {
          _enqueue(result.address, action, result.lastTxBlockTime ?? 0);
        }
      }
      _pump();

      return active;
    } finally {
      seed?.done.complete();
    }
  }

  void markExplained(Iterable<String> addresses) {
    for (final address in addresses) {
      if (store.tryGet(address) == null) continue;
      _explained.add(address);
    }
  }

  void scheduleFetch(Iterable<String> addresses) {
    for (final address in addresses) {
      if (_explained.remove(address)) continue;

      final backfilled = store.get(address).backfilled;
      _enqueue(
        address,
        backfilled ? .fetchForward : .backfill,
        _nowMs,
        quiet: true,
      );
    }
    _pump();
  }

  Future<void> drain() async {
    while (_running && !_cancelled) {
      await _worker;
    }
  }

  void cancel() {
    _cancelled = true;
    _queue.clear();
  }

  ({Completer<void> done, int head})? _claimSeed() {
    if (_seeded || !store.isEmpty) {
      return null;
    }
    _seeded = true;

    final head = cache.newestIndexedBlockTime;
    if (head < kMinBlockTime) {
      return null;
    }

    final done = Completer<void>();
    _seeding = done.future;

    return (done: done, head: head);
  }

  void _releaseSeed(({Completer<void> done, int head})? seed) {
    if (seed == null) return;
    _seeded = false;
  }

  Future<void> _writeSeed({
    required int head,
    required List<String> addresses,
  }) async {
    if (addresses.isEmpty) {
      return;
    }

    log.i('Seeding tx sync state for ${addresses.length} addresses at $head');

    await store.saveAll([
      for (final address in addresses)
        AddressTxSync(
          address: address,
          newestBlockTime: head,
          backfilled: true,
          lastSyncMs: _nowMs,
        ),
    ]);
  }

  void _enqueue(
    String address,
    TxSyncAction action,
    int activity, {
    bool quiet = false,
  }) {
    if (_cancelled) {
      return;
    }

    final queued = _queue[address];
    final loud = !quiet || (queued != null && !queued.quiet);
    if (loud && (queued == null || queued.quiet)) {
      _queued += 1;
    }

    _queue[address] = (
      action: queued?.action == .backfill ? .backfill : action,
      activity: max(activity, queued?.activity ?? 0),
      quiet: !loud,
    );
  }

  ({String address, TxSyncAction action, bool quiet}) _takeNext() {
    var next = _queue.entries.first;
    for (final entry in _queue.entries) {
      if (entry.value.activity > next.value.activity) {
        next = entry;
      }
    }
    _queue.remove(next.key);

    return (
      address: next.key,
      action: next.value.action,
      quiet: next.value.quiet,
    );
  }

  void _pump() {
    if (_running || _cancelled || _queue.isEmpty) {
      return;
    }
    _running = true;
    _worker = Future.microtask(_run);
  }

  Future<void> _run() async {
    try {
      notifyListeners();

      await _seeding;

      while (!_cancelled && _queue.isNotEmpty) {
        final (:address, :action, :quiet) = _takeNext();

        try {
          await _syncAddress(address, action);
        } catch (e, st) {
          _checked.remove(address);
          log.e('Failed to sync txs for $address', error: e, stackTrace: st);
        }

        if (!quiet) {
          _completed += 1;
          notifyListeners();
        }

        if (_queue.isNotEmpty) {
          await Future.delayed(addressGap);
        }
      }
    } finally {
      _running = false;
      _completed = 0;
      _queued = 0;
      notifyListeners();
    }
  }

  Future<void> _syncAddress(String address, TxSyncAction action) {
    final record = store.get(address);

    if (action == .backfill && record.backfilled) {
      action = .fetchForward;
    }

    return switch (action) {
      .backfill => _backfill(record),
      .fetchForward => _fetchForward(record),
      .none => Future.value(),
    };
  }

  Future<void> _backfill(AddressTxSync record) async {
    var newest = record.newestBlockTime;
    var before = record.oldestBlockTime > 0 ? record.oldestBlockTime : null;

    while (!_cancelled) {
      final page = await api.getTxIdPageForAddress(
        record.address,
        limit: pageSize,
        before: before,
      );
      if (page.isEmpty) {
        break;
      }

      await _cacheIdPage(page);
      if (_cancelled) {
        return;
      }

      newest = max(newest, _newestBlockTime(page));
      final next = _nextBefore(page);
      if (next == null) {
        break;
      }
      if (before != null && next >= before) {
        log.w('Backfill cursor did not advance for ${record.address}');
        break;
      }
      before = next;

      record = record.copyWith(
        newestBlockTime: newest,
        oldestBlockTime: before,
        lastSyncMs: _nowMs,
      );
      await store.save(record);
    }

    if (_cancelled) {
      return;
    }
    await store.save(
      record.copyWith(
        newestBlockTime: newest,
        backfilled: true,
        lastSyncMs: _nowMs,
      ),
    );
  }

  Future<void> _fetchForward(AddressTxSync record) async {
    var after = record.newestBlockTime > 0 ? record.newestBlockTime - 1 : null;

    var newest = record.newestBlockTime;

    while (!_cancelled) {
      final page = await api.getTxIdPageForAddress(
        record.address,
        limit: pageSize,
        after: after,
      );
      if (page.isEmpty) {
        break;
      }

      await _cacheIdPage(page);
      if (_cancelled) {
        return;
      }

      newest = max(newest, _newestBlockTime(page));
      final next = _nextAfter(page);
      if (next == null) {
        break;
      }
      if (after != null && next <= after) {
        log.w('Forward cursor did not advance for ${record.address}');
        break;
      }
      after = next;

      record = record.copyWith(newestBlockTime: newest, lastSyncMs: _nowMs);
      await store.save(record);
    }

    if (_cancelled) {
      return;
    }
    await store.save(
      record.copyWith(
        newestBlockTime: newest,
        lastSyncMs: _nowMs,
      ),
    );
  }

  Future<void> _cacheIdPage(ApiTxIdPage page) async {
    await cache.addWalletTxIds(page.ids);

    await _notifyCached(page);
  }

  Future<void> _notifyCached(ApiPage page) async {
    await onTxsCached?.call(_newestBlockTime(page));
  }

  int? _nextBefore(ApiPage page) {
    if (page.nextBefore case final next?) {
      return next;
    }
    final blockTimes = page.blockTimes;
    if (blockTimes.length < pageSize) {
      return null;
    }
    return blockTimes.reduce(min);
  }

  int? _nextAfter(ApiPage page) {
    if (page.nextAfter case final next?) {
      return next;
    }
    final blockTimes = page.blockTimes;
    if (blockTimes.length < pageSize) {
      return null;
    }
    return blockTimes.reduce(max);
  }

  int _newestBlockTime(ApiPage page) =>
      page.blockTimes.fold(0, (a, blockTime) => max(a, blockTime));

  int get _nowMs => DateTime.now().millisecondsSinceEpoch;
}
