// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import 'app_simpledialog.dart';

class AppDialogs {
  static void showInProgressDialog(
    BuildContext context,
    String title,
    String content, {
    Widget? contentWidget,
    String? cancelText,
    Function? onCancel,
  }) {
    showAppDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Consumer(builder: (context, ref, _) {
          final l10n = l10nOf(context);
          final styles = ref.watch(stylesProvider);

          final contentPadding = contentWidget != null
              ? const EdgeInsets.only(top: 20, left: 20, right: 20)
              : const EdgeInsetsDirectional.fromSTEB(24, 20, 24, 24);

          return AppAlertDialog(
            title: Text(title, style: styles.textStyleButtonPrimaryOutline),
            contentPadding: contentPadding,
            content: SingleChildScrollView(
              child: contentWidget ??
                  Text(content, style: styles.textStyleParagraph),
            ),
            actions: onCancel != null
                ? [
                    TextButton(
                      style: styles.dialogButtonStyle,
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 100),
                        child: Text(
                          cancelText ?? l10n.cancel.toUpperCase(),
                          style: styles.textStyleDialogButtonText,
                        ),
                      ),
                      onPressed: () {
                        appRouter.pop(context);
                        onCancel.call();
                      },
                    ),
                  ]
                : null,
          );
        }),
      ),
    );
  }

  static void showInfoDialog(
    BuildContext context,
    String title,
    String content, {
    Widget? contentWidget,
    String? closeText,
    Function? onClose,
  }) {
    showAppDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Consumer(builder: (context, ref, _) {
          final l10n = l10nOf(context);
          final styles = ref.watch(stylesProvider);

          final contentPadding = contentWidget != null
              ? const EdgeInsets.only(top: 20, left: 20, right: 20)
              : const EdgeInsetsDirectional.fromSTEB(24, 20, 24, 24);

          return AppAlertDialog(
            title: Text(title, style: styles.textStyleButtonPrimaryOutline),
            contentPadding: contentPadding,
            content: SingleChildScrollView(
              child: contentWidget ??
                  Text(content, style: styles.textStyleParagraph),
            ),
            actions: [
              TextButton(
                style: styles.dialogButtonStyle,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 100),
                  child: Text(
                    closeText ?? l10n.close.toUpperCase(),
                    style: styles.textStyleDialogButtonText,
                  ),
                ),
                onPressed: () {
                  appRouter.pop(context);
                  onClose?.call();
                },
              ),
            ],
          );
        }),
      ),
    );
  }

  static void showConfirmDialog(
    BuildContext context,
    String title,
    String content,
    String buttonText,
    Function onPressed, {
    Widget? contentWidget,
    String? cancelText,
    Function? cancelAction,
  }) {
    showAppDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Consumer(builder: (context, ref, _) {
          if (cancelText == null) {
            final l10n = l10nOf(context);
            cancelText = l10n.cancel.toUpperCase();
          }
          final styles = ref.watch(stylesProvider);

          final contentPadding = contentWidget != null
              ? const EdgeInsets.only(top: 20, left: 20, right: 20)
              : const EdgeInsetsDirectional.fromSTEB(24, 20, 24, 24);

          return AppAlertDialog(
            title: Text(
              title,
              style: styles.textStyleButtonPrimaryOutline,
            ),
            contentPadding: contentPadding,
            content: SingleChildScrollView(
              child: contentWidget ??
                  Text(content, style: styles.textStyleParagraph),
            ),
            actions: [
              TextButton(
                style: styles.dialogButtonStyle,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 120),
                  child: Text(
                    cancelText!,
                    style: styles.textStyleDialogButtonText,
                  ),
                ),
                onPressed: () {
                  appRouter.pop(context);
                  cancelAction?.call();
                },
              ),
              TextButton(
                style: styles.dialogButtonStyle,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 120),
                  child: Text(
                    buttonText,
                    style: styles.textStyleDialogButtonText,
                  ),
                ),
                onPressed: () {
                  appRouter.pop(context);
                  onPressed();
                },
              ),
            ],
          );
        });
      },
    );
  }
}
