import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';

class TextOutlineButton extends ConsumerWidget {
  final String title;
  final Function? onPressed;
  final bool disabled;

  const TextOutlineButton({
    super.key,
    required this.title,
    this.onPressed,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    return Row(children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: theme.backgroundDark,
            borderRadius: .circular(100),
            boxShadow: [theme.boxShadowButton],
          ),
          height: 55,
          child: OutlinedButton(
            style: styles.outlinedButtonStyle,
            child: FittedBox(
              fit: .scaleDown,
              child: Text(
                title,
                textAlign: .center,
                style: styles.textStyleButtonTextOutline,
                maxLines: 1,
              ),
            ),
            onPressed: () {
              if (!disabled) {
                onPressed?.call();
              }
            },
          ),
        ),
      ),
    ]);
  }
}
