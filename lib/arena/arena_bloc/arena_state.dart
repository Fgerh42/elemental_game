part of 'arena_bloc.dart';


class ArenaState {

  const ArenaState(
      {
        this.moving=false,
        this.targets,
        this.playableTurn=true,
        this.performingMagic=false,
        this.animationControlIndex=0,
        //this.currentCastingTimer = 0,
        required this.player,
        required this.opponent,
        required this.spellsAtHand,
        required this.spellAnimation,
        required this.attunementsAtHand,
        required this.hoveringSpell
      });
  final bool moving;
  final Player player;
  final Player opponent;
  final List<int>? targets;
  final List<Spell> spellsAtHand;
  final List<Spell> attunementsAtHand;
  final Spell hoveringSpell;
  final bool playableTurn;
  final bool performingMagic;
  final int animationControlIndex;
  final List<CustomAnimationFrame> spellAnimation;

  ArenaState copyWith(
      {
       bool? moving,
       Player? player,
       List<Spell>? spellsAtHand,
       List<Spell>? attunementsAtHand,
       Spell? hoveringSpell,
       List<int>? targets,
       bool? playableTurn,
       List<Spell>? castingSpells,
       int? currentCastingTimer,
       bool? performingMagic,
       Player? opponent,
       int? animationControlIndex,
       List<CustomAnimationFrame>? spellAnimation
      }
      ) {
    return ArenaState(
        moving: moving??this.moving,
        player: player??this.player,
        opponent: opponent??this.opponent,
        spellsAtHand: spellsAtHand??this.spellsAtHand,
        attunementsAtHand: attunementsAtHand??this.attunementsAtHand,
        hoveringSpell: hoveringSpell??this.hoveringSpell,
        targets: targets??this.targets,
        playableTurn: playableTurn??this.playableTurn,
        // castingSpells: castingSpells??this.castingSpells,
        // currentCastingTimer: currentCastingTimer??this.currentCastingTimer,
        performingMagic: performingMagic??this.performingMagic,
        animationControlIndex: animationControlIndex??this.animationControlIndex,
        spellAnimation: spellAnimation??this.spellAnimation
    );
  }

  List<Object> get props =>
      [
    moving,
    player,
    spellsAtHand,
    attunementsAtHand,
    hoveringSpell,
    playableTurn,
    performingMagic,
        animationControlIndex,
        spellAnimation
      ];
}
