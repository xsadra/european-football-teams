import 'package:flutter/material.dart';
import 'package:football/l10n/messages_all.dart';
import 'package:intl/intl.dart';

class AppLocalization {
  static Future<AppLocalization> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalization();
    });
  }

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  // list of locales
  String get appTitle => Intl.message(
        'all about clubs',
        name: 'appTitle',
      );

  String get club => Intl.message(
        'club',
        name: 'club',
      );

  String get firstMessage => Intl.message(
        ' from xCountry is worth xValue million euros',
        name: 'firstMessage',
      );

  String get secondMessage => Intl.message(
        ' has so far achieved xVictorious victories at European level',
        name: 'secondMessage',
      );
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  final Locale overriddenLocale;

  const AppLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => ['en', 'de', 'pl'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}
