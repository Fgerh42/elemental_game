

import 'package:flutter/material.dart';

import '../entity/spell.dart';

class SpellList {

  // Spell(
  //     id: '1-2-0',
  //     manaCost: 1,
  //     baseElement: BaseElement.AIR,
  //     isAttunement: false,
  //     targetsOpponentField: false,
  //     name: "Tail Wind",
  //     damage: 0,
  //     isSubSpell: false,
  //     requiredElement:BaseElement.NONE,
  //     description: "Surrounds the mage with wind, for the next 3 turns,\n moves two blocs each time.",
  //     comment: '',
  //     rangeType: RangeType.SELF,
  //     subSpells: [
  //       Spell(
  //           id: '1-2-1',
  //           manaCost: 2,
  //           isAttunement: false,
  //           baseElement: BaseElement.AIR,
  //           name: "Tail Wind+",
  //           requiredElement: BaseElement.AIR,
  //           rangeType: RangeType.SELF,
  //           targetsOpponentField: false,
  //           comment: '',
  //           description: "Stronger version of Tail Wind,lasts 5 turns instead"
  //       ),
  //       Spell(
  //           id: '1-2-2',
  //           manaCost: 2,
  //           isAttunement: false,
  //           name: "Chilling Presence",
  //           baseElement: BaseElement.ICE,
  //           damage: 0,
  //           requiredElement: BaseElement.WATER,
  //           isSubSpell: true,
  //           targetsOpponentField: false,
  //           rangeType: RangeType.SELF,
  //           comment: '',
  //           description: "Surrounds the mage with a cold aura,\n sets COLD when hit"
  //       ),
  //       Spell(
  //           id: '1-2-3',
  //           manaCost: 2,
  //           isAttunement: false,
  //           name: "Faster Than Light",
  //           baseElement: BaseElement.LIGHT,
  //           damage: 0,
  //           requiredElement: BaseElement.FIRE,
  //           isSubSpell: true,
  //           targetsOpponentField: false,
  //           rangeType: RangeType.FULL,
  //           description: "Teleports away into a random position."
  //       ),
  //       Spell(
  //           id: '1-2-4',
  //           manaCost: 2,
  //           isAttunement: false,
  //           name: "Weightless",
  //           baseElement: BaseElement.GRAVITY,
  //           damage: 1,
  //           requiredElement: BaseElement.EARTH,
  //           isSubSpell: true,
  //           targetsOpponentField: false,
  //           rangeType: RangeType.SELF,
  //           description: "Makes the mage float, when hit,\n sets the position to the first collum"
  //       ),
  //     ]
  // ),



