import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kKasIconPath = 'assets/kas_icon.png';

class KasIconWidget extends ConsumerWidget {
  final Size size;

  const KasIconWidget({
    super.key,
    this.size = const Size(40, 40),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: .center,
      children: [
        ClipRRect(
          borderRadius: .circular(size.width / 2),
          child: Image.asset(
            kKasIconPath,
            width: size.width,
            height: size.height,
            filterQuality: .medium,
            isAntiAlias: true,
          ),
        ),
      ],
    );
  }
}
