import 'package:flutter/material.dart';
import 'package:football/constant/constants.dart';
import 'package:football/locale/app_localization.dart';
import 'package:football/model/club.dart';
import 'package:football/widget/detail_text.dart';

class ViewClubScreen extends StatelessWidget {
  static String id = 'view_screen';
  final Club club;

  ViewClubScreen({this.club});

  @override
  Widget build(BuildContext context) {
    AppLocalization msg = AppLocalization.of(context);

    String firstMessage = msg.firstMessage
        .replaceFirst('xCountry', club.country)
        .replaceFirst('xValue', club.value.toString());
    String secondMessage = msg.secondMessage
        .replaceFirst('xVictorious', club.europeanTitles.toString());
    return MaterialApp(
      theme: ThemeData().copyWith(primaryColor: kMainColor),
      home: Scaffold(
        appBar: AppBar(
          title: Text(club.name),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200.0,
              color: Color(0xFF333333),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 24.0),
                  Expanded(
                    child: club.hasImage
                        ? Image.network(club.image)
                        : Icon(Icons.error, color: Colors.white70, size: 120.0),
                  ),
                  clubCountryText(club.country)
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailText(
                  children: <TextSpan>[
                    TextSpan(text: msg.club + ' '),
                    clubNameText(),
                    TextSpan(
                      text: firstMessage,
                    )
                  ],
                ),
                DetailText(
                  children: <TextSpan>[
                    clubNameText(),
                    TextSpan(
                      text: secondMessage,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row clubCountryText(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  TextSpan clubNameText() {
    return TextSpan(
      text: club.name,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
