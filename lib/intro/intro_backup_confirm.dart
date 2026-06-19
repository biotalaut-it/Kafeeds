import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/buttons.dart';
import '../widgets/content_wrapper.dart';
import 'intro_back_button.dart';
import 'intro_providers.dart';

class IntroBackupConfirm extends ConsumerWidget {
  const IntroBackupConfirm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    void confirm() {
      final introData = ref.read(introDataProvider.notifier);
      introData.complete();
    }

    void goBack() {
      final intro = ref.read(introStateProvider.notifier);
      intro.goBack();
    }

    return ContentWrapper(
      child: Column(
        children: [
          //A widget that holds the header, the paragraph and Back Button
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 20),
                      child: const IntroBackButton(),
                    ),
                  ],
                ),
                // The header
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40, top: 10),
                  alignment: AlignmentDirectional(-1, 0),
                  child: AutoSizeText(
                    l10n.ackBackedUp,
                    maxLines: 4,
                    stepGranularity: 0.5,
                    style: styles.textStyleHeaderColored,
                  ),
                ),
                // The paragraph
                Container(
                  margin: const EdgeInsets.only(left: 40, right: 40, top: 15),
                  child: AutoSizeText(
                    l10n.secretWarning,
                    style: styles.textStyleParagraph,
                    maxLines: 5,
                    stepGranularity: 0.5,
                  ),
                ),
              ],
            ),
          ),
          ActionButtonsWrapper(
            buttons: [
              PrimaryButton(title: l10n.yesUppercase, onPressed: confirm),
              PrimaryOutlineButton(title: l10n.noUppercase, onPressed: goBack),
            ],
          ),
        ],
      ),
    );
  }
}
