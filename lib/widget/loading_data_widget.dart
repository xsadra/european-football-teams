import 'package:flutter/material.dart';

class LoadingDataWidget extends StatelessWidget {
  const LoadingDataWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Lade Daten ...",
          style: TextStyle(
              color: Colors.black45, fontSize: 21.0, letterSpacing: 3),
        ),
      ),
    );
  }
}
