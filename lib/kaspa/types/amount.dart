import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:fixnum/fixnum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'token_info.dart';

part 'amount.freezed.dart';
part 'amount.g.dart';

@freezed
sealed class Amount with _$Amount {
  Amount._();

  static final Amount zero = .raw(.zero);

  factory Amount({
    required BigInt raw,
    required TokenInfo tokenInfo,
  }) = _Amount;

  factory Amount.raw(BigInt raw, {TokenInfo tokenInfo = .kaspa}) =>
      Amount(raw: raw, tokenInfo: tokenInfo);

  factory Amount.value(Decimal value, {TokenInfo tokenInfo = .kaspa}) => Amount(
    raw: value.shift(tokenInfo.decimals).toBigInt(),
    tokenInfo: tokenInfo,
  );

  factory Amount.rawInt(int raw, {TokenInfo tokenInfo = .kaspa}) =>
      Amount(raw: .from(raw), tokenInfo: tokenInfo);

  factory Amount.rawInt64(Int64 raw, {TokenInfo tokenInfo = .kaspa}) =>
      Amount(raw: .parse(raw.toString()), tokenInfo: tokenInfo);

  factory Amount.fromJson(Map<String, dynamic> json) => _$AmountFromJson(json);

  @override
  late final Decimal value = .fromBigInt(raw).shift(-tokenInfo.decimals);

  int get decimals => tokenInfo.decimals;

  String get symbolLabel => tokenInfo.symbolLabel;

  @override
  String toString() =>
      value.toStringAsFixed(min(tokenInfo.decimals, value.scale));
}
