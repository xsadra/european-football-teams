import 'package:flutter/material.dart';
import 'package:football/constant/texts.dart';
import 'package:football/locale/app_localization.dart';
import 'package:football/model/club.dart';
import 'package:football/service/club_repository.dart';
import 'package:football/service/exception.dart';
import 'package:football/widget/action_icon_button.dart';
import 'package:football/widget/club_list_view.dart';
import 'package:football/widget/notify_panel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool ascOrder = true;

  @override
  Widget build(BuildContext context) {
    AppLocalization msg = AppLocalization.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(kAppName),
          actions: [
            ActionIconButton(
              ascOrder: ascOrder,
              imagePath: kActionIconImagePath,
              onPressed: _toggleSort,
            ),
          ],
        ),
        body: FutureBuilder(
          future: ClubRepository.getClubs(ascOrder),
          builder: (context, AsyncSnapshot<List<Club>> snapshot) {
            if (snapshot.hasError) {
              return NotifyPanel(
                text: ExceptionCatcher.getMessage(snapshot.error),
                color: Colors.red,
              );
            }

            return snapshot.hasData
                ? ClubListView(snapshot: snapshot)
                : NotifyPanel(text: msg.loadingData);
          },
        ),
      ),
    );
  }

  void _toggleSort() {
    setState(() {
      ascOrder = !ascOrder;
    });
  }
}
