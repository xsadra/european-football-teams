import 'package:flutter/material.dart';
import 'package:football/model/club.dart';
import 'package:football/service/club_repository.dart';
import 'package:football/widget/club_list_view.dart';
import 'package:football/widget/loading_data_widget.dart';

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
                  ? ClubListView(snapshot: snapshot)
                  : LoadingDataWidget();
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
