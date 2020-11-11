import 'package:flutter/material.dart';
import 'package:football/app/view.dart';
import 'package:football/model/club.dart';
import 'package:football/service/club_repository.dart';
import 'package:football/widget/custom_list_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool ascSort = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("all about clubs"),
          actions: [
            IconButton(
              //TODO : change the icon
              icon: Icon((ascSort) ? Icons.arrow_upward : Icons.arrow_downward),
              tooltip: 'Sort',
              onPressed: () {
                toggleSort();
              },
            )
          ],
        ),
        body: Container(
          color: Colors.white,
          child: FutureBuilder(
            future: ClubRepository.getClubs(ascSort),
            builder: (context, AsyncSnapshot<List<Club>> snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
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
                    )
                  : Container(
                      child: Center(
                        child: Text(
                          "Lade Daten ...",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 21.0,
                              letterSpacing: 3),
                        ),
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }

  void toggleSort() {
    setState(() {
      ascSort = !ascSort;
    });
  }
}
