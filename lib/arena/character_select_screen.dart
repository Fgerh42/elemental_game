

import 'package:elemental_game/arena/arena_bloc/arena_bloc.dart';
import 'package:elemental_game/arena/arena_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entity/player.dart';
import '../utils/label.dart';
import '../utils/palette.dart';

class CharacterSelectScreen extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArenaBloc,ArenaState>(
        builder: (context,state){
          return Scaffold(
            body: Center(
              child: Column(
                children: [
                  Expanded(child: SizedBox(),),
                  Label.write(text: "Pick a Character",fontsize: 36),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child: Container(),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            Player player = state.player;
                            player.playerClass = PlayerClass.NINJA;
                            context.read<ArenaBloc>().add(ChangePlayer(player));
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ArenaScreen()));
                          },
                          child: Container(
                            width: 200,
                            height: 100,
                            color: Palette.info,
                            child: Center(child: Label.write(text: "Ninja",fontsize: 24),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          height: 100,
                          color: Palette.disabled,
                          child: Center(child: Label.write(text: "Druid",fontsize: 24),),
                        ),
                      ),
                      Expanded(child: Container(),),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Container(),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          height: 100,
                          color: Palette.disabled,
                          child: Center(child: Label.write(text: "Artisan",fontsize: 24),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            Player player = state.player;
                            player.playerClass = PlayerClass.PIRATE;
                            context.read<ArenaBloc>().add(ChangePlayer(player));
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ArenaScreen()));
                          },
                          child: Container(
                            width: 200,
                            height: 100,
                            color: Palette.info,
                            child: Center(child: Label.write(text: "Pirate",fontsize: 24),),
                          ),
                        ),
                      ),
                      Expanded(child: Container(),),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Container(),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          height: 100,
                          color: Palette.disabled,
                          child: Center(child: Label.write(text: "Abomination",fontsize: 24),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 200,
                          height: 100,
                          color: Palette.disabled,
                          child: Center(child: Label.write(text: "Occultist",fontsize: 24),),
                        ),
                      ),
                      Expanded(child: Container(),),
                    ],
                  ),
                  Expanded(child: SizedBox(),),

                ],
              ),
            ),
          );
        }
    );
  }
}