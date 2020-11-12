import 'package:flutter/material.dart';
import 'package:football/constant/constants.dart';
import 'package:football/locale/app_localization.dart';
import 'package:football/model/club.dart';

class ViewClubScreen extends StatelessWidget {
  static String id = 'view_screen';
  final Club club;

  ViewClubScreen({this.club});

  @override
  Widget build(BuildContext context) {
    AppLocalization msg = AppLocalization.of(context);

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16.0, bottom: 16.0),
                        child: Text(
                          club.country,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: msg.club + ' '),
                        TextSpan(
                            text: club.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: msg.firstMessage
                              .replaceFirst('xCountry', club.country)
                              .replaceFirst('xValue', club.value.toString()),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: club.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: msg.secondMessage.replaceFirst(
                              'xVictorious', club.europeanTitles.toString()),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
