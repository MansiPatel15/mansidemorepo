import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customHeaderText extends StatelessWidget {
  String? btnLabel;
  Color? color;

  customHeaderText({
    Key? key,
    this.btnLabel,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      btnLabel!,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: 20,
          fontFamily: 'Museo',
          fontWeight: FontWeight.w800,
          color: color!),
    );
  }
}
