import 'package:flutter/material.dart';

import 'themes/themes.dart';

const kDefaultFontFamily = 'NunitoSans';
const kMonospaceFontFamily = 'RobotoMono';

class AppFontSizes {
  static const smallest = 12.0;
  static const small = 14.0;
  static const medium = 16.0;
  static const large = 20.0;
  static const larger = 24.0;
  static const largest = 28.0;
  static const largestc = 28.0;
}

class AppStyles {
  final BaseTheme theme;

  AppStyles(this.theme);
  // Text style for paragraph text.
  late final textStyleParagraph = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.medium,
    fontWeight: .w400,
    color: theme.text,
  );

  late final textStyleParagraphNormal = textStyleParagraph.copyWith(
    fontWeight: .w400,
  );

  late final textStyleParagraphSmall = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.small,
    fontWeight: .w400,
    color: theme.text,
  );

  late final textStyleParagraphBold = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.medium,
    fontWeight: .w400,
    color: theme.text,
  );

  // Text style for paragraph text with primary color.
  late final textStyleParagraphPrimary = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.medium,
    fontWeight: .w700,
    color: theme.primary,
  );

  late final textStyleParagraphPrimaryNormal = textStyleParagraphPrimary
      .copyWith(fontWeight: .w400);

  // Text style for paragraph text with text color.
  late final textStyleParagraphText = textStyleParagraphPrimary.copyWith(
    color: theme.text,
  );

  // Text style for paragraph text with primary color.
  late final textStyleParagraphSuccess = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.small,
    fontWeight: .w700,
    color: theme.success,
  );

  // Text style for thin paragraph text with primary color.
  late final textStyleParagraphThinPrimary = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.small,
    fontWeight: .w600,
    color: theme.primary,
  );

  // Text style for thin paragraph text with success color.
  late final textStyleParagraphThinSuccess = textStyleParagraphThinPrimary
      .copyWith(color: theme.success);

  // For snackbar/Toast text
  late final textStyleSnackbar = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.small,
    fontWeight: .w700,
    color: theme.background,
  );

  // Text style for primary button
  late final textStyleButtonPrimary = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.large,
    fontWeight: .w700,
    color: theme.background,
  );

  // Green primary button
  late final textStyleButtonPrimaryGreen = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.large,
    fontWeight: .w700,
    color: theme.successDark,
  );

  // Text style for outline button
  late final textStyleButtonPrimaryOutline = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.large,
    fontWeight: .w700,
    color: theme.primary,
  );

  // Text style for small outline button
  late final textStyleButtonPrimarySmallOutline = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.small,
    fontWeight: .w700,
    color: theme.primary,
  );

  // Text style for small success outline button
  late final textStyleButtonSuccessSmallOutline = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.small,
    fontWeight: .w700,
    color: theme.success,
  );

  late final textStyleButtonPrimaryOutlineDisabled = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.large,
    fontWeight: .w700,
    color: theme.primary60,
  );

  // Text style for success outline button
  late final textStyleButtonSuccessOutline = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.large,
    fontWeight: .w700,
    color: theme.success,
  );

  // Text style for text outline button
  late final textStyleButtonTextOutline = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.large,
    fontWeight: .w700,
    color: theme.text,
  );

  // General address/seed styles
  late final textStyleAddressPrimary60 = TextStyle(
    color: theme.primary60,
    fontSize: AppFontSizes.small,
    height: 1.5,
    fontWeight: .w400,
    fontFamily: kMonospaceFontFamily,
  );

  late final textStyleAddressPrimary = TextStyle(
    color: theme.primary,
    fontSize: AppFontSizes.small,
    height: 1.5,
    fontWeight: .w400,
    fontFamily: kMonospaceFontFamily,
  );

  late final textStyleAddressSuccess = TextStyle(
    color: theme.success,
    fontSize: AppFontSizes.small,
    height: 1.5,
    fontWeight: .w400,
    fontFamily: kMonospaceFontFamily,
  );

  late final textStyleAddressText60 = TextStyle(
    color: theme.text60,
    fontSize: AppFontSizes.small,
    height: 1.5,
    fontWeight: .w400,
    fontFamily: kMonospaceFontFamily,
  );

  late final textStyleAddressText90 = TextStyle(
    color: theme.text,
    fontSize: AppFontSizes.small,
    height: 1.5,
    fontWeight: .w400,
    fontFamily: kMonospaceFontFamily,
  );

  late final textStyleAccount = TextStyle(
    color: theme.text60,
    fontSize: 16,
    fontWeight: .w700,
    fontFamily: kDefaultFontFamily,
  );

  late final textStyleWalletTitle = TextStyle(
    color: theme.text,
    fontSize: 16,
    fontWeight: .w700,
    fontFamily: kDefaultFontFamily,
  );

  late final textStyleAccountName = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontWeight: .w500,
    fontSize: 16,
    color: theme.text,
  );

  late final textStyleTotalValue = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontWeight: .w500,
    fontSize: 14,
    color: theme.text,
  );

  late final textStyleDataTypeHeader = TextStyle(
    fontWeight: .w500,
    fontSize: 12,
    color: theme.text30,
    fontFamily: kDefaultFontFamily,
  );

  late final textStyleDataTypeHeaderHighlight = TextStyle(
    fontWeight: .w500,
    fontSize: 12,
    color: theme.primary,
    fontFamily: kDefaultFontFamily,
  );

  late final textStyleDataTypeHeaderSuccess = textStyleDataTypeHeaderHighlight
      .copyWith(color: theme.success);

  late final textStyleDataTypeHeaderSelected = TextStyle(
    fontWeight: .w500,
    fontSize: 12,
    color: theme.text,
    fontFamily: kDefaultFontFamily,
  );

  // Text style for alternate currencies on home page
  late final textStyleCurrencyAlt = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.small,
    fontWeight: .w600,
    color: theme.text60,
  );

  late final textStyleCurrencyAltHidden = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.small,
    fontWeight: .w600,
    color: Colors.transparent,
  );

  // Text style for primary currency on home page
  late final textStyleCurrency = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.larger,
    fontWeight: .w900,
    color: theme.primary,
  );

  late final textStyleHeaderSuccess = TextStyle(
    fontSize: 28,
    fontWeight: .w700,
    color: theme.success,
    fontFamily: kDefaultFontFamily,
  );

  // Text style for primary currency on home page
  late final textStyleCurrencySmaller = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: 22,
    fontWeight: .w900,
    color: theme.primary,
  );

  /* Transaction cards */
  // Text style for transaction card "Received"/"Sent" text
  late final textStyleTransactionType = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.small,
    fontWeight: .w600,
    color: theme.text,
  );

  // Amount
  late final textStyleTransactionAmount = TextStyle(
    fontFamily: kDefaultFontFamily,
    color: theme.primary,
    fontSize: AppFontSizes.smallest,
    fontWeight: .w600,
  );

  late final textStyleTransactionAmountSmall = textStyleTransactionAmount
      .copyWith(fontSize: AppFontSizes.small);

  late final textStyleTransactionAmountMedium = textStyleTransactionAmount
      .copyWith(fontSize: AppFontSizes.medium);

  // Unit (e.g. VITE)
  late final textStyleTransactionUnit = TextStyle(
    fontFamily: kDefaultFontFamily,
    color: theme.primary60,
    fontSize: AppFontSizes.smallest,
    fontWeight: .w400,
  );

  late final textStyleBalanceAmountMedium = TextStyle(
    fontFamily: kDefaultFontFamily,
    color: theme.primary60,
    fontSize: AppFontSizes.medium,
    fontWeight: .w700,
  );

  late final textStyleBalanceAmountSmall = TextStyle(
    fontFamily: kDefaultFontFamily,
    color: theme.primary60,
    fontSize: AppFontSizes.small,
    fontWeight: .w700,
  );

  late final textStyleTransactionUnitMedium = TextStyle(
    fontFamily: kDefaultFontFamily,
    color: theme.primary60,
    fontSize: AppFontSizes.medium,
    fontWeight: .w400,
  );

  late final textStyleTransactionUnitSmall = TextStyle(
    fontFamily: kDefaultFontFamily,
    color: theme.primary60,
    fontSize: AppFontSizes.small,
    fontWeight: .w400,
  );

  // Address
  late final textStyleTransactionAddress = TextStyle(
    fontSize: AppFontSizes.smallest,
    fontFamily: kMonospaceFontFamily,
    fontWeight: .w400,
    color: theme.text60,
  );

  // Transaction Welcome
  late final textStyleTransactionWelcome = TextStyle(
    fontSize: AppFontSizes.small,
    fontWeight: .w400,
    color: theme.text,
    fontFamily: kDefaultFontFamily,
  );

  // Transaction Welcome Text
  late final textStyleTransactionWelcomePrimary = TextStyle(
    fontSize: AppFontSizes.small,
    fontWeight: .w400,
    color: theme.primary,
    fontFamily: kDefaultFontFamily,
  );

  // Version info in settings
  late final textStyleVersion = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.small,
    fontWeight: .w400,
    color: theme.text60,
  );

  late final textStyleVersionUnderline = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.small,
    fontWeight: .w400,
    color: theme.text60,
    decoration: TextDecoration.underline,
  );

  // Text style for alert dialog header
  late final textStyleDialogHeader = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.large,
    fontWeight: .w700,
    color: theme.primary,
  );

  // Text style for dialog options
  late final textStyleDialogOptions = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.medium,
    fontWeight: .w600,
    color: theme.primary,
  );

  // Text style for app text field
  late final textStyleAppTextField = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.medium,
    fontWeight: .w600,
    color: theme.primary,
  );

  late final textStyleAppTextFieldHint = TextStyle(
    fontSize: AppFontSizes.medium,
    fontWeight: .w400,
    fontFamily: kDefaultFontFamily,
    color: theme.text60,
  );

  late final textStyleAppTextFieldSimple = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.medium,
    fontWeight: .w600,
    color: theme.text,
  );

  // Text style for dialog button text
  late final textStyleDialogButtonText = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.smallest,
    fontWeight: .w600,
    color: theme.primary,
  );

  late final textStyleDialogButtonTextSimple = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.smallest,
    fontWeight: .w600,
    color: theme.text,
  );

  // Text style for seed text
  late final textStyleSeedPrimary = TextStyle(
    fontSize: AppFontSizes.small,
    fontWeight: .w400,
    fontFamily: kMonospaceFontFamily,
    color: theme.primary,
    height: 1.5,
    letterSpacing: 1,
  );

  late final textStyleSeed = TextStyle(
    fontSize: AppFontSizes.small,
    fontWeight: .w400,
    fontFamily: kMonospaceFontFamily,
    color: theme.text,
    height: 1.5,
    letterSpacing: 1,
  );

  late final textStyleSeedGray = TextStyle(
    fontSize: AppFontSizes.small,
    fontWeight: .w400,
    fontFamily: kMonospaceFontFamily,
    color: theme.text60,
    height: 1.5,
    letterSpacing: 1,
  );

  // Text style for mnemonic text
  late final textStyleMnemonicText = TextStyle(
    fontSize: AppFontSizes.small,
    fontWeight: .w400,
    fontFamily: kMonospaceFontFamily,
    color: theme.primary,
    height: 1,
    letterSpacing: 1,
  );

  late final textStyleMnemonicTextGray = TextStyle(
    fontSize: AppFontSizes.small,
    fontWeight: .w400,
    fontFamily: kMonospaceFontFamily,
    color: theme.text60,
    height: 1,
    letterSpacing: 1,
  );

  late final textStyleSeedGreen = TextStyle(
    fontSize: AppFontSizes.small,
    fontWeight: .w400,
    fontFamily: kMonospaceFontFamily,
    color: theme.success,
    height: 1.5,
    letterSpacing: 1,
  );

  // Text style for general headers like sheet headers
  late final textStyleHeader = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.larger,
    letterSpacing: 1.4,
    fontWeight: .w700,
    color: theme.text,
  );

  // Text style for data sub headers
  late final textStyleSubHeader = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.medium,
    letterSpacing: 1.4,
    fontWeight: .w400,
    color: theme.text,
  );

  late final textStyleSubHeaderUnselected = textStyleSubHeader.copyWith(
    color: theme.text.withValues(alpha: 0.3),
  );

  late final textStyleSubHeaderSuccess = textStyleSubHeader.copyWith(
    color: theme.success,
  );

  // Text style for settings headers
  late final textStyleSettingsHeader = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.largest,
    fontWeight: .w700,
    color: theme.text,
  );

  // Text style for primary color header
  late final textStyleHeaderColored = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.largest,
    fontWeight: .w700,
    color: theme.primary,
  );

  // Text style for primary color header
  late final textStyleHeader2Colored = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.larger,
    fontWeight: .w700,
    color: theme.primary,
  );

  late final textStylePinScreenHeaderColored = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.large,
    fontWeight: .w700,
    color: theme.primary,
  );

  late final textStyleLogoutButton = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.small,
    fontWeight: .w600,
    color: theme.text,
  );

  // Text style for setting item header
  late final textStyleSettingItemHeader = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.medium,
    fontWeight: .w600,
    color: theme.text,
  );

  late final textStyleSettingItemHeaderLarge = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: 18,
    fontWeight: .w600,
    color: theme.text,
  );

  late final textStyleSettingItemHeader60 = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.medium,
    fontWeight: .w600,
    color: theme.text60,
  );

  late final textStyleSettingItemHeader45 = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.medium,
    fontWeight: .w600,
    color: theme.text45,
  );

  // Text style for setting item subheader
  late final textStyleSettingItemSubheader = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.smallest,
    fontWeight: .w400,
    color: theme.text60,
  );

  late final textStyleSettingItemSubheader30 = TextStyle(
    fontFamily: kDefaultFontFamily,
    fontSize: AppFontSizes.smallest,
    fontWeight: .w400,
    color: theme.text30,
  );

  // Text style for lock screen error
  late final textStyleErrorMedium = TextStyle(
    fontSize: AppFontSizes.small,
    color: theme.primary,
    fontFamily: kDefaultFontFamily,
    fontWeight: .w600,
  );

  // Text style for mnemonic
  late final textStyleMnemonic = TextStyle(
    fontSize: AppFontSizes.small,
    color: theme.primary,
    fontFamily: kMonospaceFontFamily,
    fontWeight: .w400,
  );

  // Text style for mnemonic success
  late final textStyleMnemonicSuccess = TextStyle(
    fontSize: AppFontSizes.small,
    color: theme.success,
    fontFamily: kMonospaceFontFamily,
    fontWeight: .w400,
  );

  // Text style for numbers of mnemonic
  late final textStyleNumbersOfMnemonic = TextStyle(
    fontSize: AppFontSizes.small,
    color: theme.text30,
    fontFamily: kMonospaceFontFamily,
    fontWeight: .w400,
  );

  // Text style for numbers of mnemonic
  late final headerPrimary = TextStyle(
    fontSize: 16,
    color: theme.primary,
    fontFamily: kDefaultFontFamily,
    fontWeight: .w700,
  );

  late final headerSuccess = TextStyle(
    fontSize: 16,
    color: theme.success,
    fontFamily: kDefaultFontFamily,
    fontWeight: .w700,
  );

  late final textStyleApproxAmountSuccess = TextStyle(
    fontSize: 16,
    color: theme.success,
    fontFamily: kDefaultFontFamily,
    fontWeight: .w700,
  );

  late final textStyleTokenSymbolSuccess = TextStyle(
    color: theme.success,
    fontSize: 16,
    fontWeight: .w400,
    fontFamily: kDefaultFontFamily,
  );

  late final addressText = TextStyle(
    fontSize: 12,
    color: theme.text,
    fontFamily: kDefaultFontFamily,
    fontWeight: .w400,
  );

  late final tagText = TextStyle(
    fontSize: 12,
    color: theme.text60,
    fontFamily: kDefaultFontFamily,
    fontWeight: .w400,
  );

  late final remoteMessageCardTitle = TextStyle(
    fontSize: 20,
    color: theme.success,
    fontFamily: kDefaultFontFamily,
    fontWeight: .w500,
  );

  late final remoteMessageCardShortDescription = TextStyle(
    fontSize: 14,
    color: theme.text,
    fontFamily: kDefaultFontFamily,
    fontWeight: .w400,
  );

  late final remoteMessageCardTimestamp = TextStyle(
    fontSize: 12,
    color: theme.text60,
    fontFamily: kDefaultFontFamily,
    fontWeight: .w400,
  );

  late final buttonTextBg = TextStyle(
    fontSize: 18,
    color: theme.background,
    fontFamily: kDefaultFontFamily,
    fontWeight: .w700,
  );

  late final textStyleAccountShortName = TextStyle(
    color: theme.backgroundDark,
    fontSize: 12,
    fontWeight: .w800,
  );

  late final textStyleAccountShortNameSelected = TextStyle(
    color: theme.backgroundDark,
    fontSize: 16,
    fontFamily: kDefaultFontFamily,
    fontWeight: .w900,
  );

  late final textStyleNetworkBanner = TextStyle(
    color: theme.text,
    fontSize: 12 * 0.85,
    fontWeight: .w900,
    height: 1.0,
  );

  late final textStyleTabLabel = TextStyle(
    fontSize: 14,
    fontWeight: .w400,
    color: theme.text,
  );

  late final textStyleTextDefaultSmallThin = TextStyle(
    color: theme.text,
    fontFamily: kDefaultFontFamily,
    fontSize: 14,
    fontWeight: .w400,
  );

  late final textStylePrimaryDefaultSmallMedium = TextStyle(
    color: theme.primary,
    fontFamily: kDefaultFontFamily,
    fontSize: 14,
    fontWeight: .w500,
  );

  late final textStyleKeyboardKey = TextStyle(fontWeight: .bold);

  late final textStyleKeyboardWord = TextStyle(
    color: theme.primary,
  );

  ButtonStyle get cardButtonStyle {
    return TextButton.styleFrom(
      backgroundColor: theme.backgroundDark,
      padding: .zero,
      shape: RoundedRectangleBorder(borderRadius: .circular(10)),
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.text15;
        if (states.contains(WidgetState.hovered)) return theme.text05;
        if (states.contains(WidgetState.pressed)) return theme.text15;
        return null;
      }),
    );
  }

  ButtonStyle get darkCardButtonStyle {
    return TextButton.styleFrom(
      backgroundColor: theme.backgroundDarkest,
      padding: .zero,
      shape: RoundedRectangleBorder(borderRadius: .circular(10)),
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.text15;
        if (states.contains(WidgetState.hovered)) return theme.text05;
        if (states.contains(WidgetState.pressed)) return theme.text15;
        return null;
      }),
    );
  }

  ButtonStyle get fieldCardButtonStyle {
    return TextButton.styleFrom(
      backgroundColor: theme.backgroundDarkest,
      padding: .zero,
      shape: RoundedRectangleBorder(borderRadius: .circular(25)),
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.text15;
        if (states.contains(WidgetState.hovered)) return theme.text05;
        if (states.contains(WidgetState.pressed)) return theme.text15;
        return null;
      }),
    );
  }

  ButtonStyle get rowButtonStyle {
    return TextButton.styleFrom(
      padding: .zero,
      shape: const RoundedRectangleBorder(),
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.text15;
        if (states.contains(WidgetState.hovered)) return theme.text05;
        if (states.contains(WidgetState.pressed)) return theme.text15;
        return null;
      }),
    );
  }

  ButtonStyle get defaultTextButtonStyle {
    return TextButton.styleFrom(padding: .zero).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.text15;
        if (states.contains(WidgetState.hovered)) return theme.text05;
        if (states.contains(WidgetState.pressed)) return theme.text15;
        return null;
      }),
    );
  }

  ButtonStyle get roundedTextButtonStyle {
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: .circular(50)),
      padding: .zero,
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.text15;
        if (states.contains(WidgetState.hovered)) return theme.text05;
        if (states.contains(WidgetState.pressed)) return theme.text15;
        return null; // Defer to the widget's default.
      }),
    );
  }

  ButtonStyle get dialogButtonStyle {
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: .circular(10)),
      padding: const .all(12),
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.text15;
        if (states.contains(WidgetState.hovered)) return theme.text05;
        if (states.contains(WidgetState.pressed)) return theme.text15;
        return null;
      }),
    );
  }

  ButtonStyle get accountButtonStyle {
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: .circular(10)),
      padding: const .all(12),
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.text15;
        if (states.contains(WidgetState.hovered)) return theme.text05;
        if (states.contains(WidgetState.pressed)) return theme.text15;
        return null;
      }),
    );
  }

  ButtonStyle get quotaButtonStyle {
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: .circular(10)),
      padding: const .symmetric(horizontal: 12),
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.text15;
        if (states.contains(WidgetState.hovered)) return theme.text05;
        if (states.contains(WidgetState.pressed)) return theme.text15;
        return null;
      }),
    );
  }

  ButtonStyle get walletButtonStyle =>
      TextButton.styleFrom(padding: .zero).copyWith(
        overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.focused)) {
            return theme.backgroundDark.withValues(alpha: 0.45);
          }
          if (states.contains(WidgetState.hovered)) {
            return theme.backgroundDark.withValues(alpha: 0.45);
          }
          if (states.contains(WidgetState.pressed)) {
            return theme.backgroundDark.withValues(alpha: 0.75);
          }
          return null;
        }),
      );

  ButtonStyle get roundButtonStyle {
    return TextButton.styleFrom(
      shape: const CircleBorder(),
      padding: .zero,
      tapTargetSize: .padded,
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.text15;
        if (states.contains(WidgetState.hovered)) return theme.text05;
        if (states.contains(WidgetState.pressed)) return theme.text15;
        return null; // Defer to the widget's default.
      }),
    );
  }

  ButtonStyle get appIconButtonStyle {
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: .circular(50)),
      padding: .zero,
      tapTargetSize: .padded,
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.text15;
        if (states.contains(WidgetState.hovered)) return theme.text05;
        if (states.contains(WidgetState.pressed)) return theme.text15;
        return null; // Defer to the widget's default.
      }),
    );
  }

  ButtonStyle get sheetHeaderButtonStyle {
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: .circular(100)),
      padding: const .all(13),
      tapTargetSize: .padded,
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.text15;
        if (states.contains(WidgetState.hovered)) return theme.text05;
        if (states.contains(WidgetState.pressed)) return theme.text15;
        return null; // Defer to the widget's default.
      }),
    );
  }

  ButtonStyle get primaryButtonStyle {
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: .circular(100)),
      backgroundColor: theme.primary,
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.background40;
        if (states.contains(WidgetState.hovered)) return theme.background40;
        if (states.contains(WidgetState.pressed)) return theme.background40;
        return null; // Defer to the widget's default.
      }),
    );
  }

  ButtonStyle get disabledPrimaryButtonStyle {
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: .circular(100)),
      backgroundColor: theme.primary60,
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return Colors.transparent;
        if (states.contains(WidgetState.hovered)) return Colors.transparent;
        if (states.contains(WidgetState.pressed)) return Colors.transparent;
        return null; // Defer to the widget's default.
      }),
    );
  }

  ButtonStyle get successButtonStyle {
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: .circular(100)),
      backgroundColor: theme.success,
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.success30;
        if (states.contains(WidgetState.hovered)) return theme.success30;
        if (states.contains(WidgetState.pressed)) return Colors.transparent;
        return null; // Defer to the widget's default.
      }),
    );
  }

  ButtonStyle get outlinedSuccessButtonStyle {
    return OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: .circular(100)),
      side: BorderSide(color: theme.success, width: 2),
      backgroundColor: theme.backgroundDark,
      foregroundColor: theme.success,
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.success15;
        if (states.contains(WidgetState.hovered)) return theme.success15;
        if (states.contains(WidgetState.pressed)) return theme.success30;
        return null;
      }),
      // side: WidgetStateProperty.resolveWith<BorderSide?>(
      //     (Set<WidgetState> states) {
      //   if (states.contains(WidgetState.pressed))
      //     return BorderSide(
      //       color: theme.primary,
      //       width: 2,
      //     );
      //   return null;
      // }),
    );
  }

  ButtonStyle get outlinedButtonStyle {
    return OutlinedButton.styleFrom(
      foregroundColor: theme.text,
      backgroundColor: theme.backgroundDark,
      side: BorderSide(color: theme.text, width: 2),
      shape: RoundedRectangleBorder(borderRadius: .circular(100)),
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.primary15;
        if (states.contains(WidgetState.hovered)) return theme.primary15;
        if (states.contains(WidgetState.pressed)) return theme.primary30;
        return null;
      }),
    );
  }

  ButtonStyle get outlinedPrimaryButtonStyle {
    return OutlinedButton.styleFrom(
      foregroundColor: theme.primary,
      backgroundColor: theme.backgroundDark,
      side: BorderSide(color: theme.primary, width: 2),
      shape: RoundedRectangleBorder(borderRadius: .circular(100)),
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.primary15;
        if (states.contains(WidgetState.hovered)) return theme.primary15;
        if (states.contains(WidgetState.pressed)) return theme.primary30;
        return null; // Defer to the widget's default.
      }),
    );
  }

  ButtonStyle get smallOutlinedPrimaryButtonStyle {
    return OutlinedButton.styleFrom(
      foregroundColor: theme.primary,
      backgroundColor: theme.backgroundDark,
      side: BorderSide(color: theme.primary, width: 1),
      shape: RoundedRectangleBorder(borderRadius: .circular(100)),
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.primary15;
        if (states.contains(WidgetState.hovered)) return theme.primary15;
        if (states.contains(WidgetState.pressed)) return theme.primary30;
        return null; // Defer to the widget's default.
      }),
    );
  }

  ButtonStyle get outlinedPrimaryDarkButtonStyle {
    return OutlinedButton.styleFrom(
      foregroundColor: theme.primary,
      backgroundColor: theme.backgroundDarkest,
      side: BorderSide(color: theme.primary, width: 2),
      shape: RoundedRectangleBorder(borderRadius: .circular(100)),
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.primary15;
        if (states.contains(WidgetState.hovered)) return theme.primary15;
        if (states.contains(WidgetState.pressed)) return theme.primary30;
        return null; // Defer to the widget's default.
      }),
    );
  }

  ButtonStyle get disabledPrimaryOutlinedButtonStyle {
    return OutlinedButton.styleFrom(
      foregroundColor: theme.primary60,
      backgroundColor: theme.backgroundDark,
      side: BorderSide(color: theme.primary60, width: 2),
      shape: RoundedRectangleBorder(borderRadius: .circular(100)),
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.primary15;
        if (states.contains(WidgetState.hovered)) return theme.primary15;
        if (states.contains(WidgetState.pressed)) return theme.primary30;
        return null; // Defer to the widget's default.
      }),
    );
  }

  ButtonStyle get disabledPrimaryOutlinedDarkButtonStyle {
    return OutlinedButton.styleFrom(
      foregroundColor: theme.primary60,
      backgroundColor: theme.backgroundDarkest,
      side: BorderSide(color: theme.primary60, width: 2),
      shape: RoundedRectangleBorder(borderRadius: .circular(100)),
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.primary15;
        if (states.contains(WidgetState.hovered)) return theme.primary15;
        if (states.contains(WidgetState.pressed)) return theme.primary30;
        return null; // Defer to the widget's default.
      }),
    );
  }

  ButtonStyle get innerButtonStyle {
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: .circular(100)),
      padding: const .all(10),
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return Colors.transparent;
        if (states.contains(WidgetState.hovered)) return Colors.transparent;
        if (states.contains(WidgetState.pressed)) return Colors.transparent;
        return null; // Defer to the widget's default.
      }),
    );
  }

  ButtonStyle get textFieldButtonStyle {
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: .circular(50)),
      padding: const .all(14),
      tapTargetSize: .padded,
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.text15;
        if (states.contains(WidgetState.hovered)) return theme.text05;
        if (states.contains(WidgetState.pressed)) return theme.text15;
        return null; // Defer to the widget's default.
      }),
    );
  }

  ButtonStyle get tokenTextFieldButtonStyle {
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: .circular(50)),
      padding: const .all(4),
      tapTargetSize: .padded,
      enabledMouseCursor: SystemMouseCursors.click,
      disabledMouseCursor: SystemMouseCursors.basic,
    ).copyWith(
      overlayColor: .resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.focused)) return theme.text15;
        if (states.contains(WidgetState.hovered)) return theme.text05;
        if (states.contains(WidgetState.pressed)) return theme.text15;
        return null; // Defer to the widget's default.
      }),
    );
  }
}
