import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../app_styles.dart';
import '../l10n/l10n.dart';
import 'tx_sync/tx_sync_types.dart';

class TxSyncCard extends ConsumerWidget {
  final TxSyncProgress progress;

  const TxSyncCard({super.key, required this.progress});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    return Container(
      margin: .fromSTEB(14, 4, 14, 4),
      decoration: BoxDecoration(
        color: theme.backgroundDark,
        borderRadius: .circular(10),
        boxShadow: [theme.boxShadow],
      ),
      child: Padding(
        padding: const .symmetric(vertical: 14, horizontal: 12),
        child: Row(
          children: [
            Container(
              margin: const .directional(end: 12),
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: theme.primary,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        l10n.syncingTransactions,
                        style: styles.textStyleTransactionAmountSmall,
                      ),
                      if (progress.total > 1)
                        Text(
                          l10n.syncingAddresses(
                            progress.completed,
                            progress.total,
                          ),
                          style: styles.textStyleTransactionType.copyWith(
                            fontWeight: .w400,
                            fontSize: AppFontSizes.smallest,
                            color: theme.text60,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: .circular(2),
                    child: LinearProgressIndicator(
                      minHeight: 4,
                      value: progress.total > 0
                          ? progress.completed / progress.total
                          : null,
                      backgroundColor: theme.backgroundDarkest,
                      color: theme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
