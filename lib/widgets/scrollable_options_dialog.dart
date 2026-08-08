import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import 'app_simpledialog.dart';
import 'item_divider.dart';
import 'scrollable_wrapper.dart';

/// A dialog whose options scroll between a pinned title and an optional
/// pinned footer.
class ScrollableOptionsDialog extends ConsumerWidget {
  final String title;
  final List<Widget> options;
  final Widget? footer;

  const ScrollableOptionsDialog({
    super.key,
    required this.title,
    required this.options,
    this.footer,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final footer = this.footer;

    return AppAlertDialog(
      titlePadding: const .fromLTRB(24, 24, 24, 0),
      contentPadding: const .only(top: 12, bottom: 8),
      actionsPadding: .zero,
      actionsAlignment: .start,
      title: Padding(
        padding: const .only(bottom: 10),
        child: Text(title, style: styles.textStyleDialogHeader),
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ScrollableWrapper(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .stretch,
              children: options,
            ),
          ),
        ),
      ),
      actions: footer == null
          ? null
          : [
              Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                children: [
                  const Padding(
                    padding: .symmetric(horizontal: 16),
                    child: ItemDivider(),
                  ),
                  Padding(
                    padding: const .directional(
                      start: 24,
                      end: 24,
                      top: 12,
                      bottom: 16,
                    ),
                    child: footer,
                  ),
                ],
              ),
            ],
    );
  }
}
