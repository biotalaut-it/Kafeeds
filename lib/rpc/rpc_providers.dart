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

final rpcFeeEstimateProvider = FutureProvider.autoDispose((ref) async {
  // refresh once every 10 seconds
  ref.watch(timeProvider);
  final client = ref.watch(kaspaRpcProvider);

  try {
    final feeEstimate = await client.getFeeEstimate();
    return feeEstimate;
  } catch (e) {
    return null;
  }
});

final feeEstimateProvider = Provider.family
    .autoDispose<List<(Amount, int?)>, (BigInt, Amount)>((ref, massAndFee) {
      final mass = massAndFee.$1;
      final baseFee = massAndFee.$2;

      final feeEstimate = ref.watch(rpcFeeEstimateProvider).valueOrNull;
      if (feeEstimate == null) {
        return [
          (.value(.parse('0.001')), null),
          (.value(.parse('0.01')), null),
          (.value(.parse('0.1')), null),
        ];
      }

      Amount feeFor(double feeRate, BigInt mass, Amount baseFee) {
        final estimate = feeRate * mass.toDouble();
        return .raw((BigInt.from(estimate) - baseFee.raw).min(.zero));
      }

      final fees = [
        if (feeEstimate.lowBuckets.isNotEmpty)
          (
            feeFor(feeEstimate.lowBuckets.first.feerate, mass, baseFee),
            feeEstimate.lowBuckets.first.estimatedSeconds.toInt(),
          ),
        if (feeEstimate.normalBuckets.isNotEmpty)
          (
            feeFor(feeEstimate.normalBuckets.first.feerate, mass, baseFee),
            feeEstimate.normalBuckets.first.estimatedSeconds.toInt(),
          ),
        (
          feeFor(feeEstimate.priorityBucket.feerate, mass, baseFee),
          feeEstimate.priorityBucket.estimatedSeconds.toInt(),
        ),
      ].where((fee) => fee.$1.raw > .zero).toList();
      return fees;
    });
