//
//
// import 'package:elemental_game/arena/arena_bloc/arena_bloc.dart';
// import 'package:elemental_game/arena/position_tile.dart';
// import 'package:elemental_game/utils/palette.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../entity/player.dart';
// import '../entity/spell.dart';
// import '../utils/label.dart';
// import 'casting_slot.dart';
//
// class CastingController extends StatelessWidget{
//
//   CastingController();
//
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocBuilder<ArenaBloc,ArenaState>(
//         buildWhen: (previous,current)=>
//           previous.castingSpells.length!=current.castingSpells.length ||
//           previous.currentCastingTimer!=current.currentCastingTimer,
//         builder: (context, state){
//
//           final spells = state.castingSpells;
//
//           if(spells.isNotEmpty){
//             if(state.currentCastingTimer==0){
//               final List<Spell> list = spells.length>1?spells.sublist(1):[];
//               context.read<ArenaBloc>().add(ChangeCastingSpells(list));
//               if(list.isNotEmpty){
//                 context.read<ArenaBloc>().add(ChangeCastingTimer(list[0].castingTime));
//               }
//
//             }
//           }
//
//           return Row(
//             children: [
//               Expanded(child: Container(),),
//               CastingSlot(spell: spells.length>=5?spells[4]:null,timer: spells.length>=5?spells[4].castingTime:0,),
//               Expanded(child: Container(),),
//               CastingSlot(spell: spells.length>=4?spells[3]:null,timer: spells.length>=4?spells[3].castingTime:0,),
//               Expanded(child: Container(),),
//               CastingSlot(spell: spells.length>=3?spells[2]:null,timer: spells.length>=3?spells[2].castingTime:0,),
//               Expanded(child: Container(),),
//               CastingSlot(spell: spells.length>=2?spells[1]:null,timer: spells.length>=2?spells[1].castingTime:0,),
//               Expanded(child: Container(),),
//               CastingSlot(spell: spells.isNotEmpty?spells[0]:null,timer: state.currentCastingTimer,),
//               Expanded(child: Container(),),
//             ],
//           );
//         }
//     );
//   }
// }