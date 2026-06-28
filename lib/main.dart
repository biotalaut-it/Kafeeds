import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'app_providers.dart';
import 'database/database.dart';
import 'util/platform.dart';
import 'util/sharedprefsutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPrefs = await SharedPreferences.getInstance();
  final sharedPrefsUtil = SharedPrefsUtil(sharedPrefs);

  final theme = sharedPrefsUtil.getTheme().getTheme();
  SystemChrome.setSystemUIOverlayStyle(theme.statusBar);
  SystemChrome.setEnabledSystemUIMode(.edgeToEdge);

  runApp(
    AnnotatedRegion(
      value: theme.systemOverlayStyle,
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: theme.backgroundDark,
        ),
      ),
    ),
  );

  // Setup logger
  if (kInDebugMode) {
    Logger.level = .debug;
    //debugRepaintRainbowEnabled = true;
  } else {
    Logger.level = .off;
  }

  await SystemChrome.setPreferredOrientations([.portraitUp]);

  // Init database
  await Database.init();

  runApp(
    ProviderScope(
      // observers: [
      //   const ProviderLogger(),
      // ],
      overrides: [
        sharedPrefsProvider.overrideWithValue(sharedPrefs),
      ],
      child: const App(),
    ),
  );
}
