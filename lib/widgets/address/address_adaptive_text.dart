import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'address_one_line_text.dart';
import 'address_text_type.dart';
import 'address_three_line_text.dart';

class AddressAdaptiveText extends ConsumerWidget {
  final String address;
  final AddressTextType type;
  final String? label;

  const AddressAdaptiveText({
    super.key,
    required this.address,
    required this.type,
    this.label,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.heightOf(context);
    // One line for small displays
    if (height < 667) {
      return AddressOneLineText(address: address, type: type, label: label);
    }
    // Three lines for large displays
    return AddressThreeLineText(address: address, type: type, label: label);
  }
}
