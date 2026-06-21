import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/item_divider.dart';
import 'contacts_providers.dart';
import 'single_contact_widget.dart';

class ContactListWidget extends ConsumerWidget {
  const ContactListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(contactsProvider).contacts;

    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const .only(top: 15, bottom: 15),
      separatorBuilder: (_, _) => const ItemDivider(),
      itemCount: contacts.length,
      itemBuilder: (_, index) {
        final contact = contacts[index];
        return SingleContactWidget(contact: contact);
      },
    );
  }
}
