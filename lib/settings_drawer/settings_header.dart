import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';

class SettingsHeader extends ConsumerWidget {
  final String title;

  const SettingsHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);

    return Container(
      margin: const .directional(start: 30, bottom: 10),
      child: Text(
        title,
        style: styles.textStyleAppTextFieldHint,
      ),
    );
  }
}
