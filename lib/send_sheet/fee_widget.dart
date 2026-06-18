import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../kaspa/kaspa.dart';
import '../l10n/l10n.dart';

class FeeWidget extends ConsumerWidget {
  final Amount amount;
  const FeeWidget({
    super.key,
    required this.amount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final symbol = ref.watch(symbolProvider(amount));

    final horizontal = MediaQuery.widthOf(context) * 0.105;

    return Container(
      width: double.infinity,
      margin: .only(left: horizontal, right: horizontal, top: 5),
      padding: const .symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
        color: theme.backgroundDarkest,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            l10n.feeTitle,
            style: styles.textStyleDataTypeHeaderHighlight,
          ),
          Text(
            '${amount.value} $symbol',
            textAlign: TextAlign.center,
            style: styles.textStyleAddressText90,
          ),
        ],
      ),
    );
  }
}
