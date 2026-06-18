import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../contacts/contact.dart';
import '../contacts/contacts_providers.dart';
import '../core/core_providers.dart';
import '../kaspa/kaspa.dart';
import '../l10n/l10n.dart';
import '../util/ui_util.dart';

Future<void> exportContacts(WidgetRef ref, BuildContext context) async {
  final l10n = l10nOf(context);

  List<Contact> contacts = await ref.read(contactsProvider).contacts;

  if (!context.mounted) return;

  if (contacts.length == 0) {
    UIUtil.showSnackbar(l10n.noContactsExport);
    return;
  }
  List<Map<String, dynamic>> jsonList = [];
  contacts.forEach((contact) {
    jsonList.add(contact.toJson());
  });
  final lockDisabled = ref.read(lockDisabledProvider.notifier);
  lockDisabled.state = true;

  try {
    final exportTime = DateTime.now();
    final format = DateFormat('yyyyMMdd_HHmmss');
    final filename = "kaspium_contacts_${format.format(exportTime)}.txt";
    final file = XFile.fromData(
      stringToBytesUtf8(json.encode(jsonList)),
      mimeType: 'text/plain',
    );

    final box = context.findRenderObject() as RenderBox?;
    final params = ShareParams(
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      files: [file],
      fileNameOverrides: [filename],
    );
    await SharePlus.instance.share(params);
  } catch (e) {
    UIUtil.showSnackbar('Failed to export contacts');
  }

  lockDisabled.state = false;
}

Future<void> importContacts(WidgetRef ref, BuildContext context) async {
  final l10n = l10nOf(context);

  final lockDisabled = ref.read(lockDisabledProvider.notifier);
  lockDisabled.state = true;

  const XTypeGroup typeGroup = XTypeGroup(
    extensions: ['txt'],
    mimeTypes: ['text/plain'],
    uniformTypeIdentifiers: ['public.data'],
  );
  final result = await openFile(acceptedTypeGroups: [typeGroup]);
  lockDisabled.state = false;

  if (result != null) {
    File f = File(result.path);

    if (!await f.exists()) {
      UIUtil.showSnackbar(l10n.contactsImportErr);
      return;
    }
    try {
      String contents = await f.readAsString();
      Iterable contactsJson = json.decode(contents);
      List<Contact> contacts = [];
      List<Contact> contactsToAdd = [];
      contactsJson.forEach((contact) {
        contacts.add(Contact.fromJson(contact));
      });
      final contactsManager = ref.read(contactsProvider);
      for (Contact contact in contacts) {
        if (!await contactsManager.contactExistsWithName(contact.name) &&
            !await contactsManager.contactExistsWithAddress(contact.address)) {
          // Contact doesnt exist, make sure name and address are valid
          final prefix = ref.read(addressPrefixProvider);
          if (Address.isValid(contact.address, prefix)) {
            if (contact.name.startsWith("@") && contact.name.length <= 20) {
              contactsToAdd.add(contact);
            }
          }
        }
      }
      // Save all the new contacts and update states
      int numSaved = await contactsManager.saveContacts(contactsToAdd);
      if (numSaved > 0) {
        final message = l10n.contactsImportSuccess('$numSaved');
        UIUtil.showSnackbar(message);
      } else {
        UIUtil.showSnackbar(l10n.noContactsImport);
      }
    } catch (e) {
      final log = ref.read(loggerProvider);
      log.e('Failed to import contacts', error: e);
      UIUtil.showSnackbar(l10n.contactsImportErr);
    }
  }
}
