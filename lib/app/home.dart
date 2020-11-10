import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:football/data/club.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool ascSort = true;

  Future<List<Club>> _getClubs() async {
    String path = "https://public.allaboutapps.at/hiring/clubs.json";
    final res = await http.get(path);
    var body = res.body;
    var decode = json.decode(body) as List;
    var asMap = decode.asMap();
    List<Club> list = asMap.values.map((e) => Club.fromJson(e)).toList();
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
