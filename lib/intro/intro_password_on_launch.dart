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

class IntroPasswordOnLaunch extends ConsumerWidget {
  const IntroPasswordOnLaunch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    void skipPassword() {
      final intro = ref.read(introStateProvider.notifier);
      intro.skipPassword();
    }

    void setPassword() {
      final intro = ref.read(introStateProvider.notifier);
      intro.showIntroPassword();
    }

    return ContentWrapper(
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: .center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const .directional(start: 20),
                      child: const IntroBackButton(),
                    ),
                  ],
                ),
                Container(
                  margin: const .only(left: 40, right: 40, top: 10),
                  alignment: AlignmentDirectional(-1, 0),
                  child: AutoSizeText(
                    l10n.requireAPasswordToOpenHeader,
                    maxLines: 3,
                    stepGranularity: 0.5,
                    style: styles.textStyleHeaderColored,
                  ),
                ),
                Container(
                  margin: .directional(start: 40, end: 40, top: 16),
                  alignment: AlignmentDirectional(-1, 0),
                  child: AutoSizeText(
                    l10n.createPasswordFirstParagraph,
                    style: styles.textStyleParagraph,
                    maxLines: 5,
                    stepGranularity: 0.5,
                  ),
                ),
                Container(
                  margin: const .only(left: 40, right: 40, top: 8),
                  alignment: AlignmentDirectional(-1, 0),
                  child: AutoSizeText(
                    l10n.createPasswordSecondParagraph,
                    style: styles.textStyleParagraphPrimary,
                    maxLines: 4,
                    stepGranularity: 0.5,
                  ),
                ),
              ],
            ),
          ),
          ActionButtonsWrapper(
            buttons: [
              PrimaryButton(
                title: l10n.noSkipButton,
                onPressed: skipPassword,
              ),
              PrimaryOutlineButton(
                title: l10n.yesButton,
                onPressed: setPassword,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
