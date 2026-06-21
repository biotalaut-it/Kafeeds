import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../app_providers.dart';
import '../../app_styles.dart';
import '../../l10n/l10n.dart';
import '../../widgets/dialog.dart';
import 'node_types.dart';

class NodeItem extends ConsumerWidget {
  final ActiveNodeConfig config;
  final bool isSelectedConfig;
  final void Function(ActiveNodeConfig item) onSelected;

  const NodeItem({
    super.key,
    required this.config,
    required this.isSelectedConfig,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    void delete() {
      final notifier = ref.read(kaspaNodeSettingsProvider.notifier);
      notifier.removeOption(config.config);
    }

    void confirmDelete() {
      final title = l10n.nodeDeleteTitle;
      final content = '${l10n.nodeDeleteMessage} ${config.name}?';
      AppDialogs.showConfirmDialog(
        context,
        title,
        content,
        l10n.yesUppercase,
        delete,
        cancelText: l10n.noUppercase,
      );
    }

    return Slidable(
      enabled: !isSelectedConfig,
      endActionPane: ActionPane(
        extentRatio: 0.16,
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            icon: Icons.delete,
            backgroundColor: theme.primary,
            foregroundColor: theme.backgroundDark,
            onPressed: (_) => confirmDelete(),
          ),
        ],
      ),
      child: Column(
        children: [
          TextButton(
            style: styles.defaultTextButtonStyle,
            onPressed: () => onSelected(config),
            child: Container(
              padding: const .all(8),
              child: Row(
                mainAxisSize: .min,
                children: [
                  Radio(value: config, activeColor: theme.primary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .stretch,
                      children: [
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                config.name,
                                style: styles.textStyleSettingItemHeader,
                              ),
                            ),
                            Container(
                              margin: const .only(top: 4, right: 4),
                              padding: .fromSTEB(6, 2, 6, 2),
                              decoration: BoxDecoration(
                                color: theme.text10,
                                borderRadius: .circular(4),
                              ),
                              child: Text(
                                config.networkId.toUpperCase(),
                                style: styles.tagText.copyWith(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  config.url,
                                  style: styles.textStyleAddressText60.copyWith(
                                    fontSize: AppFontSizes.smallest,
                                    height: 1.2,
                                    overflow: .ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                if (config.isSecure)
                                  Tooltip(
                                    message: l10n.nodeSecureConnection,
                                    child: Icon(
                                      Icons.lock,
                                      size: 12,
                                      color: theme.text60,
                                    ),
                                  ),
                              ],
                            ),
                            if (isSelectedConfig)
                              Row(
                                children: [
                                  Consumer(
                                    builder: (context, ref, child) {
                                      final daa = ref.watch(
                                        virtualDaaScoreProvider,
                                      );
                                      return daa.maybeWhen(
                                        data: (value) => Text(
                                          value.toString(),
                                          style: styles.textStyleAddressText60
                                              .copyWith(
                                                fontSize: AppFontSizes.smallest,
                                                height: 1.2,
                                              ),
                                        ),
                                        orElse: () => const SizedBox(),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 4),
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
