import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaspium_wallet/settings_drawer/double_line_item.dart';

import '../app_icons.dart';
import '../l10n/l10n.dart';
import '../settings/available_currency.dart';
import '../settings/settings_providers.dart';
import 'currency_dialog.dart';

class CurrencySettingsItem extends ConsumerWidget {
  const CurrencySettingsItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currency = ref.watch(currencyProvider);
    final l10n = l10nOf(context);

    Future<void> showCurrencyDialog() async {
      final selection = await showDialog<AvailableCurrencies>(
        context: context,
        builder: (_) => const CurrencyDialog(),
      );

      if (selection != null) {
        final notifier = ref.read(currencyProvider.notifier);
        notifier.updateCurrency(AvailableCurrency(selection));
      }
    }

    return DoubleLineItem(
      heading: l10n.currency,
      defaultMethod: currency,
      icon: AppIcons.currency,
      onPressed: showCurrencyDialog,
    );
  }
}
