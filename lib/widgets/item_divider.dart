import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';

class ItemDivider extends ConsumerWidget {
  const ItemDivider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return Divider(height: 2, color: theme.text15);
  }
}
