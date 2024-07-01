

import 'package:elemental_game/arena/arena_bloc/arena_bloc.dart';
import 'package:elemental_game/arena/position_tile.dart'; 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/services.dart';

class PositionController extends StatelessWidget{



  PositionController();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ArenaBloc,ArenaState>(
        buildWhen: (previous,current)=>previous!=current,
        builder: (context, state){
          return SizedBox(
            child: _buildGrid(context.read<ArenaBloc>()),
          );
        }
    );
  }

  Column _buildGrid(ArenaBloc bloc){
    final row_one_widgets = <Widget>[];
    final row_two_widgets =  <Widget>[];
    final row_three_widgets =  <Widget>[];

    List<int>? targets;
    if(bloc.state.hoveringSpell.targetsOpponentField){
      targets = bloc.state.targets;
    }

    if(!bloc.state.hoveringSpell.targetsOpponentField){
      targets = bloc.state.targets;
    }

    int i = 1;
    while(i<19){
      final index = i;
      final tile = PositionTile(
          id:i,
          selected: bloc.state.player.pos==i,
          lane: getLane(i),
          col: getCol(i),
          available: _getAvailable(bloc.state.player.pos,index),
          moving: bloc.state.moving,
          player: bloc.state.player,
          opponent: bloc.state.opponent,
          isOpponentPos: index==bloc.state.opponent.pos,
          targeted: targets!=null?targets.contains(index):false,
          onTap: (){
            if (_getAvailable(bloc.state.player.pos,index) && !(index==bloc.state.opponent.pos)){
                bloc.add(ChangePos(index));
                bloc.add(ChangeArenaView(false));
                bloc.add(ChangeTurn(false));
                i=1;
              }
          },
      );
      if(i<7){
        row_one_widgets.add(tile);
      }
      if(i>=7 && i<13){
        row_two_widgets.add(tile);
      }
      if(i>=13 && i<19){
        row_three_widgets.add(tile);
      }
      i++;
    }
    return Column(
      children: [
        Row(children:row_one_widgets,),
        Row(children:row_two_widgets,),
        Row(children:row_three_widgets,),
      ],
    );
  }
  int getLane(int i){
    return (i>=13?3:i>=7?2:1);
  }
  int getCol(int i){
    switch(i){
      case(1||7||13):
        return 1;
      case(2||8||14):
        return 2;
      case(3||9||15):
        return 3;
      case(4||10||16):
        return 4;
      case(5||11||17):
        return 5;
      case(6||12||118):
        return 6;
      default: return 0;
    }
  }


  bool _getAvailable(int current_pos, int tile_pos){
    bool available = false;

    if(
    (tile_pos==current_pos+1)||(tile_pos==current_pos-1)
        ||(tile_pos==current_pos+6)||(tile_pos==current_pos-6)){
      available=true;
    }

    return available;
  }
}