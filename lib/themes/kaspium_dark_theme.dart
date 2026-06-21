import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'base_theme.dart';

class KaspiumDarkTheme extends BaseTheme {
  static const brightBlue = Color(0xff49eacb);

  //static const green = Color(0xfffc865a);
  static const green = Color(0xffbcbec0);

  //static const greenDark = Color(0xfffc865a);
  static const greenDark = Color(0xff49eacb);

  static const blueishGreyDark = Color(0xff232323);

  static const blueishGreyLight = Color(0xff323232);

  static const blueishGreyDarkest = Color(0xff232323);

  static const white = Color(0xffffffff);

  static const black = Color(0xff000000);

  @override
  bool isLightTheme = false;

  @override
  Color primary = brightBlue;
  @override
  Color primary60 = brightBlue.withValues(alpha: 0.6);
  @override
  Color primary45 = brightBlue.withValues(alpha: 0.45);
  @override
  Color primary30 = brightBlue.withValues(alpha: 0.3);
  @override
  Color primary20 = brightBlue.withValues(alpha: 0.2);
  @override
  Color primary15 = brightBlue.withValues(alpha: 0.15);
  @override
  Color primary10 = brightBlue.withValues(alpha: 0.1);

  @override
  Color success = green;
  @override
  Color success60 = green.withValues(alpha: 0.6);
  @override
  Color success30 = green.withValues(alpha: 0.3);
  @override
  Color success15 = green.withValues(alpha: 0.15);

  @override
  Color successDark = greenDark;
  @override
  Color successDark30 = greenDark.withValues(alpha: 0.3);

  @override
  Color background = blueishGreyDark;
  @override
  Color background40 = blueishGreyDark.withValues(alpha: 0.4);
  @override
  Color background00 = blueishGreyDark.withValues(alpha: 0.0);

  @override
  Color backgroundDark = blueishGreyLight;
  @override
  Color backgroundDark00 = blueishGreyLight.withValues(alpha: 0.0);

  @override
  Color backgroundDarkest = blueishGreyDarkest;

  @override
  Color text = white.withValues(alpha: 0.9);
  @override
  Color text60 = white.withValues(alpha: 0.6);
  @override
  Color text45 = white.withValues(alpha: 0.45);
  @override
  Color text30 = white.withValues(alpha: 0.3);
  @override
  Color text20 = white.withValues(alpha: 0.2);
  @override
  Color text15 = white.withValues(alpha: 0.15);
  @override
  Color text10 = white.withValues(alpha: 0.1);
  @override
  Color text05 = white.withValues(alpha: 0.05);
  @override
  Color text03 = white.withValues(alpha: 0.03);

  @override
  Color overlay20 = black.withValues(alpha: 0.2);
  @override
  Color overlay30 = black.withValues(alpha: 0.3);
  @override
  Color overlay50 = black.withValues(alpha: 0.5);
  @override
  Color overlay70 = black.withValues(alpha: 0.7);
  @override
  Color overlay80 = black.withValues(alpha: 0.8);
  @override
  Color overlay85 = black.withValues(alpha: 0.85);
  @override
  Color overlay90 = black.withValues(alpha: 0.9);

  @override
  Color barrier = black.withValues(alpha: 0.7);
  @override
  Color barrierWeaker = black.withValues(alpha: 0.4);
  @override
  Color barrierWeakest = black.withValues(alpha: 0.3);
  @override
  Color barrierStronger = black.withValues(alpha: 0.85);

  @override
  Color animationOverlayMedium = black.withValues(alpha: 0.7);
  @override
  Color animationOverlayStrong = black.withValues(alpha: 0.85);

  //Brightness brightness = Brightness.dark;
  @override
  SystemUiOverlayStyle systemOverlayStyle = .light;
  @override
  SystemUiOverlayStyle statusBar =
      .light.copyWith(statusBarColor: Colors.transparent);

  @override
  BoxShadow boxShadow = BoxShadow(color: Colors.transparent);
  @override
  BoxShadow boxShadowButton = BoxShadow(color: Colors.transparent);
}
