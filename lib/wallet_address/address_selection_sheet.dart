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
  final AddressType addressType;

  const AddressSelectionSheet({
    super.key,
    required this.addressType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = l10nOf(context);

    final addressNotifier = ref.watch(addressNotifierProvider);

    final scrollController = useScrollController();
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

    Future<void> newReceiveAddress() async {
      if (addingAddress.value) return;
      addingAddress.value = true;
      await addressNotifier.addNewReceiveAddress();
      addingAddress.value = false;

      scrollController.animateTo(
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
      mainWidget: ScrollableWrapper(
        child: AddressListWidget(
          addressType: .receive,
          scrollController: scrollController,
          onSelection: (address) {
            final notifier = ref.read(selectedAddressProvider.notifier);
            notifier.state = address;
            appRouter.pop(context);
          },
        ),
      ),
      bottomWidget: ActionButtonsWrapper(
        buttons: [
          if (addressType == .receive)
            PrimaryButton(
              title: l10n.newAddress,
              disabled: addingAddress.value,
              onPressed: newReceiveAddress,
            ),
          const CloseActionButton(),
        ],
      ),
    );
  }
}
