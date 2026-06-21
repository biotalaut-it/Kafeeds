import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app_providers.dart';
import '../../l10n/l10n.dart';
import '../../widgets/action_buttons_wrapper.dart';
import '../../widgets/buttons.dart';
import '../../widgets/dismiss_action_buttons.dart';
import '../../widgets/item_divider.dart';
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
    final activeConfig = ref.watch(kaspaNodeConfigProvider);

    void addNode() {
      Sheets.showAppHeightNineSheet(
        context: context,
        theme: theme,
        widget: const NodeAddSheet(),
      );
    }

    Future<void> change(ActiveNodeConfig? item) async {
      if (item == null) {
        return;
      }

      final oldNetworkId = ref.read(networkIdProvider);
      final newNetworkId = item.networkId;
      final repository = ref.read(walletRepositoryProvider);
      final wallet = ref.read(walletProvider);

      if (oldNetworkId != newNetworkId) {
        await repository.openWalletBoxes(wallet, networkId: newNetworkId);
      }

      final notifier = ref.read(kaspaNodeSettingsProvider.notifier);
      await notifier.updateSelected(item.config);

      if (oldNetworkId != newNetworkId) {
        await repository.closeWalletBoxes(wallet, networkId: oldNetworkId);
      }
    }

    return SheetWidget(
      title: l10n.nodesSheetTitle,
      mainWidget: ScrollableWrapper(
        child: RadioGroup(
          groupValue: activeConfig,
          onChanged: change,
          child: ListView.separated(
            shrinkWrap: true,
            padding: .symmetric(vertical: 10),
            separatorBuilder: (_, _) => const ItemDivider(),
            itemCount: items.length,
            itemBuilder: (_, index) {
              final config = ActiveNodeConfig(config: items[index]);
              return NodeItem(
                config: config,
                isSelectedConfig: config == activeConfig,
                onSelected: change,
              );
            },
          ),
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
