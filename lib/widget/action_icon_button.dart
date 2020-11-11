import 'dart:math' as Math;

import 'package:flutter/material.dart';

class ActionIconButton extends StatelessWidget {
  final bool ascSort;
  final String imagePath;
  final VoidCallback onPressed;

  const ActionIconButton({
    Key key,
    @required this.ascSort,
    @required this.imagePath,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Transform(
        transform:
            (ascSort) ? Matrix4.rotationZ(Math.pi) : Matrix4.rotationZ(0),
        alignment: Alignment.center,
        child: Image.asset(
          imagePath,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
