import 'package:flutter/material.dart';

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
