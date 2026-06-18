import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import '../core/core_providers.dart';

class PrivacyOverlay extends ConsumerWidget {
  const PrivacyOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);

    final height = MediaQuery.heightOf(context);
    final top = height * 0.075;
    final bottom = height * 0.035;

    return Scaffold(
      backgroundColor: theme.backgroundDark,
      body: SafeArea(
        minimum: .only(top: top, bottom: bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: FractionallySizedBox(
                    widthFactor: 0.4,
                    child: Image.asset('assets/kaspa.png'),
                  ),
                ),
              ],
            ),
            Text(
              kWalletTitle.toUpperCase(),
              style: styles.textStyleSettingsHeader
                  .copyWith(fontWeight: FontWeight.w700)
                  .copyWith(letterSpacing: 3)
                  .copyWith(color: theme.text),
            ),
            const SizedBox(),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
