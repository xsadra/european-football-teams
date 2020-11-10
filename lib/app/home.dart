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
