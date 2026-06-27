import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'tap_outside_unfocus.dart';

class SheetWrapper extends ConsumerWidget {
  final Widget child;

  const SheetWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TapOutsideUnfocus(
      child: SafeArea(
        maintainBottomViewPadding: true,
        child: child,
      ),
    );
  }
}
