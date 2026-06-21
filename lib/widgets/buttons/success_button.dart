import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';

class SuccessButton extends ConsumerWidget {
  final String title;
  final bool disabled;
  final Function? onPressed;

  const SuccessButton({
    super.key,
    required this.title,
    this.disabled = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);

    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: .circular(100),
              boxShadow: [theme.boxShadowButton],
            ),
            height: 55,
            child: TextButton(
              style: styles.successButtonStyle,
              child: FittedBox(
                fit: .scaleDown,
                child: Text(
                  title,
                  textAlign: .center,
                  style: styles.textStyleButtonPrimaryGreen,
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
      ],
    );
  }
}
