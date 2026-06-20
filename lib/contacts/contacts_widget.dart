import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../util/contacts.dart' as contacts_helper;
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/app_icon_button.dart';
import '../widgets/buttons/text_outline_button.dart';
import '../widgets/drawer_wrapper.dart';
import '../widgets/gradient_widgets.dart';
import '../widgets/sheet_util.dart';
import 'contact_add_sheet.dart';
import 'contact_list_widget.dart';

class ContactsWidget extends ConsumerWidget {
  final VoidCallback onBackAction;

  const ContactsWidget({
    super.key,
    required this.onBackAction,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    Future<void> importContacts() =>
        contacts_helper.importContacts(ref, context);

    Future<void> exportContacts() =>
        contacts_helper.exportContacts(ref, context);

    void addContact() {
      Sheets.showAppHeightNineSheet(
        context: context,
        widget: const ContactAddSheet(),
        theme: theme,
      );
    }

    return DrawerWrapper(
      child: Column(
        children: [
          Container(
            margin: const .only(top: 16),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const .symmetric(horizontal: 10),
                      child: AppIconButton(
                        icon: AppIcons.back,
                        onPressed: onBackAction,
                      ),
                    ),
                    Text(
                      l10n.contactsHeader,
                      style: styles.textStyleSettingsHeader,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Tooltip(
                      message: l10n.import,
                      child: AppIconButton(
                        icon: AppIcons.import,
                        onPressed: importContacts,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Tooltip(
                      message: l10n.export,
                      child: AppIconButton(
                        icon: AppIcons.export,
                        onPressed: exportContacts,
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                const ContactListWidget(),
                const ContactListTopGradient(),
                const ContactListBottomGradient(),
              ],
            ),
          ),
          ActionButtonsWrapper(
            buttons: [
              TextOutlineButton(title: l10n.addContact, onPressed: addContact),
            ],
          ),
        ],
      ),
    );
  }
}
