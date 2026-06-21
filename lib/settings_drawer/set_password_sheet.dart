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

class SetPasswordSheet extends HookConsumerWidget {
  const SetPasswordSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = l10nOf(context);
    final styles = ref.watch(stylesProvider);

    final createFocusNode = useFocusNode();
    final createController = useTextEditingController();
    final confirmFocusNode = useFocusNode();
    final confirmController = useTextEditingController();
    final passwordError = useState<String>('');
    final passwordsMatch = useState(false);

    final textStyle = passwordsMatch.value
        ? styles.textStyleParagraphPrimary
        : styles.textStyleParagraphText;

    void inputChanged(_) {
      passwordError.value = '';
      passwordsMatch.value = confirmController.text == createController.text;
    }

    bool validInputs() {
      if (createController.text.isEmpty || confirmController.text.isEmpty) {
        passwordError.value = l10n.passwordBlank;
        return false;
      } else if (createController.text != confirmController.text) {
        passwordError.value = l10n.passwordsDontMatch;
        return false;
      }
      return true;
    }

    Future<void> submitAndEncrypt() async {
      if (!validInputs()) return;

      try {
        final password = confirmController.text;
        final auth = ref.read(walletAuthProvider.notifier);
        await auth.setPassword(password);

        if (!context.mounted) return;

        UIUtil.showSnackbar(l10n.setPasswordSuccess);
        appRouter.pop(context);
      } catch (e, st) {
        final log = ref.read(loggerProvider);
        log.e('Failed to set password', error: e, stackTrace: st);

        appRouter.pop(context);
        UIUtil.showSnackbar(l10n.encryptionFailedError);
      }
    }

    return SheetWidget(
      title: l10n.createPasswordSheetHeader,
      mainWidget: Column(
        crossAxisAlignment: .center,
        children: [
          Container(
            margin: .only(left: 40, right: 40, top: 16),
            child: AutoSizeText(
              l10n.passwordWillBeRequiredToOpenParagraph,
              style: styles.textStyleParagraph,
              maxLines: 5,
              stepGranularity: 0.5,
            ),
          ),
          // Create a Password Text Field
          AppTextField(
            topMargin: 30,
            padding: .symmetric(horizontal: 16),
            focusNode: createFocusNode,
            controller: createController,
            textInputAction: .next,
            maxLines: 1,
            autocorrect: false,
            onChanged: inputChanged,
            hintText: l10n.createPasswordHint,
            keyboardType: .text,
            obscureText: true,
            textAlign: .center,
            style: textStyle,
            onSubmitted: (text) {
              confirmFocusNode.requestFocus();
            },
          ),
          // Confirm Password Text Field
          AppTextField(
            topMargin: 20,
            padding: const .symmetric(horizontal: 16),
            focusNode: confirmFocusNode,
            controller: confirmController,
            textInputAction: .done,
            maxLines: 1,
            autocorrect: false,
            onChanged: inputChanged,
            hintText: l10n.confirmPasswordHint,
            keyboardType: .text,
            obscureText: true,
            textAlign: .center,
            style: textStyle,
          ),
          // Error Text
          Container(
            alignment: AlignmentDirectional(0, 0),
            margin: .only(top: 3),
            child: Text(
              passwordError.value,
              style: styles.textStyleParagraphThinPrimary,
            ),
          ),
        ],
      ),
      bottomWidget: ActionButtonsWrapper(
        buttons: [
          PrimaryButton(title: l10n.setPassword, onPressed: submitAndEncrypt),
          const CancelActionButton(),
        ],
      ),
    );
  }
}
