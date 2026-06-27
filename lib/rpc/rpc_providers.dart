import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaspium_wallet/kaspa/rpc/void_service.dart';

import '../app_providers.dart';
import '../kaspa/kaspa.dart';

final kaspaRpcProvider = Provider.autoDispose((ref) {
  final config = ref.watch(kaspaNodeConfigProvider);
  final inBackground = ref.watch(inBackgroundProvider);

  final rpc = inBackground
      ? VoidRpcService()
      : GrpcService.url(config.url, tls: config.isSecure);
  rpc.connect();

  ref.onDispose(() => Future.microtask(rpc.disconnect));

  return rpc;
});

final pendingTxsProvider = FutureProvider.autoDispose((ref) async {
  final rpc = ref.watch(kaspaRpcProvider);
  final addresses = ref.watch(activeAddressesProvider);
  // refresh when utxos change
  ref.watch(utxosChangedProvider);

  final pendingTxs = await rpc.getMempoolEntriesByAddresses(
    addresses,
    filterTransactionPool: false,
    includeOrphanPool: false,
  );

  return pendingTxs
      .expand((entries) => entries.sending.map((e) => e.transaction))
      .toSet();
});
