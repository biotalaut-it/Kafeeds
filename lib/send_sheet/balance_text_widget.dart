import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../wallet_address/wallet_address.dart';

final _balanceProvider =
    Provider.autoDispose.family<String, WalletAddress?>((ref, address) {
  if (address == null) {
    return ref.watch(formatedTotalBalanceProvider);
  }
  final balance = ref.watch(formatedBalanceForAddressProvider(address.encoded));
  return balance;
});

final _fiatProvider =
    Provider.autoDispose.family<String, WalletAddress?>((ref, address) {
  if (address == null) {
    return ref.watch(formatedTotalFiatProvider);
  }
  final balance = ref.watch(formatedFiatForAddressProvider(address.encoded));
  return balance;
});

class BalanceRowWidget extends ConsumerWidget {
  final WalletAddress? address;

  const BalanceRowWidget({
    super.key,
    this.address,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);

    final kasSymbol = ref.watch(kasSymbolProvider);
    final balance = ref.watch(_balanceProvider(address));
    final fiatValue = ref.watch(_fiatProvider(address));

    return Row(
      mainAxisAlignment: .spaceBetween,
      mainAxisSize: .max,
      children: [
        Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: balance,
                    style: styles.textStyleBalanceAmountSmall,
                  ),
                  TextSpan(
                    text: ' $kasSymbol',
                    style: styles.textStyleTransactionUnitSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '≈ ',
                style: styles.textStyleTransactionUnitSmall,
              ),
              TextSpan(
                text: fiatValue,
                style: styles.textStyleBalanceAmountSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BalanceTextWidget extends ConsumerWidget {
  final WalletAddress? address;

  const BalanceTextWidget({
    super.key,
    this.address,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);

    final kasSymbol = ref.watch(kasSymbolProvider);
    final balance = ref.watch(_balanceProvider(address));
    final fiatValue = ref.watch(_fiatProvider(address));

    return Column(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: balance,
                style: styles.textStyleBalanceAmountMedium,
              ),
              TextSpan(
                text: ' $kasSymbol',
                style: styles.textStyleTransactionUnitMedium,
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '( ≈ ',
                style: styles.textStyleTransactionUnitSmall,
              ),
              TextSpan(
                text: fiatValue,
                style: styles.textStyleBalanceAmountSmall,
              ),
              TextSpan(
                text: ' )',
                style: styles.textStyleTransactionUnitSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
