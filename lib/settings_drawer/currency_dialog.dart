import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../settings/available_currency.dart';
import '../util/util.dart';
import '../widgets/scrollable_options_dialog.dart';

const kCoinGeckoUrl = 'https://www.coingecko.com';

// Yadio's terms require citing yadio.io as the source with a backlink.
const kYadioUrl = 'https://yadio.io';

const kCoinGeckoBrand = 'CoinGecko';
const kYadioBrand = 'yadio.io';

(String, String)? splitAroundBrand(String text, String brand) {
  final index = text.indexOf(brand);
  if (index < 0) return null;
  return (text.substring(0, index), text.substring(index + brand.length));
}

class CurrencyDialog extends HookConsumerWidget {
  const CurrencyDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final style = styles.textStyleDialogOptions;
    final footerStyle = styles.textStyleDialogFooter;
    final linkStyle = styles.textStyleDialogFooterLink;

    final coinGeckoTap = useMemoized(
      () => TapGestureRecognizer()..onTap = () => openUrl(kCoinGeckoUrl),
    );
    final yadioTap = useMemoized(
      () => TapGestureRecognizer()..onTap = () => openUrl(kYadioUrl),
    );
    useEffect(() {
      return () {
        coinGeckoTap.dispose();
        yadioTap.dispose();
      };
    }, [coinGeckoTap, yadioTap]);

    final poweredBy = l10n.currencyPoweredBy;
    final parts = splitAroundBrand(poweredBy, kCoinGeckoBrand);

    return ScrollableOptionsDialog(
      title: l10n.currency,
      options: [
        for (final value in AvailableCurrencies.values)
          SimpleDialogOption(
            onPressed: () => appRouter.pop(context, withResult: value),
            child: Padding(
              padding: const .symmetric(vertical: 8),
              child: Text(
                AvailableCurrency(value).getDisplayName(context),
                style: style,
              ),
            ),
          ),
      ],
      // One line that wraps if the translation is long, rather than a fixed
      // two-line block.
      footer: Text.rich(
        TextSpan(
          style: footerStyle,
          children: [
            if (parts case (final before, final after)) ...[
              TextSpan(text: before),
              TextSpan(
                text: kCoinGeckoBrand,
                style: linkStyle,
                recognizer: coinGeckoTap,
              ),
              TextSpan(text: after),
            ] else
              // The translation localizes the brand, so link it whole.
              TextSpan(
                text: poweredBy,
                style: linkStyle,
                recognizer: coinGeckoTap,
              ),
            const TextSpan(text: ' & '),
            TextSpan(
              text: kYadioBrand,
              style: linkStyle,
              recognizer: yadioTap,
            ),
          ],
        ),
      ),
    );
  }
}
