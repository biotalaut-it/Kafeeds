import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:oktoast/oktoast.dart';

import 'app_constants.dart';
import 'app_providers.dart';
import 'app_router.dart';
import 'app_styles.dart';
import 'l10n/l10n.dart';
import 'push/push_notifications.dart';
import 'screens/privacy_screen.dart';
import 'util/platform.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final language = ref.watch(languageProvider);
    final styles = ref.watch(stylesProvider);

    // Setup hight refresh rate on Android devices
    useEffect(() {
      if (kPlatformIsAndroid) {
        final log = ref.read(loggerProvider);
        Future.delayed(.zero, () {
          try {
            FlutterDisplayMode.setHighRefreshRate();
          } catch (e) {
            log.e('Failed to set high refresh rate', error: e);
          }
        });
      }
      return null;
    }, const []);

    useEffect(() {
      final appLinks = AppLinks();
      final sub = appLinks.stringLinkStream.listen((appLink) {
        ref.read(appLinkProvider.notifier).state = appLink;
      });
      return sub.cancel;
    }, const []);

    useEffect(() {
      if (kPlatformIsAndroid || kPlatformIsIOS) {
        return setupPushNotifications(ref);
      }
      return null;
    }, const []);

    return Container(
      decoration: BoxDecoration(color: theme.backgroundDarkest),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            minWidth: 320,
            minHeight: 480,
            maxWidth: 720,
          ),
          child: PrivacyScreen(
            child: OKToast(
              position: ToastPosition(align: .topCenter, offset: 40),
              textStyle: styles.textStyleSnackbar,
              backgroundColor: theme.backgroundDark,
              child: AnnotatedRegion(
                value: theme.systemOverlayStyle,
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: kWalletTitle,
                  theme: ThemeData(
                    useMaterial3: false,
                    primaryColor: theme.primary,
                    fontFamily: kDefaultFontFamily,
                    brightness: theme.brightness,
                    tooltipTheme: TooltipThemeData(
                      preferBelow: false,
                      margin: .symmetric(vertical: 10),
                      padding: .symmetric(vertical: 4, horizontal: 10),
                      decoration: BoxDecoration(
                        color: theme.backgroundDarkest,
                        borderRadius: .circular(25),
                      ),
                      textStyle: styles.textStyleAddressText60,
                    ),
                    dialogTheme: DialogThemeData(
                      backgroundColor: theme.backgroundDark,
                    ),
                    colorScheme: ThemeData().colorScheme.copyWith(
                      brightness: theme.brightness,
                      secondary: theme.primary10,
                      surface: theme.backgroundDark,
                    ),
                  ),
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  locale: language.getLocale(),
                  initialRoute: appRouter.initialRoute,
                  onGenerateRoute: appRouter.onGenerateRoute,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
