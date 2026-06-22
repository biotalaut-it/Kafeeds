import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../util/ui_util.dart';
import '../widgets/seed_three_line_text.dart';

class HashCard extends ConsumerWidget {
  final String hash;

  const HashCard({super.key, required this.hash});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    Future<void> copyHash() async {
      await Clipboard.setData(ClipboardData(text: hash));
      UIUtil.showSnackbar(l10n.signMessageMessageHashCopied);
    }

    final horizontal = MediaQuery.widthOf(context) * 0.105;

    return Container(
      margin: .symmetric(horizontal: horizontal),
      width: .infinity,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: .circular(25),
        ),
        color: theme.backgroundDarkest,
        child: InkWell(
          onTap: copyHash,
          customBorder: RoundedRectangleBorder(
            borderRadius: .circular(25),
          ),
          child: Padding(
            padding: const .symmetric(horizontal: 25, vertical: 15),
            child: Column(
              children: [
                Text(
                  l10n.signMessageMessageHash.toUpperCase(),
                  style: styles.textStyleDataTypeHeaderHighlight,
                ),
                const SizedBox(height: 8),
                SeedThreeLineText(
                  seed: hash,
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
