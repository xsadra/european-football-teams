import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:football/data/club.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool ascSort = true;

  Future<List<Club>> _getClubs() async {
    String path = "https://public.allaboutapps.at/hiring/clubs.json";
    var dio = Dio();
    Response response = await dio.get(path);
    List<Club> list = (response.data as List).map((item) => Club.fromJson(item)).toList();

    if (ascSort) {
      list.sort((a, b) => a.name.compareTo(b.name));
    } else {
      list.sort((a, b) => b.name.compareTo(a.name));
    }

    return list;
  }

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
            future: _getClubs(),
            builder: (context, AsyncSnapshot<List<Club>> snapshot) {
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        // print(snapshot.data[index].name);

                        return ListTile(
                          title: Text(snapshot.data[index].name),
                          subtitle: Text(snapshot.data[index].country),
                          //TODO: Change the Text for 0 , 1 and more than one
                          trailing: Text(snapshot.data[index].value.toString() +
                              " Millionen"),
                          leading: Image.network(snapshot.data[index].image),
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
