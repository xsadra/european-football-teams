import 'package:flutter/material.dart';
import 'package:football/app/view.dart';
import 'package:football/model/club.dart';
import 'package:football/widget/custom_list_tile.dart';

class ClubListView extends StatelessWidget {
  ClubListView({@required this.snapshot});

  final AsyncSnapshot<List<Club>> snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        Club club = snapshot.data[index];
        return CustomListTile(
          club: club,
          onTap: () async {
            MaterialPageRoute route = MaterialPageRoute(
              builder: (context) => ViewClubScreen(club: club),
            );
            await Navigator.push(context, route);
          },
        );
      },
    );
  }
}