  final list = [
    Spell(
      id: '1-1-0-0',
      manaCost: 1,
      baseElement: BaseElement.AIR,
      isAttunement: false,
      name: "Wind Blade",
      damage: 1,
      isSubSpell: false,
      fg_image: Image.asset("spells/wind_blade_fg.png"),
      requiredElement:BaseElement.NONE,
      description: "A spinning blade of wind that cuts foes",
      comment: '"Winds of change indeed,\n bloody change, that is"',
      rangeType: RangeType.MEDIUM_LINE,
      subSpells: [
        Spell(
          id: '1-1-1-0',
          manaCost: 2,
          isAttunement: false,
          baseElement: BaseElement.AIR,
          name: "Wind Blade+",
          damage: 1,
          requiredElement: BaseElement.AIR,
          rangeType: RangeType.LONG_LINE,
          fg_image: Image.asset("spells/wind_blade_fg.png"),
          comment: '"Winds of change indeed, bloody change that is"',
          description: "Stronger version of Wind Blade.",
          subSpells: [
            Spell(
              id: '1-1-1-2',
              manaCost: 3,
              isAttunement: false,
              baseElement: BaseElement.ICE,
              name: "Cold Gust+",
              damage:2,
              requiredElement: BaseElement.WATER,
              status: Status.COLD,
              rangeType: RangeType.MEDIUM_LINE,
            ),
            Spell(
              id: '1-1-1-3',
              manaCost: 3,
              isAttunement: false,
              baseElement: BaseElement.LIGHT,
              name: "Flash+",
              damage:2,
              requiredElement: BaseElement.FIRE,
              status: Status.BLIND,
              rangeType: RangeType.MEDIUM_LINE,
            ),
            Spell(
              id: '1-1-1-4',
              manaCost: 3,
              isAttunement: false,
              baseElement: BaseElement.SAND,
              name: "Sandstorm+",
              damage:2,
              requiredElement: BaseElement.EARTH,
              rangeType: RangeType.MEDIUM_LINE,
            ),
          ]
        ),
        Spell(
            id: '1-1-2-0',
            manaCost: 2,
            isAttunement: false,
            name: "Cold Gust",
            baseElement: BaseElement.ICE,
            damage: 1,
            requiredElement: BaseElement.WATER,
            isSubSpell: true,
            status: Status.COLD,
            rangeType: RangeType.MEDIUM_LINE,
            comment: '"Good to preserve food and to \n crack a cold beer anywhere"',
            description: "A wind of gust that cools down the opponent",
            subSpells: [
              Spell(
                id: '1-1-2-1',
                manaCost: 2,
                isAttunement:false,
                name: "Spectral Flow",
                baseElement: BaseElement.SPECTRAL,
                damage: 2,
                requiredElement: BaseElement.AIR,
                isSubSpell: true,
                status: Status.PARANOID,
                rangeType: RangeType.MEDIUM_LINE,
              ),
              Spell(
                id: '1-1-2-3',
                manaCost: 3,
                isAttunement: false,
                baseElement: BaseElement.PSY,
                name: "Mind Blast",
                damage:2,
                requiredElement: BaseElement.FIRE,
                rangeType: RangeType.MEDIUM_LINE,
              ),
              Spell(
                id: '1-1-2-4',
                manaCost: 3,
                isAttunement: false,
                baseElement: BaseElement.TIME,
                name: "Past Echoes",
                damage:2,
                requiredElement: BaseElement.EARTH,
                rangeType: RangeType.MEDIUM_LINE,
              ),
            ]
        ),
        Spell(
            id: '1-1-3-0',
            manaCost: 2,
            isAttunement: false,
            name: "Flash",
            baseElement: BaseElement.LIGHT,
            damage: 1,
            requiredElement: BaseElement.FIRE,
            isSubSpell: true,
            status: Status.BLIND,
            rangeType: RangeType.MEDIUM_LINE,
            description: "A rapid blasting flash.",
            subSpells: [
              Spell(
                id: '1-1-3-1',
                manaCost: 2,
                name: "Mind Wipe",
                baseElement: BaseElement.PSY,
                requiredElement: BaseElement.AIR,
              ),
              Spell(
                id: '1-1-3-2',
                manaCost: 2,
                name: "Saint Strike",
                baseElement: BaseElement.HOLY,
                requiredElement: BaseElement.WATER,
              ),
              Spell(
                id: '1-1-3-4',
                manaCost: 2,
                name: "Polar Inversion",
                baseElement: BaseElement.MAGNETISM,
                requiredElement: BaseElement.EARTH,
              ),
            ]
        ),
        Spell(
            id: '1-1-4-0',
            manaCost: 2,
            isAttunement: false,
            name: "Sandstorm",
            baseElement: BaseElement.SAND,
            damage: 1,
            requiredElement: BaseElement.EARTH,
            isSubSpell: true,
            rangeType: RangeType.MEDIUM_LINE,
            description: "A traveling blow of sand.",
            subSpells: [
              Spell(
                id: '1-1-4-1',
                manaCost: 3,
                name: "Magnetic Wave",
                baseElement: BaseElement.MAGNETISM,
                requiredElement: BaseElement.AIR
              ),
              Spell(
                  id: '1-1-4-2',
                  manaCost: 3,
                  name: "Spore Storm",
                  baseElement: BaseElement.PLANT,
                  requiredElement: BaseElement.WATER
              ),
              Spell(
                  id: '1-1-4-3',
                  manaCost: 3,
                  name: "Crystal Storm",
                  baseElement: BaseElement.CRYSTAL,
                  requiredElement: BaseElement.FIRE
              ),
            ]
        ),
      ]
    ),

    Spell(
        id: '2-1-0-0',
        manaCost: 1,
        baseElement: BaseElement.WATER,
        isAttunement: false,
        name: "Rising Bubbles",
        damage: 0,
        isSubSpell: false,
        status: Status.WET,
        requiredElement:BaseElement.NONE,
        rangeType: RangeType.FULL,
        description: "A series of bubbles that set WET at the opponent,\n but deal no DMG",
        comment: '"Nothing like this for a good bath"',
        subSpells: [
          Spell(
              id: '2-1-1-0',
              manaCost: 2,
              isAttunement: false,
              name: "Mists",
              baseElement: BaseElement.SPECTRAL,
              damage: 0,
              requiredElement: BaseElement.AIR,
              isSubSpell: true,
              status: Status.COLD,
              rangeType: RangeType.FULL,
              comment: '"Nothing good comes from here.\n Specially cause no one returns"',
              description: "An eerie fog that invites wicked things",
              subSpells: [
                Spell(
                    id: "2-1-1-2",
                    manaCost: 1,
                    requiredElement: BaseElement.WATER,
                    baseElement: BaseElement.ICE,
                    name: "Frozen Area"
                ),
                Spell(
                    id: "2-1-1-3",
                    manaCost: 1,
                    requiredElement: BaseElement.FIRE,
                    baseElement: BaseElement.PROPHANE,
                    name: "Pandemonium"
                ),
                Spell(
                    id: "2-1-1-4",
                    manaCost: 1,
                    requiredElement: BaseElement.EARTH,
                    baseElement: BaseElement.FEY,
                    name: "Fey Essence"
                ),
              ]
          ),
          Spell(
              id: '2-1-2',
              manaCost: 2,
              isAttunement: false,
              name: "Rising Bubbles+",
              baseElement: BaseElement.WATER,
              damage: 0,
              requiredElement: BaseElement.WATER,
              isSubSpell: true,
              status: Status.WET,
              rangeType: RangeType.FULL,
              description: "A series of bubbles that set WET at the opponent,\n but deal no DMG",
              comment: '"Nothing like this for a good bath"',
              subSpells: [
                Spell(
                    id: "2-1-2-1",
                    manaCost: 2,
                    isAttunement: false,
                    name: "Mists+",
                    baseElement: BaseElement.SPECTRAL,
                    damage: 0,
                    requiredElement: BaseElement.AIR,
                    isSubSpell: true,
                    status: Status.COLD,
                    rangeType: RangeType.FULL,
                ),
                Spell(
                    id: "2-1-2-3",
                    manaCost: 1,
                    requiredElement: BaseElement.FIRE,
                    baseElement: BaseElement.ALCOHOL,
                    name: "Intoxicating Essence+"
                ),
                Spell(
                    id: "2-1-2-4",
                    manaCost: 1,
                    requiredElement: BaseElement.EARTH,
                    baseElement: BaseElement.PLANT,
                    name: "Fungal Explosion+"
                ),
              ]
          ),
          Spell(
              id: '2-1-3-0',
              manaCost: 2,
              isAttunement: false,
              name: "Intoxicating Essence",
              baseElement: BaseElement.ALCOHOL,
              damage: 0,
              requiredElement: BaseElement.FIRE,
              isSubSpell: true,
              status: Status.INTOXICATED,
              rangeType: RangeType.FULL,
              comment: '"Alright!! Now we talkinh',
              description: "Intoxicating bubbles that drunken who they touch,\n Sets INTOXICATED",
              subSpells: [
                Spell(
                    id: "2-1-3-1",
                    manaCost: 1,
                    requiredElement: BaseElement.AIR,
                    baseElement: BaseElement.ACID,
                    name: "Chlorine Gas"
                ),
                Spell(
                    id: "2-1-3-2",
                    manaCost: 1,
                    requiredElement: BaseElement.WATER,
                    baseElement: BaseElement.CHI,
                    name: "Monk's Brew"
                ),
                Spell(
                    id: "2-1-3-4",
                    manaCost: 1,
                    requiredElement: BaseElement.EARTH,
                    baseElement: BaseElement.FEY,
                    name: "Faeric Absinth"
                ),
              ]
          ),
          Spell(
              id: '2-1-4-0',
              manaCost: 2,
              isAttunement: false,
              name: "Fungal Explosion",
              baseElement: BaseElement.PLANT,
              damage: 0,
              requiredElement: BaseElement.EARTH,
              isSubSpell: true,
              status: Status.CONTAMINATED,
              rangeType: RangeType.FULL,
              comment: '"Atchoo... My bad, I am alergic to those"',
              description: "A burst of fungal spores that set CONTAMINATED",
              subSpells: [
                Spell(
                    id: "2-1-4-1",
                    manaCost: 1,
                    requiredElement: BaseElement.AIR,
                    baseElement: BaseElement.VENOM,
                    name: "Forbidden Fungi"
                ),
                Spell(
                    id: "2-1-4-2",
                    manaCost: 1,
                    requiredElement: BaseElement.WATER,
                    baseElement: BaseElement.FEY,
                    name: "Gateway to Arcadia"
                ),
                Spell(
                    id: "2-1-4-3",
                    manaCost: 1,
                    requiredElement: BaseElement.FIRE,
                    baseElement: BaseElement.NECRO,
                    name: "Plague"
                ),
              ]
          ),
        ]
    ),

    Spell(
        id: '3-1-0-0',
        manaCost: 1,
        baseElement: BaseElement.FIRE,
        isAttunement: false,
        name: "Ignite",
        damage: 1,
        isSubSpell: false,
        status: Status.BURNING,
        requiredElement:BaseElement.NONE,
        rangeType: RangeType.SHORT_DUAL_LINE,
        fg_image: Image.asset("spells/ignite_fg.png"),
        description: "A fire blast, deals 1 DMG and sets BURNING",
        comment: "Fire, mankind\'s fist invention, now set for murder",
        subSpells: [
          Spell(
              id: '3-1-1-0',
              manaCost: 2,
              isAttunement: false,
              name: "Electric Surge",
              baseElement: BaseElement.ELECTRICITY,
              damage: 0,
              requiredElement: BaseElement.AIR,
              isSubSpell: true,
              status: Status.ELECTRIFIED,
              rangeType: RangeType.MEDIUM_LINE,
              comment: '"I wish we had better uses for eletricity besides murder"',
              description: "An electric blast, deals 1 DMG and sets ELECTRIFIED",
              subSpells: [
                Spell(
                    id: "3-1-1-2",
                    manaCost: 1,
                    requiredElement: BaseElement.WATER,
                    baseElement: BaseElement.HOLY,
                    name: "Godly Spark"
                ),
                Spell(
                    id: "3-1-1-3",
                    manaCost: 1,
                    requiredElement: BaseElement.FIRE,
                    baseElement: BaseElement.PROPHANE,
                    name: "Devil's Spit"
                ),
                Spell(
                    id: "3-1-1-4",
                    manaCost: 1,
                    requiredElement: BaseElement.EARTH,
                    baseElement: BaseElement.MAGNETISM,
                    name: "Radio Analysis"
                ),
              ]
          ),
          Spell(
              id: '3-1-2-0',
              manaCost: 2,
              isAttunement: false,
              name: "Steam Burst",
              baseElement: BaseElement.STEAM,
              damage: 0,
              requiredElement: BaseElement.WATER,
              isSubSpell: true,
              status: Status.VOLATILE,
              rangeType: RangeType.SHORT_DUAL_LINE,
              comment: '"I wish we had better uses for steam besides murder"',
              description: "A steam blast, deals 1 DMG and sets VOLATILE",
              subSpells: [
                Spell(
                    id: "3-1-2-1",
                    manaCost: 1,
                    requiredElement: BaseElement.AIR,
                    baseElement: BaseElement.ARCANE,
                    name: "Cloud of Pure Magic"
                ),
                Spell(
                    id: "3-1-2-3",
                    manaCost: 1,
                    requiredElement: BaseElement.FIRE,
                    baseElement: BaseElement.PLASMA,
                    name: "Plasma Blast"
                ),
                Spell(
                    id: "3-1-2-4",
                    manaCost: 1,
                    requiredElement: BaseElement.EARTH,
                    baseElement: BaseElement.TIME,
                    name: "Temporal Displacement"
                ),
              ]
          ),
          Spell(
              id: '3-1-3-0',
              manaCost: 2,
              isAttunement: false,
              name: "Ignite+",
              baseElement: BaseElement.FIRE,
              damage: 0,
              requiredElement: BaseElement.FIRE,
              isSubSpell: true,
              status: Status.BURNING,
              rangeType: RangeType.MEDIUM_DUAL_LINE,
              fg_image: Image.asset("spells/ignite_fg.png"),
              description: "A fire blast, deals 1 DMG and sets BURNING",
              comment: "Fire, mankind\'s fist invention, now set for murder",
              subSpells: [
                Spell(
                    id: "3-1-3-1",
                    manaCost: 1,
                    requiredElement: BaseElement.AIR,
                    baseElement: BaseElement.ELECTRICITY,
                    name: "Electric Surge+",
                ),
                Spell(
                    id: "3-1-3-2",
                    manaCost: 1,
                    requiredElement: BaseElement.WATER,
                    baseElement: BaseElement.STEAM,
                    name: "Steam Burst+"
                ),
                Spell(
                    id: "3-1-3-4",
                    manaCost: 1,
                    requiredElement: BaseElement.EARTH,
                    baseElement: BaseElement.LAVA,
                    name: "Lava Splash+"
                ),
              ]
          ),
          Spell(
              id: '3-1-4-0',
              manaCost: 2,
              isAttunement: false,
              name: "Lava Splash",
              baseElement: BaseElement.CRYSTAL,
              damage: 0,
              requiredElement: BaseElement.EARTH,
              isSubSpell: true,
              rangeType: RangeType.LONG_LINE,
              subSpells: [
                Spell(
                    id: "3-1-4-1",
                    manaCost: 1,
                    requiredElement: BaseElement.AIR,
                    baseElement: BaseElement.CRYSTAL,
                    name: "Crystal Slash"
                ),
                Spell(
                    id: "3-1-4-2",
                    manaCost: 1,
                    requiredElement: BaseElement.WATER,
                    baseElement: BaseElement.METAL,
                    name: "Forged Brave Sword"
                ),
                Spell(
                    id: "3-1-4-3",
                    manaCost: 1,
                    requiredElement: BaseElement.FIRE,
                    baseElement: BaseElement.ARCANE,
                    name: "Explosion of Pure Magic"
                ),
              ]
          ),
        ]
    ),

    Spell(
        id: '4-1-0-0',
        manaCost: 1,
        baseElement: BaseElement.EARTH,
        isAttunement: false,
        name: "Slab Throw",
        damage: 1,
        isSubSpell: false,
        status: Status.CONCUSSED,
        requiredElement:BaseElement.NONE,
        rangeType: RangeType.SHORT_BACK_LINE,
        description: "A flying slab that deals 1 DMG and sets CONCUSSED ",
        comment: '"Monkey brain go!!"',
        subSpells: [
          Spell(
              id: '4-1-1-0',
              manaCost: 2,
              isAttunement: false,
              name: "Sand Jet",
              baseElement: BaseElement.SAND,
              damage: 1,
              requiredElement: BaseElement.AIR,
              isSubSpell: true,
              status: Status.DEHYDRATED,
              rangeType: RangeType.MEDIUM_LINE,
              comment: '"Auch, my eyes"',
              description: "A sand jet that deals 1 DMG and sets DEHYDRATED",
              subSpells: [
                Spell(
                    id: "4-1-1-2",
                    manaCost: 1,
                    requiredElement: BaseElement.WATER,
                    baseElement: BaseElement.ARTHROPOD,
                    name: "Pherormone Squirt"
                ),
                Spell(
                    id: "4-1-1-3",
                    manaCost: 1,
                    requiredElement: BaseElement.FIRE,
                    baseElement: BaseElement.GLASS,
                    name: "Glass Blade"
                ),
                Spell(
                    id: "4-1-1-4",
                    manaCost: 1,
                    requiredElement: BaseElement.EARTH,
                    baseElement: BaseElement.GRAVITY,
                    name: "Möebius Jet"
                ),
              ]
          ),
          Spell(
              id: '4-1-2-0',
              manaCost: 2,
              isAttunement: false,
              name: "Mud Throw",
              baseElement: BaseElement.MUD,
              damage: 1,
              requiredElement: BaseElement.WATER,
              isSubSpell: true,
              status: Status.MUDDLED,
              rangeType: RangeType.SHORT_BACK_LINE,
              comment: '"Monkey brain confused, is this poop?"',
              description: "Throws a ball of mud, deals 1 DMG and sets MUDDLED",
              subSpells: [
                Spell(
                    id: "4-1-2-1",
                    manaCost: 1,
                    requiredElement: BaseElement.AIR,
                    baseElement: BaseElement.PLANT,
                    name: "Great Seed"
                ),
                Spell(
                    id: "4-1-2-3",
                    manaCost: 1,
                    requiredElement: BaseElement.FIRE,
                    baseElement: BaseElement.PROPHANE,
                    name: "Hell's Mud"
                ),
                Spell(
                    id: "4-1-2-4",
                    manaCost: 1,
                    requiredElement: BaseElement.EARTH,
                    baseElement: BaseElement.GRAVITY,
                    name: "Summon Natural Satelite"
                ),
              ]
          ),
          Spell(
            id: '4-1-3-0',
            manaCost: 2,
            isAttunement: false,
            name: "Magma Bullet",
            baseElement: BaseElement.LAVA,
            damage: 1,
            requiredElement: BaseElement.FIRE,
            isSubSpell: true,
            status: Status.LAVA_COVERED,
            rangeType: RangeType.SHORT_BACK_LINE,
            description: "Throws a ball of lava, deals 1 DMG and sets LAVA_COVERED",
            comment: "Monkey brain confused, why smell like steak?",
              subSpells: [
                Spell(id: "4-1-3-1",manaCost: 1,requiredElement: BaseElement.AIR),
                Spell(id: "4-1-3-2",manaCost: 1,requiredElement: BaseElement.WATER),
                Spell(id: "4-1-3-4",manaCost: 1,requiredElement: BaseElement.EARTH),
              ]
          ),
          Spell(
              id: '4-1-4-0',
              manaCost: 2,
              isAttunement: false,
              name: "Slab Throw+",
              baseElement: BaseElement.EARTH,
              damage: 0,
              requiredElement: BaseElement.EARTH,
              isSubSpell: true,
              rangeType: RangeType.MEDIUM_BACK_LINE,
              description: "A flying pebble that deals 1 DMG and sets CONCUSSED ",
              comment: '"Monkey brain go!!"',
              subSpells: [
                Spell(id: "4-1-4-1",manaCost: 1,requiredElement: BaseElement.AIR),
                Spell(id: "4-1-4-2",manaCost: 1,requiredElement: BaseElement.WATER),
                Spell(id: "4-1-4-3",manaCost: 1,requiredElement: BaseElement.FIRE),
              ]
          ),
        ]
    ),
  ];
}