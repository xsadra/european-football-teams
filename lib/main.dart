import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:football/app/home.dart';
import 'package:football/app/view.dart';
import 'package:football/constant/colors.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  static String id = 'home';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'European Football Teams',
      theme: ThemeData().copyWith(primaryColor: kMainColor),
      home: Home(),
      routes: {
        MainApp.id: (context) => MainApp(),
        ViewClubScreen.id: (context) => ViewClubScreen()
      },
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
