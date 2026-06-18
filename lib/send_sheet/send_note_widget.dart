import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';

class SendNoteWidget extends HookConsumerWidget {
  final String note;
  const SendNoteWidget({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final horizontal = MediaQuery.widthOf(context) * 0.105;

    final title = l10n.sendNote;
    final details = note;
    return Container(
      width: .infinity,
      margin: .only(left: horizontal, right: horizontal, top: 5),
      padding: const .symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
        color: theme.backgroundDarkest,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: styles.textStyleDataTypeHeaderHighlight,
          ),
          Text(
            details,
            textAlign: TextAlign.center,
            style: styles.textStyleAddressText90,
          ),
        ],
      ),
    );
  }
}
