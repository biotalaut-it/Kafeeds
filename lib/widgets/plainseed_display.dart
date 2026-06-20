import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import 'seed_three_line_text.dart';

class PlainSeedDisplay extends HookConsumerWidget {
  final String seed;
  final bool obscureSeed;

  const PlainSeedDisplay({
    super.key,
    required this.seed,
    this.obscureSeed = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final obscuredSeed = useState('•' * seed.length);
    final seedObscured = useState(true);

    return Column(children: [
      // The paragraph
      Container(
        margin: .only(left: 40, right: 40, top: 15),
        alignment: .centerLeft,
        child: Text(
          'Seed description placeholder',
          style: styles.textStyleParagraph,
          maxLines: 5,
        ),
      ),
      // Container for the seed
      GestureDetector(
        behavior: .opaque,
        onTap: () {
          if (obscureSeed) {
            seedObscured.value = !seedObscured.value;
          }
        },
        child: Column(children: [
          Container(
            padding: const .symmetric(horizontal: 25, vertical: 15),
            margin: const .only(top: 25),
            decoration: BoxDecoration(
              color: theme.backgroundDarkest,
              borderRadius: .circular(25),
            ),
            child: SeedThreeLineText(
              seed: obscureSeed && seedObscured.value
                  ? obscuredSeed.value
                  : seed,
              textStyle: styles.textStyleSeed,
            ),
          ),
          // Tap to reveal or hide
          if (obscureSeed)
            Container(
              margin: .only(top: 8),
              child: Text(
                seedObscured.value ? l10n.tapToReveal : l10n.tapToHide,
                style: styles.textStyleParagraphThinPrimary,
              ),
            )
          else
            const SizedBox(),
        ]),
      ),
    ]);
  }
}
