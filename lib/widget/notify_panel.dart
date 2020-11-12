import 'package:flutter/material.dart';
import 'package:football/constant/constants.dart';

class NotifyPanel extends StatelessWidget {
  final String text;
  final Color color;

  const NotifyPanel({Key key, @required this.text, this.color = Colors.black45})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text,
          style: kNotifyPanelTextStyle().copyWith(color: color),
        ),
      ),
    );
  }
}
