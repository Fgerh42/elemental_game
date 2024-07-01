

import 'package:flutter/material.dart';

class Label {


  static write(
      {
       String text="",
       double fontsize=12,
       Color color=Colors.black,
       FontStyle fontStyle = FontStyle.normal
      }) => Text(
    text,
    style: TextStyle(
     fontFamily: "Alkhemikal",
     decoration: TextDecoration.none,
     fontStyle: fontStyle,
     fontSize: fontsize,
     color: color
  ),);
}