import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stream_transform/stream_transform.dart';

import '../app_providers.dart';
import '../database/boxes.dart';
import '../kaspa/types.dart';
import 'utxos_notifier.dart';

final _utxoBoxProvider = Provider.autoDispose<TypedBox<Utxo>>((ref) {
  final boxInfo = ref.watch(walletBoxInfoProvider);
  final db = ref.watch(dbProvider);

  final boxKey = boxInfo.utxo.boxKey;
  final box = db.getTypedBox<Utxo>(boxKey);

  return box;
});

final utxosChangedProvider = StreamProvider.autoDispose((ref) {
  final rpc = ref.watch(kaspaRpcProvider);
  final addresses = ref.watch(allAddressesProvider);

  ref.onDispose(() async {
    try {
      await rpc.stopNotifyingUtxosChanged(addresses);
    } catch (_) {}
  });

  return rpc
      .notifyUtxosChanged(addresses)
      .debounceBuffer(const Duration(milliseconds: 500))
      .map((changes) {
        final added = <Utxo>{};
        final removed = <Utxo>{};

        for (final change in changes) {
          added.removeAll(change.removed);
          added.addAll(change.added);

          removed.removeAll(change.added);
          removed.addAll(change.removed);
        }
        return UtxosChanged(added: added, removed: removed);
      });
});

final utxoNotifierProvider = ChangeNotifierProvider.autoDispose((ref) {
  final rpc = ref.watch(kaspaRpcProvider);
  final utxoBox = ref.watch(_utxoBoxProvider);
  final log = ref.watch(loggerProvider);

  final notifier = UtxosNotifier(
    rpc: rpc,
    utxoBox: utxoBox,
    log: log,
  );

  ref.listen(
    balanceNotifierProvider.select((notifier) => notifier.balances),
    (_, balances) {
      log.d('UTXOs - Refresh with balances for ${balances.keys}');
      notifier.refreshWithBalances(balances: balances);
    },
  );

  ref.listen(utxosChangedProvider, (_, next) {
    if (next.asData?.value case final message?) {
      final addresses = Set.of(
        message.removed.followedBy(message.added).map((utxo) => utxo.address),
      );
      log.d('UTXOs - Refresh with utxos changed for $addresses');
      notifier.refresh(addresses: addresses);
    }
  });

  ref.onDispose(() {
    notifier.disposed = true;
  });

  return notifier;
});

final utxoListProvider = Provider.autoDispose((ref) {
  return ref.watch(
    utxoNotifierProvider.select((notifier) => notifier.utxoList),
  );
});

final spendableUtxosProvider = Provider.autoDispose((ref) {
  final utxos = ref.watch(utxoListProvider);
  final virtualDaaScore = ref.read(lastKnownVirtualDaaScoreProvider);

  final spendableUtxos = utxos.where((utxo) {
    if (!utxo.utxoEntry.isCoinbase) {
      return true;
    }
    return utxo.utxoEntry.blockDaaScore + .from(1000) < virtualDaaScore;
  }).toList();

  spendableUtxos.sort(
    (a, b) => b.utxoEntry.amount.compareTo(a.utxoEntry.amount),
  );

  return spendableUtxos;
});

final selectedUtxosProvider = StateProvider<ISet<Utxo>>((ref) => ISet());
