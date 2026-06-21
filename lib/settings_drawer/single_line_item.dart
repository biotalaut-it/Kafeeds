import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';

//Settings item without any dropdown option but rather a direct functionality
class SingleLineItem extends ConsumerWidget {
  final String heading;
  final IconData settingIcon;
  final double iconSize;
  final VoidCallback? onPressed;

  const SingleLineItem({
    super.key,
    required this.heading,
    required this.settingIcon,
    this.iconSize = 24,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);

    final margins = <IconData, (double, double)>{
      AppIcons.logout: (6, 0),
      Icons.settings_applications: (0, 0),
      AppIcons.changerepresentative: (0, 6),
      AppIcons.backupseed: (1, 5),
      AppIcons.transferfunds: (2, 4),
    };

    final start = margins[settingIcon]?.$1 ?? 3;
    final end = margins[settingIcon]?.$2 ?? 3;

    return TextButton(
      style: styles.defaultTextButtonStyle,
      onPressed: () => onPressed?.call(),
      child: Container(
        height: 60,
        margin: const .directional(start: 30),
        child: Row(
          children: [
            Container(
              margin: const .directional(end: 13),
              child: Container(
                margin: .directional(top: 3, start: start, bottom: 3, end: end),
                child: Icon(settingIcon, color: theme.primary, size: iconSize),
              ),
            ),
            Expanded(
              child: Text(
                heading,
                style: styles.textStyleSettingItemHeader,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
