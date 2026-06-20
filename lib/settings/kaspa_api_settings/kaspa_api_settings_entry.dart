import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/core_providers.dart';
import '../../settings_drawer/double_line_item.dart';
import '../../widgets/sheet_util.dart';
import '../setting_item.dart';
import 'kaspa_api_settings_providers.dart';
import 'kaspa_api_settings_sheet.dart';

class KaspaApiSettingsUrlEntry extends ConsumerWidget {
  const KaspaApiSettingsUrlEntry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kaspaApiUrl = ref.watch(kaspaApiUrlProvider);

    void changeKaspaApiUrl() {
      final theme = ref.read(themeProvider);
      Sheets.showAppHeightEightSheet(
        context: context,
        theme: theme,
        widget: const KaspaApiSettingsSheet(),
      );
    }

    final schemeIndex = kaspaApiUrl.indexOf('://');
    final displayUrl = schemeIndex != -1
        ? kaspaApiUrl.substring(schemeIndex + 3)
        : kaspaApiUrl;

    return DoubleLineItem(
      heading: 'Kaspa API',
      defaultMethod: StringSelectionItem(displayUrl),
      icon: Icons.api,
      onPressed: changeKaspaApiUrl,
    );
  }
}
