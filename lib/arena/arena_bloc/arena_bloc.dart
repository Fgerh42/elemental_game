import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:elemental_game/utils/ninja_spell_list.dart';
import 'package:elemental_game/utils/spell_list.dart';
import 'package:flutter/material.dart';

import '../../entity/custom_animation.dart';
import '../../entity/player.dart';
import '../../entity/spell.dart';

part 'arena_event.dart';


part 'arena_state.dart';


List<Spell> buildAttunements(){
  final list = [
    Spell(id: "101",name: "Ventus Attunement",isAttunement: true,baseElement: BaseElement.AIR, manaCost: 1),
    Spell(id: "102",name: "Aqua Attunement",isAttunement: true,baseElement: BaseElement.WATER, manaCost: 1),
    // Spell(id: "103",name: "Ignis Attunement",isAttunement: true,baseElement: BaseElement.FIRE, manaCost: 1),
    // Spell(id: "104",name: "Terra Attunement",isAttunement: true,baseElement: BaseElement.EARTH, manaCost: 1),
  ];
  list.shuffle();

  return list;
}
class ArenaBloc extends Bloc<ArenaEvent, ArenaState> {
  ArenaBloc() : super(ArenaState(
      player:Player(),
      opponent: Player(pos: 11),
      spellsAtHand: [],
      attunementsAtHand:buildAttunements(),
      spellAnimation: [],
      hoveringSpell: Spell(id:'0', manaCost: 0,baseElement: BaseElement.NONE),
  )) {
    on<Init>(_Init);
    on<ChangePos>(_ChangePos);
    on<ChangeArenaView>(_ChangeArenaView);
    on<ChangeSpellsAtHand>(_ChangeSpellsAtHand);
    on<AddHover>(_AddHover);
    on<ChangeAttunementsAtHand>(_ChangeAttunementsAtHand);
    on<ChangePlayer>(_ChangePlayer);
    on<ChangeOpponent>(_ChangeOpponent);
    on<ChangeTargets>(_ChangeTargets);
    on<ChangeTurn>(_ChangeTurn);
    on<ChangeAnimationControlIndex>(_ChangeAnimationControlIndex);
    on<ChangeSpellAnimation>(_ChangeSpellAnimation);
    // on<ChangeCastingSpells>(_ChangeCastingSpells);
    // on<ChangeCastingTimer>(_ChangeCastingTime);
  }


  FutureOr<void> _Init(Init event,
      Emitter<ArenaState> emit,) async {

  }


  FutureOr<void> _ChangePos(ChangePos event,
      Emitter<ArenaState> emit,) async {

    final int pos = event.pos;

    final Player p = state.player;
    p.pos = pos;
    emit(state.copyWith(player: p));

  }

  FutureOr<void> _ChangeArenaView(ChangeArenaView event,
      Emitter<ArenaState> emit,) async {

    final bool view = event.view;
    emit(state.copyWith(moving: view));

  }

  FutureOr<void> _ChangeSpellsAtHand(ChangeSpellsAtHand event,
      Emitter<ArenaState> emit,) async {

    final List<Spell> spells = event.spells;
    emit(state.copyWith(spellsAtHand: spells));

  }

  FutureOr<void> _ChangeAttunementsAtHand(ChangeAttunementsAtHand event,
      Emitter<ArenaState> emit,) async {

    final List<Spell> attunements = event.attunements;
    emit(state.copyWith(attunementsAtHand: attunements));

  }

  FutureOr<void> _ChangePlayer(ChangePlayer event,
      Emitter<ArenaState> emit,) async {

    final player = event.player;
    emit(state.copyWith(player: player));

  }

  FutureOr<void> _ChangeOpponent(ChangeOpponent event,
      Emitter<ArenaState> emit,) async {

    final opponent = event.opponent;

    emit(state.copyWith(opponent: opponent));

  }

  FutureOr<void> _ChangeAnimationControlIndex(ChangeAnimationControlIndex event,
      Emitter<ArenaState> emit,) async {

    final index = event.index;

    emit(state.copyWith(animationControlIndex: index));

  }


  FutureOr<void> _AddHover(AddHover event,
      Emitter<ArenaState> emit,) async {

    final Spell? spell = event.spell;
    emit(state.copyWith(hoveringSpell: spell));

  }

  FutureOr<void> _ChangeTargets(ChangeTargets event,
      Emitter<ArenaState> emit,) async {

    final targets = event.targets;
    emit(state.copyWith(targets: targets));

  }

  FutureOr<void> _ChangeCastingSpells(ChangeCastingSpells event,
      Emitter<ArenaState> emit,) async {

    final spells = event.spells;
    emit(state.copyWith(castingSpells: spells));

  }

  FutureOr<void> _ChangeCastingTime(ChangeCastingTimer event,
      Emitter<ArenaState> emit,) async {

    final timer = event.timer;

    emit(state.copyWith(currentCastingTimer: timer));

  }

  FutureOr<void> _ChangeTurn(ChangeTurn event,
      Emitter<ArenaState> emit,) async {

    Player p = state.player;
    //int remainingTime = state.currentCastingTimer;
    if(!state.playableTurn){
      if(state.playableTurn != event.playable){
        p.mana++;
        // if(state.currentCastingTimer>0){
        //   remainingTime = state.currentCastingTimer - 1;
        // }
      }
    }

    final playable = event.playable;

    emit(state.copyWith(playableTurn: playable,player: p));

  }

  FutureOr<void> _ChangeSpellAnimation(ChangeSpellAnimation event,
      Emitter<ArenaState> emit,) async {


    final animation = event.animation;

    emit(state.copyWith(spellAnimation: animation));

  }
}