import 'package:flutter/widgets.dart';
import 'package:share_plus/share_plus.dart';

import '../app_icons.dart';
import '../l10n/l10n.dart';
import '../util/ui_util.dart';
import 'single_line_item.dart';

class ShareSettingsItem extends StatelessWidget {
  const ShareSettingsItem({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);

    void share() {
      try {
        final box = context.findRenderObject() as RenderBox?;
        final params = ShareParams(
          sharePositionOrigin: box!.localToGlobal(.zero) & box.size,
          text: l10n.shareKaspiumText,
          subject: l10n.shareKaspiumSubject,
        );
        SharePlus.instance.share(params);
      } catch (e) {
        UIUtil.showSnackbar('Could not share Kaspium');
      }
    }

    return SingleLineItem(
      heading: l10n.shareKaspium,
      settingIcon: AppIcons.share,
      onPressed: share,
    );
  }
}
