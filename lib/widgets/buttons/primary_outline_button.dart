import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';

class PrimaryOutlineButton extends ConsumerWidget {
  final String title;
  final Function? onPressed;
  final bool disabled;

  const PrimaryOutlineButton({
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
              color: theme.backgroundDark,
              borderRadius: .circular(100),
              boxShadow: [theme.boxShadowButton],
            ),
            height: 55,
            child: OutlinedButton(
              style: disabled
                  ? styles.disabledPrimaryOutlinedButtonStyle
                  : styles.outlinedPrimaryButtonStyle,
              onPressed: () {
                if (!disabled) {
                  onPressed?.call();
                }
              },
              child: FittedBox(
                fit: .scaleDown,
                child: Text(
                  title,
                  textAlign: .center,
                  style: disabled
                      ? styles.textStyleButtonPrimaryOutlineDisabled
                      : styles.textStyleButtonPrimaryOutline,
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PrimaryOutlineDarkButton extends ConsumerWidget {
  final String title;
  final Function? onPressed;
  final bool disabled;

  const PrimaryOutlineDarkButton({
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
              color: theme.backgroundDarkest,
              borderRadius: .circular(100),
              boxShadow: [theme.boxShadowButton],
            ),
            height: 55,
            child: OutlinedButton(
              style: disabled
                  ? styles.disabledPrimaryOutlinedDarkButtonStyle
                  : styles.outlinedPrimaryDarkButtonStyle,
              onPressed: () {
                if (!disabled) {
                  onPressed?.call();
                }
              },
              child: FittedBox(
                fit: .scaleDown,
                child: Text(
                  title,
                  textAlign: .center,
                  style: disabled
                      ? styles.textStyleButtonPrimaryOutlineDisabled
                      : styles.textStyleButtonPrimaryOutline,
                  maxLines: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
