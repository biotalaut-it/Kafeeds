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

    final bottom = MediaQuery.heightOf(context) * 0.035;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.backgroundDark,
      body: TapOutsideUnfocus(
        child: SafeArea(
          minimum: .only(bottom: bottom),
          maintainBottomViewPadding: true,
          child: child,
        ),
      ),
    );
  }
}
