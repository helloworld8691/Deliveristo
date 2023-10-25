import 'package:flutter/material.dart';

extension StringExt on String {

  ElevatedButton toButton(Function() onTap) => ElevatedButton(
      onPressed: onTap,
      child: Text(this));

  Text toText({double fontSize = 16, TextAlign textAlign = TextAlign.start, Color color = Colors.black, bool isBold = false}) {
    return Text(
      this,
      style: TextStyle(color: color, fontSize:  fontSize, fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
      textAlign: textAlign,
    );
  }
}