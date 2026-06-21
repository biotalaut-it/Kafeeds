import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import 'sheet_handle.dart';
import 'sheet_wrapper.dart';

class SheetWidget extends ConsumerWidget {
  final Widget? leftWidget;
  final Widget? rightWidget;
  final String title;
  final Widget mainWidget;
  final Widget bottomWidget;

  const SheetWidget({
    super.key,
    required this.title,
    this.leftWidget,
    this.rightWidget,
    required this.mainWidget,
    this.bottomWidget = const SizedBox(),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final leftRight = (leftWidget ?? rightWidget) != null;

    return SheetWrapper(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            crossAxisAlignment: .start,
            children: [
              if (leftRight)
                Padding(
                  padding: const .directional(top: 10, start: 10),
                  child: leftWidget ?? const SizedBox(height: 50, width: 50),
                ),
              Expanded(
                child: Column(
                  children: [
                    const SheetHandle(),
                    Container(
                      margin: const .symmetric(horizontal: 4, vertical: 8),
                      child: FittedBox(
                        fit: .scaleDown,
                        child: Text(
                          title.toUpperCase(),
                          style: styles.textStyleHeader,
                          textAlign: .center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (leftRight)
                Padding(
                  padding: const .directional(top: 10, end: 10),
                  child: rightWidget ?? const SizedBox(height: 50, width: 50),
                ),
            ],
          ),
          Expanded(child: mainWidget),
          const SizedBox(height: 16),
          bottomWidget,
        ],
      ),
    );
  }
}
