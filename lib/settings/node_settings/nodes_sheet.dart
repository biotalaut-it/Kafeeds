import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../l10n/l10n.dart';
import '../../widgets/action_buttons_wrapper.dart';
import '../../widgets/buttons.dart';
import '../../widgets/dismiss_action_buttons.dart';
import '../../widgets/scrollable_wrapper.dart';
import '../../widgets/sheet_util.dart';
import '../../widgets/sheet_widget.dart';
import 'node_add_sheet.dart';
import 'node_item.dart';
import 'node_types.dart';

class NodesSheet extends ConsumerWidget {
  const NodesSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final l10n = l10nOf(context);

    final items = ref.watch(kaspaNodeOptionsProvider);

    void addNode() {
      Sheets.showAppHeightNineSheet(
        context: context,
        theme: theme,
        widget: const NodeAddSheet(),
      );
    }

    return SheetWidget(
      title: l10n.nodesSheetTitle,
      mainWidget: ScrollableWrapper(
        child: ListView.builder(
          shrinkWrap: true,
          padding: .symmetric(vertical: 10),
          itemCount: items.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == items.length) {
              return Divider(height: 2, color: theme.text15);
            }
            final config = ActiveNodeConfig(config: items[index]);
            return ProviderScope(
              overrides: [
                kaspaNodeConfigItemProvider.overrideWithValue(config),
              ],
              child: const NodeItem(),
            );
          },
        ),
      ),
      bottomWidget: ActionButtonsWrapper(
        buttons: [
          PrimaryButton(title: l10n.addNode, onPressed: addNode),
          const CloseActionButton(),
        ],
      ),
    );
  }
}
