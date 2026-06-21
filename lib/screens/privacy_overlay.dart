import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_constants.dart';
import '../core/core_providers.dart';
import '../widgets/content_wrapper.dart';

class PrivacyOverlay extends ConsumerWidget {
  const PrivacyOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);

    return ContentWrapper(
      child: Column(
        mainAxisAlignment: .spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: .center,
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
            style: styles.textStyleSettingsHeader.copyWith(letterSpacing: 3),
          ),
          const SizedBox(),
          const SizedBox(),
        ],
      ),
    );
  }
}
