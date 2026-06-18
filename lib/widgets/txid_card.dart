import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../util/util.dart';
import 'seed_three_line_text.dart';

class TxIdCard extends HookConsumerWidget {
  final String txId;

  const TxIdCard({
    super.key,
    required this.txId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    void viewTransaction() {
      final explorer = ref.read(blockExplorerProvider);
      openUrl(explorer.urlForTx(txId));
    }

    final horizontal = MediaQuery.widthOf(context) * 0.105;

    return Container(
      margin: .symmetric(horizontal: horizontal),
      width: double.infinity,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: theme.backgroundDarkest,
        child: InkWell(
          onTap: viewTransaction,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              children: [
                Text(
                  l10n.transactionId.toUpperCase(),
                  style: styles.textStyleDataTypeHeaderHighlight,
                ),
                SeedThreeLineText(
                  seed: txId,
                  textStyle: styles.textStyleSeed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
