import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../app_providers.dart';
import '../kaspa/kaspa.dart';
import '../util/formatters.dart';

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
  final kMinFeePerGram = BigInt.from(100);
  if (feeEstimate == null) {
    return <(Amount, int?)>[
      (.raw(mass * kMinFeePerGram), null),
    ];
  }

  Amount feeFor(double feeRate, BigInt mass) {
    final estimate = feeRate * mass.toDouble();
    return .raw(.from(estimate));
  }

  final fees = [
    if (feeEstimate.lowBuckets.firstOrNull case final bucket?)
      (feeFor(bucket.feerate, mass), bucket.estimatedSeconds),
    if (feeEstimate.normalBuckets.firstOrNull case final bucket?)
      (feeFor(bucket.feerate, mass), bucket.estimatedSeconds),
    (
      feeFor(feeEstimate.priorityBucket.feerate, mass),
      feeEstimate.priorityBucket.estimatedSeconds,
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

final minFeeRateProvider = Provider<int>((ref) => 100);

final feeRateProvider = Provider<int>((ref) => ref.watch(minFeeRateProvider));
