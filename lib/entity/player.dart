


import 'package:elemental_game/entity/spell.dart';


enum PlayerClass{
  NINJA,
  DRUID,
  ARTISAN,
  PIRATE,
}
class Player{

  int health;
  int mana;
  int pos;
  BaseElement first_attunement;
  BaseElement second_attunement;
  PlayerClass? playerClass;
  Status status;
  bool facingForward;

  Player(
      {
        this.pos = 8,
        this.health=12,
        this.playerClass,
        this.mana=6,
        this.facingForward = true,
        this.first_attunement=BaseElement.NONE,
        this.second_attunement=BaseElement.NONE,
        this.status=Status.NONE
      });


}