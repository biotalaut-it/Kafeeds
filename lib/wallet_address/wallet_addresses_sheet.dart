import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../settings/address_settings.dart';
import '../settings_advanced/kpub_sheet.dart';
import '../util/ui_util.dart';
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/app_simpledialog.dart';
import '../widgets/buttons.dart';
import '../widgets/dismiss_action_buttons.dart';
import '../widgets/scrollable_wrapper.dart';
import '../widgets/sheet_header_button.dart';
import '../widgets/sheet_util.dart';
import '../widgets/sheet_widget.dart';
import 'address_filter_dialog.dart';
import 'address_list_widget.dart';
import 'wallet_address.dart';

class WalletAddressesSheet extends HookConsumerWidget {
  const WalletAddressesSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final addressNotifier = ref.watch(addressNotifierProvider);
    final wallet = ref.watch(walletProvider);

    final addingAddress = useState(false);
    final receiveScrollController = useScrollController();
    final changeScrollController = useScrollController();

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

    Future<void> showKpub() async {
      final authUtil = ref.read(authUtilProvider);
      final message = l10n.kpubAuth;
      final auth = await authUtil.authenticate(context, message, message);

      if (!context.mounted) return;

      if (!auth) {
        return;
      }

      return Sheets.showAppHeightNineSheet(
        context: context,
        widget: const KpubSheet(),
        theme: theme,
      );
    }

    Future<void> copyAddresses(AddressType? type) async {
      final (addresses, typeStr) = switch (type) {
        AddressType.receive => (
          addressNotifier.receiveAddresses,
          l10n.receive,
        ),
        AddressType.change => (
          addressNotifier.changeAddresses,
          l10n.change,
        ),
        null => (
          addressNotifier.receiveAddresses.followedBy(
            addressNotifier.changeAddresses,
          ),
          l10n.walletAddresses,
        ),
      };

      try {
        final encoded = addresses.map((address) => address.encoded).join('\n');
        await Clipboard.setData(ClipboardData(text: encoded));
        UIUtil.showSnackbar(l10n.walletAddressesCopied(typeStr));
      } catch (_) {
        UIUtil.showSnackbar(l10n.walletAddressesCopyFailed(typeStr));
      }
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
            DefaultTabController.of(context).animateTo(0);
            receiveScrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
            );
          }

          return SheetWidget(
            title: l10n.walletAddresses,
            leftWidget: wallet.hasValidKpub
                ? SheetHeaderButton(icon: Icons.vpn_key, onPressed: showKpub)
                : null,
            rightWidget: SheetHeaderButton(
              icon: Icons.remove_red_eye,
              onPressed: showAddressFilterOptions,
            ),
            mainWidget: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TabBar(
                    indicatorWeight: 3,
                    indicatorColor: theme.primary60,
                    indicatorPadding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    tabs: [
                      Tab(
                        height: 32,
                        child: GestureDetector(
                          onLongPress: () => copyAddresses(AddressType.receive),
                          child: Text(
                            l10n.receive.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: styles.textStyleTabLabel,
                          ),
                        ),
                      ),
                      Tab(
                        height: 32,
                        child: GestureDetector(
                          onLongPress: () => copyAddresses(AddressType.change),
                          child: Text(
                            l10n.change.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: styles.textStyleTabLabel,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: TabBarView(
                    children: [
                      ScrollableWrapper(
                        child: AddressListWidget(
                          addressType: AddressType.receive,
                          scrollController: receiveScrollController,
                        ),
                      ),
                      ScrollableWrapper(
                        child: AddressListWidget(
                          addressType: AddressType.change,
                          scrollController: changeScrollController,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            bottomWidget: ActionButtonsWrapper(
              buttons: [
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
