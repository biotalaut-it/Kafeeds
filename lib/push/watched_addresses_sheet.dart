import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../util/caseconverter.dart';
import '../util/ui_util.dart';
import '../wallet_address/wallet_address.dart';
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/address/address_two_line_text.dart';
import '../widgets/dialog.dart';
import '../widgets/dismiss_action_buttons.dart';
import '../widgets/item_divider.dart';
import '../widgets/scrollable_wrapper.dart';
import '../widgets/sheet_widget.dart';
import 'push_types.dart';

class WatchedAddressesSheet extends HookConsumerWidget {
  const WatchedAddressesSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final receiveAddresses = ref.watch(
      addressNotifierProvider.select((value) => value.receiveAddresses),
    );

    final items = receiveAddresses.reversed.toList();
    final newestFirst = [for (final address in items) address.encoded];

    final preferences = ref.read(pushSettingsProvider).watchPreferences;
    final pinned = useState(preferences.pinnedAddresses.toSet());
    final excluded = useState(() {
      final excludedSet = preferences.excludedAddresses.toSet();
      if (!preferences.autoWatch) {
        excludedSet.addAll(
          newestFirst.where(
            (address) => !preferences.pinnedAddresses.contains(address),
          ),
        );
      }
      return excludedSet;
    }());

    final draft = WatchPreferences.derive(
      addresses: newestFirst,
      pinned: pinned.value,
      excluded: excluded.value,
    );
    final watched = draft.watchedAddresses(newestFirst).toSet();

    void apply() {
      final notifier = ref.read(pushSettingsProvider.notifier);
      notifier.setWatchOverrides(
        pinned: pinned.value,
        excluded: excluded.value,
      );
    }

    void cycle(String address) {
      final newPinned = {...pinned.value};
      final newExcluded = {...excluded.value};
      if (newPinned.remove(address)) {
        newExcluded.add(address);
      } else if (!newExcluded.remove(address)) {
        if (newPinned.length >= kMaxWatchedAddressesPerAccount) {
          UIUtil.showSnackbar(
            l10n.pinLimitReached(kMaxWatchedAddressesPerAccount),
          );
          return;
        }
        newPinned.add(address);
      }

      pinned.value = newPinned;
      excluded.value = newExcluded;
    }

    final latestAddresses = newestFirst
        .take(kMaxWatchedAddressesPerAccount)
        .toSet();
    final allValue = watched.isEmpty
        ? false
        : (pinned.value.containsAll(latestAddresses) ? true : null);

    void toggleAll() {
      switch (allValue) {
        case false:
          pinned.value = const {};
          excluded.value = const {};
        case null:
          pinned.value = latestAddresses;
          excluded.value = const {};
        case true:
          pinned.value = const {};
          excluded.value = newestFirst.toSet();
      }
    }

    Widget buildRow(WalletAddress address) {
      final encoded = address.encoded;
      final isPinned = pinned.value.contains(encoded);
      final isExcluded = excluded.value.contains(encoded);
      final isWatched = watched.contains(encoded);

      return TextButton(
        style: styles.defaultTextButtonStyle,
        onPressed: () => cycle(encoded),
        child: Container(
          margin: const .symmetric(horizontal: 12),
          padding: const .symmetric(vertical: 8),
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: .circle,
                  color: isWatched ? theme.success : theme.text30,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(address.name, style: styles.textStyleDialogOptions),
                    AddressTwoLineText(address: encoded),
                  ],
                ),
              ),
              Checkbox(
                tristate: true,
                value: isPinned ? true : (isExcluded ? false : null),
                visualDensity: .compact,
                checkColor: theme.text,
                activeColor: theme.primary,
                onChanged: (_) => cycle(encoded),
              ),
            ],
          ),
        ),
      );
    }

    return PopScope(
      canPop: watched.isNotEmpty,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          if (result != true) apply();
          return;
        }
        AppDialogs.showConfirmDialog(
          context,
          l10n.watchedAddressesEmptyTitle,
          l10n.watchedAddressesEmptyMessage,
          CaseChange.toUpperCase(l10n.turnOff, ref),
          () => appRouter.pop(context, withResult: true),
        );
      },
      child: SheetWidget(
        title: l10n.watchedAddresses,
        mainWidget: Column(
          children: [
            Padding(
              padding: const .symmetric(horizontal: 24, vertical: 8),
              child: Text(
                l10n.watchedAddressesHint,
                style: styles.textStyleAddressText60,
                textAlign: .center,
              ),
            ),
            Padding(
              padding: const .only(left: 36, right: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.watchedAddressesCount(
                        watched.length,
                        kMaxWatchedAddressesPerAccount,
                      ),
                      style: styles.textStyleParagraphThinPrimary,
                    ),
                  ),
                  Checkbox(
                    tristate: true,
                    value: allValue,
                    visualDensity: .compact,
                    checkColor: theme.text,
                    activeColor: theme.primary,
                    onChanged: (_) => toggleAll(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ScrollableWrapper(
                child: ListView.separated(
                  padding: const .symmetric(vertical: 10),
                  separatorBuilder: (_, _) => const ItemDivider(),
                  itemCount: items.length,
                  itemBuilder: (_, index) => buildRow(items[index]),
                ),
              ),
            ),
          ],
        ),
        bottomWidget: const ActionButtonsWrapper(
          buttons: [CloseActionButton()],
        ),
      ),
    );
  }
}
