import 'package:flutter/material.dart';
void main(){
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'European Football Teams',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Container(
        color: Colors.white,
      ),
    );
  }
}