import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_balance.freezed.dart';
part 'address_balance.g.dart';

@freezed
sealed class AddressBalance with _$AddressBalance {
  const AddressBalance._();
  const factory AddressBalance({
    required String address,
    required BigInt balance,
  }) = _AddressBalance;

  factory AddressBalance.fromJson(Map<String, dynamic> json) =>
      _$AddressBalanceFromJson(json);
}
