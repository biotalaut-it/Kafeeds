import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../widgets/buttons.dart';
import 'intro_back_button.dart';
import 'intro_providers.dart';

class IntroBackupConfirm extends ConsumerWidget {
  const IntroBackupConfirm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
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

    final height = MediaQuery.heightOf(context);
    final top = height * 0.075;
    final bottom = height * 0.035;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.backgroundDark,
      body: SafeArea(
        minimum: .only(top: top, bottom: bottom),
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
            Column(
              children: [
                PrimaryButton(
                  title: l10n.yesUppercase,
                  margin: const EdgeInsets.fromLTRB(28, 0, 28, 8),
                  onPressed: confirm,
                ),
                PrimaryOutlineButton(
                  title: l10n.noUppercase,
                  margin: const EdgeInsets.fromLTRB(28, 8, 28, 0),
                  onPressed: goBack,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
