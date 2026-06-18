import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../settings_drawer/double_line_item.dart';
import '../../widgets/sheet_util.dart';
import '../setting_item.dart';
import 'kasplex_settings_sheet.dart';

class KasplexSettingsApiUrlEntry extends ConsumerWidget {
  const KasplexSettingsApiUrlEntry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kasplexApiUrl = ref.watch(kasplexApiUrlProvider);

    void changeApiUrl() {
      final theme = ref.read(themeProvider);
      Sheets.showAppHeightEightSheet(
        context: context,
        theme: theme,
        widget: const KasplexSettingsSheet(),
      );
    }

    final schemeIndex = kasplexApiUrl.indexOf('://');
    final displayUrl = schemeIndex != -1
        ? kasplexApiUrl.substring(schemeIndex + 3)
        : kasplexApiUrl;

    return DoubleLineItem(
      heading: 'Kasplex API',
      defaultMethod: StringSelectionItem(displayUrl),
      icon: Icons.token,
      onPressed: changeApiUrl,
    );
  }
}
