import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../kaspa/wallet_service/wallet_service.dart';
import 'hash_card.dart';
import 'signature_card.dart';

class SignatureWidget extends ConsumerWidget {
  final SignatureDetails details;

  const SignatureWidget({super.key, required this.details});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        const SizedBox(height: 16),
        SignatureCard(signature: details.signature),
        const SizedBox(height: 16),
        HashCard(hash: details.hash),
        const SizedBox(height: 16),
      ],
    );
  }
}
