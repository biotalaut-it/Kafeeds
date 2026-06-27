import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import 'tap_outside_unfocus.dart';

class ContentWrapper extends ConsumerWidget {
  final Widget child;

  const ContentWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.backgroundDark,
      body: TapOutsideUnfocus(
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: child,
        ),
      ),
    );
  }
}
