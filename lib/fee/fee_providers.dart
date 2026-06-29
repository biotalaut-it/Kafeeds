import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../app_providers.dart';
import '../kaspa/kaspa.dart';
import '../util/formatters.dart';

const kMinFeeRate = 100;

enum FeePriority {
  min,
  low,
  normal,
  high,
}

final rpcFeeEstimateProvider = FutureProvider.autoDispose((ref) async {
  // refresh once every 10 seconds
  ref.watch(timeProvider);
  final rpc = ref.watch(kaspaRpcProvider);

  try {
    final feeEstimate = await rpc.getFeeEstimate();
    return feeEstimate;
  } catch (e) {
    return null;
  }
});

final feeEstimateProvider = Provider.family.autoDispose((ref, BigInt mass) {
  final feeEstimate = ref.watch(rpcFeeEstimateProvider).valueOrNull;

  if (feeEstimate == null) {
    return <(Amount, int?, FeePriority)>[
      (.raw(mass * .from(kMinFeeRate)), null, .min),
    ];
  }

  Amount feeFor(double feeRate, BigInt mass) {
    return .raw(mass * .from(feeRate.ceil()));
  }

  final fees = <(Amount, int?, FeePriority)>[
    if (feeEstimate.lowBuckets.firstOrNull case final bucket?)
      (
        feeFor(bucket.feerate, mass),
        bucket.estimatedSeconds,
        .low,
      ),
    if (feeEstimate.normalBuckets.firstOrNull case final bucket?)
      (
        feeFor(bucket.feerate, mass),
        bucket.estimatedSeconds,
        .normal,
      ),
    (
      feeFor(feeEstimate.priorityBucket.feerate, mass),
      feeEstimate.priorityBucket.estimatedSeconds,
      .high,
    ),
  ].where((fee) => fee.$1.raw > .zero).toList();
  return fees;
});

final feeFormatterProvider = Provider((ref) {
  final symbol = ref.watch(kasSymbolProvider);
  final format = NumberFormat.currency(name: '', symbol: symbol);
  final formatter = CurrencyFormatter(
    groupSeparator: format.symbols.GROUP_SEP,
    decimalSeparator: format.symbols.DECIMAL_SEP,
    maxDecimalDigits: TokenInfo.kaspa.decimals,
    maxAmount: .fromInt(100),
  );

  return formatter;
});

final feeRateProvider = Provider.autoDispose<int>((ref) {
  final feeEstimate = ref.watch(rpcFeeEstimateProvider);

  if (feeEstimate.valueOrNull case final estimate?) {
    return (estimate.lowBuckets.firstOrNull ??
            estimate.normalBuckets.firstOrNull ??
            estimate.priorityBucket)
        .feerate
        .ceil();
  }

  return kMinFeeRate;
});
