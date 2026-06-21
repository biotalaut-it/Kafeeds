import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/core_providers.dart';
import '../l10n/l10n.dart';
import '../settings/setting_item.dart';
import '../widgets/sheet_util.dart';
import 'buy_sheet.dart';
import 'double_line_item.dart';

class BuySettingItem extends SettingSelectionItem {
  const BuySettingItem();

  @override
  String getDisplayName(BuildContext context) {
    final l10n = l10nOf(context);
    return l10n.buyKaspaSubtitle;
  }
}

class BuySettingsItem extends ConsumerWidget {
  const BuySettingsItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final l10n = l10nOf(context);

    void showBuySheet() {
      Sheets.showAppHeightNineSheet(
        context: context,
        theme: theme,
        widget: const BuySheet(),
      );
    }

    return DoubleLineItem(
      heading: l10n.buyKaspaTitle,
      defaultMethod: const BuySettingItem(),
      icon: Icons.currency_exchange,
      onPressed: showBuySheet,
    );
  }
}
