import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../database/boxes.dart';
import '../wallet/wallet_types.dart';
import 'transaction_notifier.dart';
import 'transaction_types.dart';
import 'tx_cache_service.dart';
import 'tx_monitor.dart';
import 'tx_sync/address_tx_sync_store.dart';
import 'tx_sync/tx_sync_types.dart';

final _virtualChainChangedProvider = StreamProvider.autoDispose((ref) {
  final rpc = ref.watch(kaspaRpcProvider);

  ref.onDispose(() async {
    try {
      await rpc.stopNotifyingVirtualChainChanged();
    } catch (_) {}
  });

  return rpc.notifyVirtualChainChanged(includeAcceptedTransactionIds: true);
});

final _txBoxProvider = Provider.autoDispose
    .family<LazyTypedBox<Tx>, WalletInfo>((ref, wallet) {
      final db = ref.watch(dbProvider);
      final networkId = ref.watch(networkIdProvider);
      final repository = ref.watch(boxInfoRepositoryProvider);
      final boxInfo = repository.getBoxInfo(wallet.wid, networkId);
      final txBoxKey = boxInfo.tx.boxKey;
      return db.getLazyTypedBox<Tx>(txBoxKey);
    });

final _txIndexBoxProvider = Provider.autoDispose
    .family<IndexedTypedBox<TxIndex>, WalletInfo>((ref, wallet) {
      final db = ref.watch(dbProvider);
      final networkId = ref.watch(networkIdProvider);
      final repository = ref.watch(boxInfoRepositoryProvider);
      final boxInfo = repository.getBoxInfo(wallet.wid, networkId);
      final txIndexBoxKey = boxInfo.txIndex.boxKey;
      return db.getIndexedTypedBox<TxIndex>(txIndexBoxKey);
    });

final _txSyncBoxProvider = Provider.autoDispose
    .family<TypedBox<AddressTxSync>, WalletInfo>((ref, wallet) {
      final db = ref.watch(dbProvider);
      final networkId = ref.watch(networkIdProvider);
      final repository = ref.watch(boxInfoRepositoryProvider);
      final boxInfo = repository.getBoxInfo(wallet.wid, networkId);
      final txSyncBoxKey = boxInfo.txSyncKeys.boxKey;
      return db.getTypedBox<AddressTxSync>(txSyncBoxKey);
    });

final addressTxSyncStoreProvider = Provider.autoDispose
    .family<AddressTxSyncStore, WalletInfo>((ref, wallet) {
      final txSyncBox = ref.watch(_txSyncBoxProvider(wallet));
      return AddressTxSyncStore(txSyncBox);
    });

final txCacheServiceProvider = Provider.autoDispose
    .family<TxCacheService, WalletInfo>((ref, wallet) {
      final txIndexBox = ref.watch(_txIndexBoxProvider(wallet));
      final txBox = ref.watch(_txBoxProvider(wallet));
      final log = ref.watch(loggerProvider);

      final txCache = TxCacheService(
        txIndexBox: txIndexBox,
        txBox: txBox,
        log: log,
      );

      ref.listen(
        kaspaApiServiceProvider,
        (_, api) => txCache.api = api,
        fireImmediately: true,
      );

      return txCache;
    });

final txNotifierForWalletProvider = ChangeNotifierProvider.autoDispose
    .family<TransactionNotifier, WalletInfo>((ref, wallet) {
      final cache = ref.watch(txCacheServiceProvider(wallet));
      final syncStore = ref.watch(addressTxSyncStoreProvider(wallet));

      final notifier = TransactionNotifier(
        cache: cache,
        syncStore: syncStore,
      );
      notifier.loadMore();

      ref.listen(activeAddressesProvider, (_, addresses) {
        notifier.syncer.reconcile(addresses);
      }, fireImmediately: true);

      ref.listen(lastBalanceChangesProvider, (_, next) {
        if (next.isEmpty) {
          return;
        }
        notifier.syncer.scheduleFetch(next.keys);
      });

      // Check for missing transactions in UTXOs
      ref.listen(utxoListProvider, (_, utxos) {
        notifier.checkForMissingTxs(
          utxos.take(100).map((u) => u.outpoint.transactionId),
        );
      }, fireImmediately: true);

      // Update pending transactions
      ref.listen(pendingTxsProvider, (_, next) {
        if (next.asData?.value case final pendingTxs?) {
          notifier.updatePendingTxs(pendingTxs);
        }
      });

      ref.listen(inBackgroundProvider, (_, inBackground) {
        if (inBackground) {
          notifier.syncer.pause();
        } else {
          notifier.syncer.resume();
        }
      }, fireImmediately: true);

      ref.onDispose(() {
        notifier.syncer.cancel();
        notifier.disposed = true;
      });

      return notifier;
    });

