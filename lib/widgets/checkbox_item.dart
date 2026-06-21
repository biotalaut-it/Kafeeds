import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';

class CheckboxItem extends ConsumerWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CheckboxItem({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);

    return CheckboxListTile(
      title: Text(title, style: styles.textStyleParagraphNormal),
      controlAffinity: .leading,
      contentPadding: .zero,
      value: value,
      checkColor: theme.text,
      activeColor: theme.primary,
      dense: true,
      onChanged: onChanged,
    );
  }
}
