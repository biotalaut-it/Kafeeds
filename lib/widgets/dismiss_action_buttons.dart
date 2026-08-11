import 'package:flutter/material.dart';

import '../app_router.dart';
import '../l10n/l10n.dart';
import 'buttons/primary_outline_button.dart';

class CloseActionButton extends StatelessWidget {
  const CloseActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);

    return PrimaryOutlineButton(
      title: l10n.close,
      onPressed: () => appRouter.maybePop(context),
    );
  }
}

class CancelActionButton extends StatelessWidget {
  const CancelActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);

    return PrimaryOutlineButton(
      title: l10n.cancel,
      onPressed: () => appRouter.maybePop(context),
    );
  }
}