final txMonitorForWalletProvider = Provider.autoDispose
    .family<TxMonitor, WalletInfo>((ref, wallet) {
      final rpc = ref.watch(kaspaRpcProvider);
      final notifier = ref.watch(txNotifierForWalletProvider(wallet).notifier);
      final cache = notifier.cache;

      final log = ref.watch(loggerProvider);
      final monitor = TxMonitor(
        rpc: rpc,
        log: log,
        isWalletTxId: cache.isWalletTxId,
        isWalletTx: (tx) {
          final addressNotifier = ref.read(addressNotifierProvider);
          final utxosNotifier = ref.read(utxoNotifierProvider);
          return tx.outputs.any((output) {
                return addressNotifier.containsAddress(
                  output.scriptPublicKeyAddress,
                );
              }) ||
              tx.inputs.any((input) {
                return utxosNotifier.isWalletOutpoint(input.previousOutpoint);
              });
        },
        onTxsAccepted: notifier.processAcceptedTxs,
        onTxsUnaccepted: notifier.processUnacceptedTxs,
        onWatchesExpired: notifier.checkForMissingTxs,
        onOutpointsExpired: notifier.fetchNewTxsForAddresses,
      );

      ref.listen(_virtualChainChangedProvider, (_, next) {
        if (next.asData?.value case final message?) {
          monitor.onVirtualChainChanged(message);
        }
      });

      ref.listen(utxosChangedProvider, (_, next) {
        if (next.asData?.value case final message?) {
          final added = message.added.toList();
          final removed = message.removed.toList();
          for (final utxo in added) {
            monitor.watch(utxo.outpoint.transactionId);
          }

          final addedOutpoints = added.map((u) => u.outpoint).toSet();
          final reallyRemoved = removed
              .where((utxo) => !addedOutpoints.contains(utxo.outpoint))
              .toList();
          monitor.watchSpentUtxos(reallyRemoved);
        }
      });

      ref.listen(pendingTxsProvider, (_, next) {
        if (next.asData?.value case final txs?) {
          for (final tx in txs) {
            monitor.watch(tx.transactionId);
          }
        }
      });

      ref.onDispose(monitor.dispose);

      return monitor;
    });

final txMonitorProvider = Provider.autoDispose((ref) {
  final wallet = ref.watch(walletProvider);
  return ref.watch(txMonitorForWalletProvider(wallet));
});

final txNotifierProvider = Provider.autoDispose((ref) {
  final wallet = ref.watch(walletProvider);
  final txNotifier = ref.watch(txNotifierForWalletProvider(wallet));
  return txNotifier;
});

final txConfirmationStatusProvider = Provider.autoDispose
    .family<TxState, TxItem>((ref, txItem) {
      final blueScore = ref.watch(virtualSelectedParentBlueScoreProvider);

      final tx = txItem.tx;
      if (txItem.pending) {
        return .pending();
      }
      final kNoConfirmations = BigInt.from(1000);
      final txBlueScore = tx.apiTx.acceptingBlockBlueScore;

      if (!tx.apiTx.isAccepted || txBlueScore == null) {
        return const .unconfirmed();
      }

      final confirmations = blueScore - .from(txBlueScore);
      if (confirmations >= kNoConfirmations) {
        return const .confirmed();
      }

      return .confirming(confirmations);
    });
