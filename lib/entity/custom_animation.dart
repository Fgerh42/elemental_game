


import 'package:flutter/material.dart';

class CustomAnimationFrame{
  Widget frame;
  double left;
  double right;
  double top;
  double bottom;
  Duration? frameDuration;


  CustomAnimationFrame(
      {
        required this.frame,
        this.left=.0,
        this.right=.0,
        this.top=.0,
        this.bottom=.0,
        this.frameDuration
      });

  getPositionedFrame(){
    return Positioned(
        left: left,
        right: right,
        top: top,
        bottom: bottom,
        child: frame
    );
  }
}