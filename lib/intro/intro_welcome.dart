import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import '../widgets/content_wrapper.dart';
import 'intro_actions_widget.dart';

class IntroWelcome extends ConsumerWidget {
  const IntroWelcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    return ContentWrapper(
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: .center,
              children: [
                Expanded(
                  child: FractionallySizedBox(
                    widthFactor: 0.4,
                    child: FittedBox(
                      fit: .fitWidth,
                      child: Image.asset('assets/kaspa.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: .symmetric(horizontal: 40, vertical: 20),
                    child: AutoSizeText(
                      l10n.welcomeText,
                      style: styles.textStyleParagraph,
                      minFontSize: 18,
                      maxLines: 4,
                      stepGranularity: 0.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const IntroActionsWidget(),
        ],
      ),
    );
  }
}
