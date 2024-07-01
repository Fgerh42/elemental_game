



import 'package:elemental_game/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:polygon/polygon.dart';

import '../entity/player.dart';
import '../utils/label.dart';

class PositionTile extends StatelessWidget{

  final int id;
  final bool selected;
  final int lane;
  final int col;
  final bool available;
  final bool moving;
  final onTap;
  final bool isOpponentPos;
  final bool targeted;
  final Player? player;
  final Player? opponent;

  PositionTile({
    this.id=0,
    this.selected = false,
    this.lane = 1,
    this.col = 1,
    this.moving = false,
    this.available = false,
    this.onTap,
    this.isOpponentPos = false,
    this.targeted = false,
    this.player,
    this.opponent
  });

  @override
  Widget build(BuildContext context) {

    Color color = Palette.disabled;
    if(moving){
      if(isOpponentPos){
        color = Colors.grey;
      }else{
        color = selected?Palette.success.withOpacity(0.5): available?Palette.info.withOpacity(0.5):Palette.disabled.withOpacity(0.5);
      }
    }
    if(targeted){
      color = Palette.danger.withOpacity(0.5);
    }



   // final polygon = Polygon(_getOffsets());
    
    return Padding(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned(
              child: Container(
              width: MediaQuery.of(context).size.width*0.13,
              height: MediaQuery.of(context).size.height*0.15,
              color: color, 
            ),
            ),
            Positioned(
                left:  MediaQuery.of(context).size.width*0.01,
                right: MediaQuery.of(context).size.width*0.01,
                top: MediaQuery.of(context).size.height*0.01,
                bottom: MediaQuery.of(context).size.height*0.01,
                child: player!=null && selected?
                _getIdle(player!):SizedBox()
            ),
            Positioned(
                left:  MediaQuery.of(context).size.width*0.01,
                right: MediaQuery.of(context).size.width*0.01,
                top: MediaQuery.of(context).size.height*0.01,
                bottom: MediaQuery.of(context).size.height*0.01,
                child: opponent!=null?
                _getOpponent(opponent!.pos==id):SizedBox()
            )
          ],
        ),
      ),
    );
  }

  _getIdle(Player p){
    switch(p.playerClass){
      case(PlayerClass.NINJA):
        return  Transform.flip(flipX:!p.facingForward,child:Image.asset("assets/idle_ninja.gif",scale: 0.5,));
      case(PlayerClass.PIRATE):
        return Transform.flip(flipX:!p.facingForward,child:Image.asset("assets/idle_pirate.gif",scale: 0.5));
      default:
        return [];
    }
  }

  _getOpponent(bool present){
    return present?Image.asset("assets/dummy.png",scale: 0.5,):SizedBox();
  }
}