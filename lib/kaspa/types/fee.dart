import 'package:freezed_annotation/freezed_annotation.dart';

part 'fee.freezed.dart';

@freezed
sealed class FeerateBucket with _$FeerateBucket {
  const FeerateBucket._();
  const factory FeerateBucket({
    required double feerate,
    required int estimatedSeconds,
  }) = _FeerateBucket;
}

@freezed
sealed class FeeEstimate with _$FeeEstimate {
  const FeeEstimate._();
  const factory FeeEstimate({
    required FeerateBucket priorityBucket,
    @Default([]) Iterable<FeerateBucket> normalBuckets,
    @Default([]) Iterable<FeerateBucket> lowBuckets,
  }) = _FeeEstimate;
}
