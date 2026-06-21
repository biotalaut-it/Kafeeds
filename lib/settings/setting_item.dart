import 'package:flutter/material.dart';

/// Models that are used in settings dialogs/dropdowns
abstract class SettingSelectionItem {
  const SettingSelectionItem();

  String getDisplayName(BuildContext context);
}

class StringSelectionItem extends SettingSelectionItem {
  final String item;

  const StringSelectionItem(this.item);

  @override
  String getDisplayName(BuildContext context) => item;
}
