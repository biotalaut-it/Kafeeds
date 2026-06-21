import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';

class DoubleLineItemTwo extends ConsumerWidget {
  final String heading;
  final String text;
  final IconData icon;
  final double iconSize;
  final VoidCallback onPressed;
  final bool disabled;

  const DoubleLineItemTwo({
    super.key,
    required this.heading,
    required this.text,
    required this.icon,
    this.iconSize = 24,
    required this.onPressed,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);

    return IgnorePointer(
      ignoring: disabled,
      child: TextButton(
        style: styles.defaultTextButtonStyle,
        onPressed: onPressed,
        child: Container(
          height: 60,
          margin: const .directional(start: 30),
          child: Row(
            crossAxisAlignment: .center,
            children: [
              Container(
                margin: const .directional(end: 13),
                child: Container(
                  margin: const .all(3),
                  child: Icon(
                    icon,
                    color: disabled ? theme.primary45 : theme.primary,
                    size: iconSize,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: .center,
                crossAxisAlignment: .start,
                children: [
                  AutoSizeText(
                    heading,
                    style: disabled
                        ? styles.textStyleSettingItemHeader45
                        : styles.textStyleSettingItemHeader,
                    maxLines: 1,
                    stepGranularity: 0.1,
                    minFontSize: 8,
                  ),
                  AutoSizeText(
                    text,
                    style: disabled
                        ? styles.textStyleSettingItemSubheader30
                        : styles.textStyleSettingItemSubheader,
                    maxLines: 1,
                    stepGranularity: 0.1,
                    minFontSize: 8,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
