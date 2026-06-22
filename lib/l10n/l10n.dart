import 'package:flutter/widgets.dart';

import 'app_localizations/app_localizations.dart';

export 'app_localizations/app_localizations.dart';

AppLocalizations l10nOf(BuildContext context) => AppLocalizations.of(context)!;

class L10nWrapper {
  AppLocalizations? l10n;
  L10nWrapper();
}

final l10nWrapper = L10nWrapper();
