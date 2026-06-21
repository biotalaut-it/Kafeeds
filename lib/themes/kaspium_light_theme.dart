import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'base_theme.dart';

class KaspiumLightTheme extends BaseTheme {
  //static const deepBlue = Color(0xFF009688);
  static const deepBlue = Color(0xFF6FC0B3);

  //static const green = Color(0xFF009688);
  static const green = Color(0xFF6FC0B3);

  //static const greenLight = Color(0xFF9EEDD4);
  static const greenLight = Color(0xFF6FC0B3);

  static const white = Color(0xFFFFFFFF);

  static const whiteishDark = Color(0xFFE8F0FA);

  static const grey = Color(0xFF454868);

  static const black = Color(0xFF000000);

  static const darkDeepBlue = Color(0xFF009688);

  @override
  bool isLightTheme = true;

  @override
  Color primary = deepBlue;
  @override
  Color primary60 = deepBlue.withValues(alpha: 0.9);
  @override
  Color primary45 = deepBlue.withValues(alpha: 0.8);
  @override
  Color primary30 = deepBlue.withValues(alpha: 0.6);
  @override
  Color primary20 = deepBlue.withValues(alpha: 0.45);
  @override
  Color primary15 = deepBlue.withValues(alpha: 0.3);
  @override
  Color primary10 = deepBlue.withValues(alpha: 0.2);

  @override
  Color success = green;
  @override
  Color success60 = green.withValues(alpha: 0.6);
  @override
  Color success30 = green.withValues(alpha: 0.3);
  @override
  Color success15 = green.withValues(alpha: 0.15);

  @override
  Color successDark = greenLight;
  @override
  Color successDark30 = greenLight.withValues(alpha: 0.3);

  @override
  Color background = white;
  @override
  Color background40 = white.withValues(alpha: 0.4);
  @override
  Color background00 = white.withValues(alpha: 0.0);

  @override
  Color backgroundDark = white;
  @override
  Color backgroundDark00 = white.withValues(alpha: 0.0);

  @override
  Color backgroundDarkest = whiteishDark;

  @override
  Color text = grey.withValues(alpha: 0.9);
  @override
  Color text60 = grey.withValues(alpha: 0.6);
  @override
  Color text45 = grey.withValues(alpha: 0.45);
  @override
  Color text30 = grey.withValues(alpha: 0.3);
  @override
  Color text20 = grey.withValues(alpha: 0.2);
  @override
  Color text15 = grey.withValues(alpha: 0.15);
  @override
  Color text10 = grey.withValues(alpha: 0.1);
  @override
  Color text05 = grey.withValues(alpha: 0.05);
  @override
  Color text03 = grey.withValues(alpha: 0.03);

  @override
  Color overlay90 = black.withValues(alpha: 0.9);
  @override
  Color overlay85 = black.withValues(alpha: 0.85);
  @override
  Color overlay80 = black.withValues(alpha: 0.8);
  @override
  Color overlay70 = black.withValues(alpha: 0.70);
  @override
  Color overlay50 = black.withValues(alpha: 0.5);
  @override
  Color overlay30 = black.withValues(alpha: 0.3);
  @override
  Color overlay20 = black.withValues(alpha: 0.2);

  @override
  Color barrier = black.withValues(alpha: 0.7);
  @override
  Color barrierWeaker = black.withValues(alpha: 0.4);
  @override
  Color barrierWeakest = black.withValues(alpha: 0.3);
  @override
  Color barrierStronger = black.withValues(alpha: 0.85);

  @override
  Color animationOverlayMedium = white.withValues(alpha: 0.7);
  @override
  Color animationOverlayStrong = white.withValues(alpha: 0.85);

  //Brightness brightness = Brightness.light;
  @override
  SystemUiOverlayStyle systemOverlayStyle = .dark;
  @override
  SystemUiOverlayStyle statusBar =
      .dark.copyWith(statusBarColor: Colors.transparent);

  @override
  BoxShadow boxShadow = BoxShadow(
    color: darkDeepBlue.withValues(alpha: 0.1),
    offset: Offset(0, 3),
    blurRadius: 15,
  );
  @override
  BoxShadow boxShadowButton = BoxShadow(
    color: darkDeepBlue.withValues(alpha: 0.2),
    offset: Offset(0, 3),
    blurRadius: 15,
  );
}
