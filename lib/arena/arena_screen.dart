import 'dart:ui';

import 'package:elemental_game/arena/arena_bloc/arena_bloc.dart';
import 'package:elemental_game/arena/position_controller.dart';
import 'package:elemental_game/arena/turn_controller.dart';
import 'package:elemental_game/arena/spell_card.dart';
import 'package:elemental_game/utils/palette.dart';
import 'package:elemental_game/utils/pirate_spell_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:audioplayers/audioplayers.dart';
import '../entity/player.dart';
import '../entity/spell.dart';
import '../utils/label.dart';
import '../utils/ninja_spell_list.dart';
import 'spell_animation_controller.dart';

class ArenaScreen extends StatelessWidget{
  
  
  @override
  Widget build(BuildContext context) {


    AudioPlayer player = AudioPlayer();
    bool first = true;

    return BlocBuilder<ArenaBloc,ArenaState>(
        buildWhen: (previous,current)=> previous!=current
            // previous.moving!=current.moving ||
            // previous.spellsAtHand!=current.spellsAtHand ||
            // previous.attunementsAtHand!=current.attunementsAtHand ||
            // previous.hoveringSpell!=current.hoveringSpell ||
            // previous.player!=current.player ||
            // previous.opponent.health!=current.opponent.health ||
            // previous.opponent.mana!=current.opponent.mana ||
            // previous.opponent.pos!=current.opponent.pos ||
            // previous.player.pos!=current.player.pos ||
            // previous.playableTurn!=current.playableTurn
        ,
        builder: (context, state){
          final width = MediaQuery.of(context).size.width;
          final height = MediaQuery.of(context).size.height;

          if(first){
            first = false;
            //_play(player);
          }
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: Image.asset("assets/arena_bg_update3.png").image,
              //     fit: BoxFit.fill
              //   )
              // ),
              child: Stack(
                children: [
                  Positioned(
                      top: height*0.05,
                      bottom: height*0.76,
                      left: width*0.12,
                      right: width*0.5,
                      child: TurnController()
                  ),
                  Positioned(
                      top: height*0.05,
                      bottom: height*0.74,
                      left: width*0.045,
                      right: width*0.88,
                      child: Image.asset("assets/parchment.png",)
                  ),
                  Positioned(
                      top: height*0.05,
                      bottom: height*0.74,
                      left:  width*0.88,
                      right: width*0.045,
                      child: Transform.flip(
                        flipX: true,
                        child: Image.asset("assets/parchment.png"),
                      )
                  ),
                  Positioned(
                      top: height*0.08,
                      bottom: height*0.8,
                      left: width*0.065,
                      right: width*0.88,
                    child:Column(
                      children: [
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Image.asset(
                              "assets/health.png",
                              scale: 1,
                            ),
                            Label.write(
                                text:state.player.health>=10?state.player.health.toString():'0${state.player.health}',
                                fontsize: width*0.017,
                                color: Palette.blood
                            )
                          ],
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Image.asset(
                              "assets/mana.png",
                              scale: 1,
                            ),
                            Label.write(
                                text:state.player.mana>=10?state.player.mana.toString():'0${state.player.mana}',
                                fontsize: width*0.017,
                                color: Palette.energy
                            )
                          ],
                        ),
                        Expanded(child: Container()),
                      ],
                    )
                  ),
                  Positioned(
                      top: height*0.08,
                      bottom: height*0.8,
                      left: width*0.90,
                      right: width*0.048,
                      child:Column(
                        children: [
                          Expanded(child: Container()),
                          Row(
                            children: [
                              Label.write(
                                  text:state.opponent.health>=10?state.opponent.health.toString():'0${state.opponent.health}',
                                  fontsize: width*0.017,
                                  color: Palette.blood
                              ),
                              Image.asset(
                                "assets/health.png",
                                scale: 1,
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Row(
                            children: [
                              Label.write(
                                  text:state.opponent.mana>=10?state.opponent.mana.toString():'0${state.opponent.mana}',
                                  fontsize: width*0.017,
                                  color: Palette.energy
                              ),
                              Image.asset(
                                "assets/mana.png",
                                scale: 1,
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                        ],
                      )
                  ),
                  Positioned(
                    top: height*0.08,
                    bottom: height*0.8,
                    left: width*0.78,
                    right: width*0.12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Label.write(text:"Status",fontsize: width*0.017),
                        Label.write(
                            text:state.opponent.status.name,
                            fontsize: width*0.02,
                            color: Spell.getColorFromStatus(state.opponent.status)
                        )

                      ],
                    ),
                  ),
                  Positioned(
                    left: width*0.07,
                    top: height*0.25,
                    right: width*0.88,
                    bottom: height*0.25,
                    child: Column(
                      children: [
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: (){
                            context.read<ArenaBloc>().add(ChangeArenaView(!state.moving));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    offset: Offset(0, 6.0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child: Image(
                              image: Image.asset(state.moving||!state.playableTurn?"assets/movement_bw.png":"assets/movement.png").image,
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: (){
                            Player p = state.player;
                            p.facingForward = !p.facingForward;
                            context.read<ArenaBloc>().add(ChangePlayer(p));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Image(
                              image: Image.asset(!state.playableTurn?"assets/swap_bw.png":"assets/swap.png",).image,
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: (){
                            Player p = state.player;
                            p.mana++;
                            context.read<ArenaBloc>().add(ChangePlayer(p));
                            context.read<ArenaBloc>().add(ChangeTurn(false));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    offset: Offset(0, 6.0),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: Image(
                              image: Image.asset(!state.playableTurn?"assets/meditation_bw.png":"assets/meditation.png").image,
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                  Positioned(
                      left: width*0.14,
                      right: width*0.05,
                      bottom: height*0.22,
                      top: height*0.28,
                      child: PositionController(),
                  ),
                  Positioned(
                    top: height*0.75,
                    left: width*0.065,
                    right: width*0.490,
                    bottom: 0,
                    child: Column(
                      children: [
                        Label.write(text: "Spells",fontsize: height*0.025),
                        Container(
                          height: height*0.005,
                          color: Colors.black,
                        ),
                        SizedBox(height: height*0.01,),
                        _listSpells(false,context.read<ArenaBloc>(),context)
                      ],
                    )
                  ),
                  Positioned(
                      top: height*0.75,
                      left: width*0.555,
                      right: width*0.22,
                      bottom: 0,
                      child: Column(
                        children: [
                          Label.write(text: "Attunements",fontsize:  height*0.025),
                          Container(
                            height: height*0.005,
                            color: Colors.black,
                          ),
                          SizedBox(height: height*0.01,),
                          _listSpells(true,context.read<ArenaBloc>(),context)
                        ],
                      )
                  ),
                  state.hoveringSpell.id!="0"?Positioned(
                     left: width*0.35,
                     right: width*0.35,
                     top: height*0.05,
                     bottom: height*0.65,
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.black,blurRadius: 20)],
                          image: DecorationImage(
                            image: Image.asset("assets/parchment_news.png").image,
                            fit: BoxFit.fill
                          )
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: height*0.03,),
                            Label.write(text:state.hoveringSpell.name,fontsize: height*0.04),
                            SizedBox(height: height*0.008,),
                            Label.write(text:state.hoveringSpell.description??"",fontsize: height*0.028),
                            SizedBox(height: height*0.015,),
                            Label.write(text:state.hoveringSpell.comment??"",fontsize: height*0.028,fontStyle: FontStyle.italic),
                          ],
                        ),
                      )):SizedBox(),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: SpellAnimationController()
                  )
                ],
              ),
            ),
          );
    }
    );
  }

  // Map<String,double>_getPosAtScreen(int pos,context){
  //
  //   int lane = (pos>=13?3:pos>=7?2:1);
  //
  //   int col = 1;
  //
  //   int i = 1;
  //   while(i<=6) {
  //     if (pos == i || (pos - 6) == i || (pos - 12) == i) {
  //       col = i;
  //     }
  //     i++;
  //   }
  //
  //   Map<String,double> position = {};
  //
  //
  //   final height =MediaQuery.of(context).size.height;
  //   final width = MediaQuery.of(context).size.width;
  //
  //
  //   final v_mod = (lane-2) * (height*0.13);
  //
  //   final h_mod = col * (width*0.01);
  //
  //   position["left"] =  width*0.26 + h_mod;
  //   position["top"] =   height * 0.28 + v_mod;
  //   position["right"] =  width*0.61 - h_mod;
  //   position["bottom"] = height * 0.3 - v_mod;
  //
  //
  //   return position;
  // }


  _listSpells(bool isAttunement,ArenaBloc bloc,context){
    List<Widget> widgets = [];
    final spells = isAttunement?bloc.state.attunementsAtHand:buildSpells(bloc.state.player);

    int i = 0;
    while(i<(isAttunement?2:4)){

      bool hasAttunement = bloc.state.player.first_attunement!=BaseElement.NONE;
      bool hasDualAttunement = bloc.state.player.second_attunement!=BaseElement.NONE;

      if(isAttunement){
        widgets.add(SpellCard(spells[i]));
      }else{
        if(hasAttunement){

          final sub_spells = spells[i].subSpells??[];
          List<Spell> sub_spell = [];

          if(hasDualAttunement){
            Spell sub_spell_base = sub_spells.where((element)=>
            element.requiredElement==(bloc.state.player.first_attunement)
            ).toList()[0];

            sub_spell = sub_spell_base.subSpells!.where((element)=>
            element.requiredElement==(bloc.state.player.second_attunement)
            ).toList();

          }else{
            sub_spell = sub_spells.where((element)=>
            element.requiredElement==(bloc.state.player.first_attunement)
            ).toList();
          }


          widgets.add(SpellCard(sub_spell.isNotEmpty?sub_spell[0]:spells[i]));

        }else{
          widgets.add(SpellCard(spells[i]));
        }
      }
      if((i+1)!=spells.length){
        widgets.add(SizedBox(width: MediaQuery.of(context).size.width*0.01,));
      }
      i++;
    }

    return Row(children: widgets,);
  }


  _play(AudioPlayer player) async {
      await player.play(
          AssetSource("Chester Cheetah declares Jihad (320).mp3"),
      ).then((val){
        Future.delayed(Duration(seconds: 3)).then((val)=>_play(player));
      });
  }

  _getIdle(Player p){
    switch(p.playerClass){
      case(PlayerClass.NINJA):
        return Image.asset("assets/idle_ninja.gif",scale: 0.5,);
      case(PlayerClass.PIRATE):
        return Image.asset("assets/idle_pirate.gif",scale: 0.5);
      default:
        return [];
    }
  }

  List<Spell> buildSpells(Player p){

    switch(p.playerClass){
      case(PlayerClass.NINJA):
        return NinjaSpellList().list;
      case(PlayerClass.PIRATE):
        return PirateSpellList().list;
      default:
        return [];
    }
  }
}