import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:football/app/home.dart';
import 'package:football/constant/colors.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'European Football Teams',
      theme: ThemeData().copyWith(primaryColor: kMainColor),
      home: Home(),
      supportedLocales: [
        Locale('en', 'GB'),
        Locale('de', 'AT'),
        Locale('de', 'DE'),
        Locale('pl', 'PL')
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
    );
  }
}
