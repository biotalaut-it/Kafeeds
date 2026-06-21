import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../util/ui_util.dart';
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/app_text_field.dart';
import '../widgets/buttons.dart';
import '../widgets/dismiss_action_buttons.dart';
import '../widgets/sheet_widget.dart';

class DisablePasswordSheet extends HookConsumerWidget {
  const DisablePasswordSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final passwordFocusNode = useFocusNode();
    final passwordController = useTextEditingController();
    final passwordError = useState('');

    Future<void> submitAndDecrypt() async {
      final password = passwordController.text;
      if (password.isEmpty) {
        passwordError.value = l10n.passwordBlank;
        return;
      }
      try {
        final auth = ref.read(walletAuthProvider.notifier);
        await auth.removePassword(password);

        UIUtil.showSnackbar(l10n.disablePasswordSuccess);

        if (!context.mounted) return;
        appRouter.pop(context);
      } catch (e) {
        passwordError.value = l10n.invalidPassword;
      }
    }

    return SheetWidget(
      title: l10n.disablePasswordSheetHeader,
      mainWidget: Column(
        children: [
          Container(
            margin: const .directional(start: 40, end: 40, top: 16),
            child: AutoSizeText(
              l10n.passwordNoLongerRequiredToOpenParagraph,
              style: styles.textStyleParagraph,
              maxLines: 5,
              stepGranularity: 0.5,
            ),
          ),
          Column(
            children: [
              AppTextField(
                topMargin: 30,
                padding: .directional(start: 16, end: 16),
                focusNode: passwordFocusNode,
                controller: passwordController,
                textInputAction: .done,
                maxLines: 1,
                autocorrect: false,
                onChanged: (String newText) {
                  passwordError.value = '';
                },
                hintText: l10n.enterPasswordHint,
                keyboardType: .text,
                obscureText: true,
                style: styles.textStyleParagraphText,
              ),
              Container(
                alignment: .center,
                margin: .only(top: 3),
                child: Text(
                  passwordError.value,
                  style: styles.textStyleParagraphThinPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
      bottomWidget: ActionButtonsWrapper(
        buttons: [
          PrimaryButton(
            title: l10n.disablePasswordSheetHeader,
            onPressed: submitAndDecrypt,
          ),
          const CancelActionButton(),
        ],
      ),
    );
  }
}
