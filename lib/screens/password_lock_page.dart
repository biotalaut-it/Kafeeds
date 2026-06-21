import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../util/caseconverter.dart';
import '../widgets/action_buttons_wrapper.dart';
import '../widgets/app_text_field.dart';
import '../widgets/buttons.dart';
import '../widgets/content_wrapper.dart';
import '../widgets/logout_button.dart';

class PasswordLockPage extends HookConsumerWidget {
  final bool canCancel;
  final Future<bool> Function(String password) validator;

  const PasswordLockPage({
    super.key,
    required this.canCancel,
    required this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final wallet = ref.watch(walletProvider);

    final enterFocusNode = useFocusNode();
    final enterController = useTextEditingController();
    final passwordError = useState<String>('');
    final unlockDisabled = useState<bool>(false);

    Future<void> validateAndUnlock() async {
      try {
        final password = enterController.text;
        final valid = await validator(password);
        if (!valid) {
          throw Exception('Invalid password');
        }
        if (canCancel) {
          if (!context.mounted) return;
          appRouter.pop(context, withResult: valid);
        }
      } catch (e) {
        passwordError.value = l10n.invalidPassword;
        unlockDisabled.value = true;
        Future.delayed(const Duration(seconds: 2), () {
          if (context.mounted) {
            unlockDisabled.value = false;
          }
        });
      }
    }

    final height = MediaQuery.heightOf(context);
    final top = height * 0.1;

    return ContentWrapper(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const .fromSTEB(20, 16, 12, 4),
                child: canCancel ? const BackButton() : const LogoutButton(),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: .only(top: top),
                  child: Icon(
                    AppIcons.lock,
                    size: 80,
                    color: theme.primary,
                  ),
                ),
                Container(
                  margin: const .only(top: 10),
                  child: Text(
                    CaseChange.toUpperCase(l10n.locked, ref),
                    style: styles.textStyleHeaderColored,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Text(wallet.name, style: styles.textStyleAccount),
                      AppTextField(
                        topMargin: 10,
                        padding: .directional(start: 16, end: 16),
                        focusNode: enterFocusNode,
                        controller: enterController,
                        textInputAction: .go,
                        autofocus: true,
                        onChanged: (_) => passwordError.value = '',
                        onSubmitted: (value) {
                          FocusScope.of(context).unfocus();
                          if (!unlockDisabled.value) {
                            validateAndUnlock();
                          }
                        },
                        hintText: l10n.enterPasswordHint,
                        keyboardType: .text,
                        obscureText: true,
                        textAlign: .center,
                        style: styles.textStyleParagraphPrimary,
                      ),
                      Container(
                        alignment: AlignmentDirectional(0, 0),
                        margin: const .only(top: 3),
                        child: Text(
                          passwordError.value,
                          style: styles.textStyleParagraphThinPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ActionButtonsWrapper(
            buttons: [
              PrimaryButton(
                title: l10n.unlock,
                disabled: unlockDisabled.value,
                onPressed: validateAndUnlock,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
