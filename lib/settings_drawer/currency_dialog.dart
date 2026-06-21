import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../settings/available_currency.dart';
import '../widgets/app_simpledialog.dart';
import '../widgets/item_divider.dart';

class CurrencyDialog extends ConsumerWidget {
  const CurrencyDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    return AppSimpleDialog(
      title: Padding(
        padding: const .only(bottom: 10),
        child: Text(
          l10n.currency,
          style: styles.textStyleDialogHeader,
        ),
      ),
      children: [
        for (final value in AvailableCurrencies.values)
          SimpleDialogOption(
            onPressed: () => appRouter.pop(context, withResult: value),
            child: Padding(
              padding: const .symmetric(vertical: 8),
              child: Text(
                AvailableCurrency(value).getDisplayName(context),
                style: styles.textStyleDialogOptions,
              ),
            ),
          ),
        Padding(
          padding: const .symmetric(horizontal: 16),
          child: const ItemDivider(),
        ),
        Padding(
          padding: const .directional(start: 24, top: 12),
          child: Text(
            l10n.currencyPoweredBy,
            style: styles.textStyleDialogOptions,
          ),
        ),
      ],
    );
  }
}
