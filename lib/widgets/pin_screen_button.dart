import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';

class PinScreenButton extends ConsumerWidget {
  final String text;
  final double size;
  final void Function(String text) onTap;

  const PinScreenButton({
    super.key,
    required this.text,
    this.size = 100,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);

    return SizedBox(
      height: size,
      width: size,
      child: InkWell(
        borderRadius: .circular(200),
        highlightColor: theme.primary15,
        splashColor: theme.primary30,
        onTap: () => onTap(text),
        child: Container(
          alignment: .center,
          child: Text(
            text,
            textAlign: .center,
            style: styles.textStyleButtonPrimaryOutline,
          ),
        ),
      ),
    );
  }
}
