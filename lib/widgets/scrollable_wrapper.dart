import 'package:flutter/material.dart';

import 'gradient_widgets.dart';

class ScrollableWrapper extends StatelessWidget {
  final Widget child;

  const ScrollableWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: .expand,
      children: [
        child,
        const ListTopGradient(),
        const ListBottomGradient(),
      ],
    );
  }
}
