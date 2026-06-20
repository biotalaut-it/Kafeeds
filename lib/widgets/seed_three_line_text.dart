import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';

class SeedThreeLineText extends ConsumerWidget {
  final String seed;
  final TextStyle? textStyle;

  const SeedThreeLineText({
    super.key,
    required this.seed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.read(stylesProvider);
    final textStyle = this.textStyle ?? styles.textStyleSeed;

    if (seed.length != 128 && seed.length != 64) {
      return const SizedBox();
    }

    if (seed.length == 128) {
      final partOne = seed.substring(0, 33);
      final partTwo = seed.substring(33, 66);
      final partThree = seed.substring(66, 99);
      final partFour = seed.substring(99, 128);
      return Column(
        children: [
          Text(partOne, style: textStyle),
          Text(partTwo, style: textStyle),
          Text(partThree, style: textStyle),
          Text(partFour, style: textStyle),
        ],
      );
    }
    final stringPartOne = seed.substring(0, 22);
    final stringPartTwo = seed.substring(22, 44);
    final stringPartThree = seed.substring(44, 64);
    return Column(
      children: [
        Text(stringPartOne, style: textStyle),
        Text(stringPartTwo, style: textStyle),
        Text(stringPartThree, style: textStyle),
      ],
    );
  }
}
