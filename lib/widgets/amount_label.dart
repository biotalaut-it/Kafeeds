import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/core_providers.dart';
import '../kaspa/kaspa.dart';
import '../util/numberutil.dart';
import 'fiat_value_container.dart';

class AmountLabel extends HookConsumerWidget {
  final Amount amount;

  const AmountLabel({super.key, required this.amount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);

    final symbol = ref.watch(symbolProvider(amount));

    final formatedAmount = useMemoized(() {
      return NumberUtil.formatedAmount(amount);
    }, [amount]);

    final exactAmount = useMemoized(() {
      final value = NumberUtil.approx(
        amount: amount,
        precision: amount.decimals,
      );
      return '$value $symbol';
    }, [amount]);

    final horizontal = MediaQuery.widthOf(context) * 0.105;

    return FiatValueContainer(
      amount: amount,
      child: Container(
        margin: .symmetric(horizontal: horizontal),
        padding: const .symmetric(horizontal: 25, vertical: 15),
        width: .infinity,
        decoration: BoxDecoration(
          color: theme.backgroundDarkest,
          borderRadius: .circular(50),
        ),
        child: Tooltip(
          message: exactAmount,
          child: Padding(
            padding: const .symmetric(horizontal: 10),
            child: FittedBox(
              fit: .scaleDown,
              child: RichText(
                textAlign: .center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: formatedAmount,
                      style: styles.textStyleApproxAmountSuccess,
                    ),
                    TextSpan(
                      text: ' $symbol',
                      style: styles.textStyleTokenSymbolSuccess,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
