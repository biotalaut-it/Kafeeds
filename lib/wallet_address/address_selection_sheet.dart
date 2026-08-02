import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../settings/address_settings.dart';
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/app_simpledialog.dart';
import '../widgets/buttons.dart';
import '../widgets/dismiss_action_buttons.dart';
import '../widgets/scrollable_wrapper.dart';
import '../widgets/sheet_header_button.dart';
import '../widgets/sheet_widget.dart';
import 'address_filter_dialog.dart';
import 'address_list_widget.dart';
import 'wallet_address.dart';

class AddressSelectionSheet extends HookConsumerWidget {
  final AddressType? addressType;

  const AddressSelectionSheet({
    super.key,
    this.addressType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final addressNotifier = ref.watch(addressNotifierProvider);

    final receiveScrollController = useScrollController();
    final changeScrollController = useScrollController();
    final addingAddress = useState(false);

    Future<void> showAddressFilterOptions() async {
      final selection = await showAppDialog<AddressFilter>(
        context: context,
        builder: (_) => const AddressFilterDialog(),
      );
      if (selection != null) {
        final notifier = ref.read(addressSettingsProvider.notifier);
        notifier.setAddressFilter(selection);
      }
    }

    void onSelection(WalletAddress address) {
      appRouter.pop(context, withResult: address);
    }

    Widget addressList(AddressType type) {
      return ScrollableWrapper(
        child: AddressListWidget(
          addressType: type,
          scrollController: switch (type) {
            .receive => receiveScrollController,
            .change => changeScrollController,
          },
          onSelection: onSelection,
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (context) {
          Future<void> newReceiveAddress() async {
            if (addingAddress.value) return;
            addingAddress.value = true;
            await addressNotifier.addNewReceiveAddress();
            addingAddress.value = false;

            if (!context.mounted) return;
            if (addressType == null) {
              DefaultTabController.of(context).animateTo(0);
            }
            receiveScrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
            );
          }

          return SheetWidget(
            title: l10n.selectAddress,
            rightWidget: SheetHeaderButton(
              icon: Icons.remove_red_eye,
              onPressed: showAddressFilterOptions,
            ),
            mainWidget: switch (addressType) {
              final type? => addressList(type),
              null => Column(
                children: [
                  Padding(
                    padding: const .symmetric(horizontal: 16),
                    child: TabBar(
                      indicatorWeight: 3,
                      indicatorColor: theme.primary60,
                      indicatorPadding: const .only(left: 20, right: 20),
                      tabs: [
                        Tab(
                          height: 32,
                          child: Text(
                            l10n.receive.toUpperCase(),
                            textAlign: .center,
                            style: styles.textStyleTabLabel,
                          ),
                        ),
                        Tab(
                          height: 32,
                          child: Text(
                            l10n.change.toUpperCase(),
                            textAlign: .center,
                            style: styles.textStyleTabLabel,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: TabBarView(
                      children: [
                        addressList(.receive),
                        addressList(.change),
                      ],
                    ),
                  ),
                ],
              ),
            },
            bottomWidget: ActionButtonsWrapper(
              buttons: [
                if (addressType != .change)
                  PrimaryButton(
                    title: l10n.newAddress,
                    disabled: addingAddress.value,
                    onPressed: newReceiveAddress,
                  ),
                const CloseActionButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
