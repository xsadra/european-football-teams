import 'package:flutter/material.dart';
import 'package:football/constant/colors.dart';
import 'package:football/data/club.dart';

class ViewClubScreen extends StatelessWidget {
  static String id = 'view_screen';
  final Club club;

  ViewClubScreen({this.club});

  @override
  Widget build(BuildContext context) {
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
                    child: Image.network(
                      club.image,
                      // height: 160.0,
                    ),
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
          ],
        ),
      ),
    );
  }
}