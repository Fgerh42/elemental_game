

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entity/custom_animation.dart';
import 'arena_bloc/arena_bloc.dart';

class SpellAnimationController extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ArenaBloc,ArenaState>(
        buildWhen: (previous,current)=>previous.animationControlIndex!=current.animationControlIndex || previous.spellAnimation!=current.spellAnimation,
        builder: (context,state){

          List<Widget> children = [];
          if(state.spellAnimation.isNotEmpty){
            children.add(state.spellAnimation[state.animationControlIndex].getPositionedFrame());
            _nextFrame(state.spellAnimation[state.animationControlIndex],context.read<ArenaBloc>());
          }
          return Stack(
            children: children,
          );
    });
  }

  _nextFrame(CustomAnimationFrame frame, ArenaBloc bloc) async {
    if(frame.frameDuration!=null){
     Future.delayed(frame.frameDuration!).then((val){
       int res_index = (bloc.state.animationControlIndex+1<bloc.state.spellAnimation.length)?bloc.state.animationControlIndex+1:0;
       if(res_index==0){
         bloc.add(ChangeSpellAnimation(<CustomAnimationFrame>[]));
         bloc.add(ChangeAnimationControlIndex(res_index));
         bloc.add(const ChangeTurn(false));
       }else{
         bloc.add(ChangeAnimationControlIndex(res_index));
       }
     });
    }
  }
}