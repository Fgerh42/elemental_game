part of 'arena_bloc.dart';

abstract class ArenaEvent {
  const ArenaEvent();

  @override
  List<Object?> get props => [];
}

class Init extends ArenaEvent {

}

class ChangePos extends ArenaEvent {
  const ChangePos(this.pos);

  final int pos;

  @override
  List<Object?> get props => [pos];
}

class ChangeArenaView extends ArenaEvent {
  const ChangeArenaView(this.view);

  final bool view;

  @override
  List<Object?> get props => [view];
}

class ChangeTurn extends ArenaEvent {
  const ChangeTurn(this.playable);

  final bool playable;

  @override
  List<Object?> get props => [playable];
}


class ChangeSpellsAtHand extends ArenaEvent {
  const ChangeSpellsAtHand(this.spells);

  final List<Spell> spells;

  @override
  List<Object?> get props => [spells];
}
class ChangeAttunementsAtHand extends ArenaEvent {
  const ChangeAttunementsAtHand(this.attunements);

  final List<Spell> attunements;

  @override
  List<Object?> get props => [attunements];
}

class ChangePlayer extends ArenaEvent {
  const ChangePlayer(this.player);

  final Player player;

  @override
  List<Object?> get props => [player];
}

class ChangeOpponent extends ArenaEvent {
  const ChangeOpponent(this.opponent);

  final Player opponent;

  @override
  List<Object?> get props => [opponent];
}

class AddHover extends ArenaEvent {
  const AddHover(this.spell);

  final Spell? spell;

  @override
  List<Object?> get props => [spell];
}

class ChangeTargets extends ArenaEvent {
  const ChangeTargets(this.targets);

  final targets;

  @override
  List<Object?> get props => [targets];
}

class ChangeCastingSpells extends ArenaEvent {
  const ChangeCastingSpells(this.spells);

  final spells;

  @override
  List<Object?> get props => [spells];
}

class ChangeCastingTimer extends ArenaEvent {
  const ChangeCastingTimer(this.timer);

  final timer;

  @override
  List<Object?> get props => [timer];
}

class ChangeAnimationControlIndex extends ArenaEvent {
  const ChangeAnimationControlIndex(this.index);

  final index;

  @override
  List<Object?> get props => [index];
}

class ChangeSpellAnimation extends ArenaEvent {
  const ChangeSpellAnimation(this.animation);

  final animation;

  @override
  List<Object?> get props => [animation];
}