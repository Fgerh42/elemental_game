

import 'dart:math';

import 'package:elemental_game/arena/arena_bloc/arena_bloc.dart';
import 'package:elemental_game/arena/position_tile.dart';
import 'package:elemental_game/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entity/player.dart';
import '../utils/label.dart';

class TurnController extends StatelessWidget{

  TurnController();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ArenaBloc,ArenaState>(
        buildWhen: (previous,current)=>previous.playableTurn!=current.playableTurn,
        builder: (context, state){

          if(!state.playableTurn){
            _playOpponentTurn(context.read<ArenaBloc>());
          }

          return state.playableTurn?Label.write(text:'Your turn',color:Palette.energy,fontsize: MediaQuery.of(context).size.height*0.05):
              Column(
                children: [
                Label.write(text:'Waiting for the opponent',color:Palette.energy,fontsize: MediaQuery.of(context).size.height*0.04),
                  CircularProgressIndicator(color: Palette.energy,)
              ],);
        }
    );
  }

  _playOpponentTurn(ArenaBloc bloc){
    Future.delayed(Duration(milliseconds: 300)).then((value){
      bloc.add(ChangeTurn(true));
      Player opponent = bloc.state.opponent;

      Random r = Random();

      opponent.pos = r.nextInt(18) + 1;

      if(opponent.pos==bloc.state.player.pos){
        opponent.pos++;
      }

      opponent.mana++;

      bloc.add(ChangeOpponent(opponent));
    });
  }
}