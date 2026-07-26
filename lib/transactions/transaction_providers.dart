import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../database/boxes.dart';
import '../kaspa/kaspa.dart';
import '../wallet/wallet_types.dart';
import 'transaction_notifier.dart';
import 'transaction_types.dart';
import 'tx_cache_service.dart';
import 'tx_sync/address_tx_sync_store.dart';
import 'tx_sync/tx_sync_types.dart';

// All new transactions from kaspa node
final _newTransactionProvider = StreamProvider.autoDispose((ref) {
  final rpc = ref.watch(kaspaRpcProvider);

  final newBlock = rpc.notifyBlockAdded();

  ref.onDispose(() async {
    try {
      await rpc.stopNotifyingBlockAdded();
    } catch (_) {}
  });

  return newBlock.expand((block) => block.transactions);
});

// New transactions associated with this wallet
final _newWalletTransactionProvider = StreamProvider.autoDispose((ref) {
  final controller = StreamController<Transaction>();
  ref.listen(_newTransactionProvider, (_, next) {
    final result = next.whenOrNull(
      data: (tx) {
        final addressNotifier = ref.read(addressNotifierProvider);
        final utxosNotifier = ref.read(utxoNotifierProvider);

        final isWalletTx =
            tx.outputs.any((output) {
              final address = output.scriptPublicKeyAddress;
              return addressNotifier.containsAddress(address);
            }) ||
            tx.inputs.any((input) {
              return utxosNotifier.isWalletOutpoint(input.previousOutpoint);
            });
        return isWalletTx ? tx : null;
      },
    );

    if (result != null) {
      controller.add(result);
    }
  });

  ref.onDispose(controller.close);

  return controller.stream;
});

final _acceptedTransactionIdsProvider = StreamProvider.autoDispose((ref) {
  final rpc = ref.watch(kaspaRpcProvider);

  ref.onDispose(() async {
    try {
      await rpc.stopNotifyingVirtualChainChanged();
    } catch (_) {}
  });

  return rpc
      .notifyVirtualChainChanged(includeAcceptedTransactionIds: true)
      .expand((message) => message.acceptedTransactionIds);
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
      final log = ref.watch(loggerProvider);

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

      // Cache new transactions
      ref.listen(_newTransactionProvider, (_, next) {
        if (next.asData?.value case final tx?) {
          notifier.addToMemcache(tx);
        }
      });

      // Add new wallet transactions
      ref.listen(_newWalletTransactionProvider, (_, next) {
        if (next.asData?.value case final tx?) {
          log.d('New wallet tx: $tx');
          notifier.addWalletTx(tx);
        }
      });

      // Update transaction status
      ref.listen(_acceptedTransactionIdsProvider, (_, next) {
        if (next.asData?.value case final ids?) {
          final rpc = ref.read(kaspaRpcProvider);

          notifier.processAcceptedTxIds(
            ids.acceptedTransactionIds,
            acceptingBlockHash: ids.acceptingBlockHash,
            rpc: rpc,
          );
        }
      });

      // Update pending transactions
      ref.listen(pendingTxsProvider, (_, next) {
        if (next.asData?.value case final pendingTxs?) {
          notifier.updatePendingTxs(pendingTxs);
        }
      });

      ref.onDispose(() {
        notifier.syncer.cancel();
        notifier.disposed = true;
      });

      return notifier;
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
