import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';

class RadioItem extends ConsumerWidget {
  final String title;
  final String? subtitle;
  final bool value;

  const RadioItem({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);

    final subtitle = this.subtitle;

    return RadioListTile(
      title: Text(title, style: styles.textStyleParagraphNormal),
      subtitle: subtitle != null
          ? Text(subtitle, style: styles.textStyleParagraph)
          : null,
      contentPadding: .zero,
      value: value,
      activeColor: theme.primary,
      dense: true,
    );
  }
}
