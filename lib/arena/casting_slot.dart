


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polygon/polygon.dart';

import '../entity/spell.dart';
import '../utils/label.dart';
import '../utils/painter.dart';
import '../utils/palette.dart';

class CastingSlot extends StatelessWidget{

  Spell? spell;

  int timer;

  CastingSlot({this.spell, this.timer = 0});

  @override
  Widget build(BuildContext context) {

    List<Offset> offsets = <Offset>[];

    offsets.addAll([
      Offset(1, 2),
      Offset(2, 1),
      Offset(1, 0),
      Offset(0,1)
    ]);

    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _listTicks(timer),
          SizedBox(height: 10,),
          Container(
            child: CustomPaint(
              size: Size(30, 30),
              painter: PolygonPainter(offsets, color: spell!=null?spell!.getColorFromBaseElement(true):Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }

  _listTicks(int ticks){
    final List<Widget> children = [];
    int i = 0;
    while(i<ticks){
      children.add(Expanded(child: Container(),));
      children.add(
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(5)
            ),
          )
      );
      children.add(Expanded(child: Container(),));
      i++;
    }
    return Container(height:10,width:62,child: Row(children: children,));
  }
}