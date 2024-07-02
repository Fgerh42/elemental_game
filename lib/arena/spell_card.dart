

import 'package:elemental_game/arena/arena_bloc/arena_bloc.dart';
import 'package:elemental_game/entity/custom_animation.dart';
import 'package:elemental_game/entity/spell.dart';
import 'package:elemental_game/utils/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../entity/player.dart';
import '../utils/helper.dart';
import '../utils/label.dart';

class SpellCard extends StatelessWidget {

  final Spell spell;

  SpellCard(this.spell);
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArenaBloc,ArenaState>
      (builder: (context,state){

        bool available = (state.player.mana>=spell.manaCost && state.playableTurn);
      return MouseRegion(
        onEnter: (event){
          context.read<ArenaBloc>().add(AddHover(spell));
          context.read<ArenaBloc>().add(ChangeTargets(spell.calculateTargets( state.player.pos, state.player.facingForward)));
        },
        onExit: (event){
          context.read<ArenaBloc>().add(AddHover(Spell(id: '0',manaCost: 0,baseElement: BaseElement.NONE)));
          context.read<ArenaBloc>().add(const ChangeTargets(<int>[]));
        },
        child: GestureDetector(
          onTap: (){
            if(available){
              if(spell.isAttunement){
                Player p = state.player;
                if(state.player.first_attunement!=BaseElement.NONE){

                  if(state.player.first_attunement==spell.baseElement){
                    p.first_attunement = BaseElement.NONE;
                  }else{
                    if(state.player.second_attunement!=BaseElement.NONE){
                      p.second_attunement = BaseElement.NONE;
                    }else{
                      p.second_attunement = spell.baseElement;
                    }
                  }
                }else{
                  p.first_attunement = spell.baseElement;
                }

                context.read<ArenaBloc>().add(ChangePlayer(p));
              }else{
                context.read<ArenaBloc>().add(AddHover(Spell(id: '0',manaCost: 0,baseElement: BaseElement.NONE)));
                context.read<ArenaBloc>().add(const ChangeTargets(<int>[]));

                final p = state.player;

                if(state.player.first_attunement!=BaseElement.NONE){

                  List<Spell> attunement_list = state.attunementsAtHand.where((element)=>element.baseElement!=state.player.first_attunement).toList();
                  attunement_list = attunement_list.where((element)=>element.baseElement!=state.player.second_attunement).toList();

                  attunement_list.add(state.attunementsAtHand.where((element)=>element.baseElement==state.player.first_attunement).toList()[0]);

                  if(state.player.second_attunement!=BaseElement.NONE){
                    attunement_list.add(state.attunementsAtHand.where((element)=>element.baseElement==state.player.second_attunement).toList()[0]);
                  }

                  context.read<ArenaBloc>().add(ChangeAttunementsAtHand(attunement_list));

                  p.mana = p.mana - spell.manaCost;
                  p.first_attunement = BaseElement.NONE;
                  p.second_attunement = BaseElement.NONE;
                  context.read<ArenaBloc>().add(ChangePlayer(p));
                }else{
                  List<Spell> list = state.spellsAtHand.where((element)=>element.id!=spell.id).toList();
                  list.add(spell);
                  p.mana = p.mana - spell.manaCost;
                  context.read<ArenaBloc>().add(ChangePlayer(p));
                  context.read<ArenaBloc>().add(ChangeSpellsAtHand(list));
                }


                if((spell.calculateTargets(state.player.pos,state.player.facingForward)??[]).contains(state.opponent.pos)){
                  Player opponent = state.opponent;
                  opponent.health = opponent.health - (spell.damage??0);
                  opponent.status = spell.status;
                  context.read<ArenaBloc>().add(ChangeOpponent(opponent));
                }


                List<CustomAnimationFrame> frames = [];


                int i = 0;
                while(i<(spell.animationFrames??[]).length){

                  final frame = Transform.flip(flipX: !state.player.facingForward,child:spell.animationFrames![i]);
                  final pos = spell.posByFame!(state.player.pos,context,i,state.player.facingForward);
                  frames.add(
                      CustomAnimationFrame(
                        frame: frame,
                        frameDuration: Duration(milliseconds: 10),
                        left: pos["left"]??0.0,
                        right:pos["right"]??0.0,
                        top:  pos["top"]??0.0,
                        bottom: pos["bottom"]??0.0,
                      )
                  );
                  i++;
                }

                context.read<ArenaBloc>().add(ChangeSpellAnimation(frames));
              }
            }
          },
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: (
                          (state.player.first_attunement==spell.baseElement || state.player.second_attunement==spell.baseElement)
                              && spell.isAttunement)?spell.getColorFromBaseElement(available):
                        state.hoveringSpell.id!='0'?
                          state.hoveringSpell!.id==spell.id?
                          spell.getColorFromBaseElement(available):Colors.black:Colors.black,
                      blurRadius: 20,
                      spreadRadius: ((state.player.first_attunement==spell.baseElement || state.player.second_attunement==spell.baseElement) && spell.isAttunement)?10:
                      state.hoveringSpell.id!='0'?
                      state.hoveringSpell!.id==spell.id?
                      10:0:0,
                      offset: Offset(0, state.hoveringSpell!.id==spell.id?0.0:6.0),
                  )]
            ),
            child: Stack(
                children:[
                  Container(
                    height: MediaQuery.of(context).size.height*0.15,
                    width: MediaQuery.of(context).size.width*0.10,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Helper.darkenColor(spell.getColorFromBaseElement(available),amount: 0.1),
                            spell.getColorFromBaseElement(available),
                            Helper.lightenColor(spell.getColorFromBaseElement(available),amount: 0.1)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  Positioned(
                    bottom:  MediaQuery.of(context).size.height*0.025,
                    left:  MediaQuery.of(context).size.width*0.02,
                    right:  MediaQuery.of(context).size.width*0.02,
                    top:  MediaQuery.of(context).size.height*0.01,
                    child: Image(image: _getFG(spell).image,color: isSuper(spell)?Palette.gold:Colors.white,),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      top:  MediaQuery.of(context).size.height*0.115,
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          Label.write(
                              text: spell.isAttunement?
                              _nameFromElement(spell.baseElement):spell.name,
                              color: isSuper(spell)?Palette.gold:spell.getTextColor(),
                              fontsize: spell.isAttunement?
                              MediaQuery.of(context).size.height*0.025:
                                  spell.name.length>20?MediaQuery.of(context).size.height*0.018:
                                  spell.name.length>15?MediaQuery.of(context).size.height*0.022:
                                  MediaQuery.of(context).size.height*0.025
                          ),
                          Expanded(child: Container()),
                        ],)
                  ),
                  Positioned(
                    left: 10,
                    child: SizedBox(
                      height: 50,
                      width: 10,
                      child: Text(spell.isAttunement && state.player.first_attunement==spell.baseElement?"1":""),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    child: SizedBox(
                      height: 50,
                      width: 10,
                      child: Text(spell.isAttunement && state.player.second_attunement==spell.baseElement?"2":""),
                    ),
                  ),
                ]
            ),
          ),
        )
      );
    });

  }



  String _nameFromElement(BaseElement element){
    switch(element){

      case(BaseElement.AIR):
        return "Ventus";
      case(BaseElement.WATER):
        return "Aqua";
      case(BaseElement.FIRE):
        return "Ignis";
      case(BaseElement.EARTH):
        return "Terra";
      default:
        return "";
    }
  }

  bool isSuper(Spell spell){
    bool isSuper = false;
    // if(!spell.isAttunement){
    //   String spell_element = spell.id.split("-")![0];
    //   String spell_attunement = spell.id.split("-")![2];
    //
    //   if(spell_element == spell_attunement){
    //     isSuper = true;
    //   }
    // }
    return isSuper;
  }

  Image _getFG(Spell spell){
    if(spell.fg_image!=null){
      return spell.fg_image!;
    }
    switch(spell.baseElement){
      case(BaseElement.AIR):
        return Image.asset("spells/wind_fg.png",);
      case(BaseElement.WATER):
        return Image.asset("spells/water_fg.png",);
      case(BaseElement.FIRE):
        return Image.asset("spells/fire_fg.png",);
      case(BaseElement.EARTH):
        return Image.asset("spells/earth_fg.png",);
      default:
        return Image.asset("spells/default_bg.png",scale: 500,);
    }
  }
}