


import 'package:elemental_game/utils/helper.dart';
import 'package:elemental_game/utils/label.dart';
import 'package:flutter/material.dart';

import '../entity/spell.dart';

class PirateSpellList {


  final list = [
    Spell(
        id:"1-2-0-0",
        manaCost: 1,
        name: "Tail Wind",
        baseElement: BaseElement.AIR,
        isSubSpell: false,
        requiredElement: BaseElement.NONE,
        subSpells: [
          Spell(
            id: "1-2-1-0",
            manaCost: 1,
            name: "Tail Wind+",
            baseElement: BaseElement.AIR,
            requiredElement: BaseElement.AIR,
            isSubSpell:true,
            subSpells: [
              Spell(
                id: "1-2-1-2",
                manaCost: 1,
                name: "Mist Step+",
                baseElement: BaseElement.SPECTRAL,
                requiredElement: BaseElement.WATER,
                isSubSpell:true,
              ),
              Spell(
                id: "1-2-1-3",
                manaCost: 1,
                name: "Light Sail+",
                baseElement: BaseElement.LIGHT,
                requiredElement: BaseElement.FIRE,
                isSubSpell:true,
              ),
              Spell(
                id: "1-2-1-4",
                manaCost: 1,
                name: "Weigthless+",
                baseElement: BaseElement.GRAVITY,
                requiredElement: BaseElement.EARTH,
                isSubSpell:true,
              ),
            ]
          ),
          Spell(
              id: "1-2-2-0",
              manaCost: 1,
              name: "Mist Step",
              baseElement: BaseElement.SPECTRAL,
              requiredElement: BaseElement.WATER,
              isSubSpell:true,
              subSpells: [
                Spell(
                  id: "1-2-2-1",
                  manaCost: 1,
                  name: "Cold Aura",
                  baseElement: BaseElement.ICE,
                  requiredElement: BaseElement.AIR
                ),
                Spell(
                    id: "1-2-2-3",
                    manaCost: 1,
                    name: "From Hell",
                    baseElement: BaseElement.PROPHANE,
                    requiredElement: BaseElement.FIRE
                ),
                Spell(
                    id: "1-2-2-4",
                    manaCost: 1,
                    name: "Arcadia's Blessing",
                    baseElement: BaseElement.FEY,
                    requiredElement: BaseElement.EARTH
                ),
              ]
          ),
          Spell(
              id: "1-2-3-0",
              manaCost: 1,
              name: "Light Sail",
              baseElement: BaseElement.LIGHT,
              requiredElement: BaseElement.FIRE,
              isSubSpell:true,
              subSpells: [
                Spell(
                    id: "1-2-3-1",
                    manaCost: 1,
                    name: "Dream Walker",
                    baseElement: BaseElement.PSY,
                    requiredElement: BaseElement.AIR
                ),
                Spell(
                    id: "1-2-3-2",
                    manaCost: 1,
                    name: "Saving Grace",
                    baseElement: BaseElement.HOLY,
                    requiredElement: BaseElement.WATER
                ),
                Spell(
                    id: "1-2-3-4",
                    manaCost: 1,
                    name: "Cloak of Shadows",
                    baseElement: BaseElement.DARKNESS,
                    requiredElement: BaseElement.EARTH
                ),
              ]
          ),
          Spell(
              id: "1-2-4-0",
              manaCost: 1,
              name: "Weightless",
              baseElement: BaseElement.GRAVITY,
              requiredElement: BaseElement.EARTH,
              isSubSpell:true,
              subSpells: [
                Spell(
                    id: "1-2-3-1",
                    manaCost: 1,
                    name: "Time Travel",
                    baseElement: BaseElement.TIME,
                    requiredElement: BaseElement.AIR
                ),
                Spell(
                    id: "1-2-3-2",
                    manaCost: 1,
                    name: "Orbital Dance",
                    baseElement: BaseElement.GRAVITY,
                    requiredElement: BaseElement.WATER
                ),
                Spell(
                    id: "1-2-3-3",
                    manaCost: 1,
                    name: "Magnetic Presence",
                    baseElement: BaseElement.MAGNETISM,
                    requiredElement: BaseElement.FIRE
                ),
              ]
          ),
        ]
    ),
    Spell(
      id:"4-2-0-0",
      manaCost: 1,
      name: "Stone Anchor",
      baseElement: BaseElement.EARTH,
      isSubSpell: false,
      requiredElement: BaseElement.NONE,
        subSpells: [
          Spell(
              id: "1-2-1-0",
              manaCost: 1,
              name: "Tail Wind+",
              baseElement: BaseElement.AIR,
              requiredElement: BaseElement.AIR,
              isSubSpell:true,
              subSpells: [
                Spell(
                  id: "1-2-1-2",
                  manaCost: 1,
                  name: "Mist Step+",
                  baseElement: BaseElement.SPECTRAL,
                  requiredElement: BaseElement.WATER,
                  isSubSpell:true,
                ),
                Spell(
                  id: "1-2-1-3",
                  manaCost: 1,
                  name: "Light Sail",
                  baseElement: BaseElement.LIGHT,
                  requiredElement: BaseElement.FIRE,
                  isSubSpell:true,
                ),
                Spell(
                  id: "1-2-1-4",
                  manaCost: 1,
                  name: "Weigthless+",
                  baseElement: BaseElement.GRAVITY,
                  requiredElement: BaseElement.EARTH,
                  isSubSpell:true,
                ),
              ]
          ),
          Spell(
              id: "1-2-2-0",
              manaCost: 1,
              name: "Mist Step",
              baseElement: BaseElement.SPECTRAL,
              requiredElement: BaseElement.WATER,
              isSubSpell:true,
              subSpells: [
                Spell(
                    id: "1-2-2-1",
                    manaCost: 1,
                    name: "Mana Doll",
                    baseElement: BaseElement.ARCANE,
                    requiredElement: BaseElement.AIR
                ),
                Spell(
                    id: "1-2-2-3",
                    manaCost: 1,
                    name: "From Hell",
                    baseElement: BaseElement.PROPHANE,
                    requiredElement: BaseElement.FIRE
                ),
                Spell(
                    id: "1-2-2-4",
                    manaCost: 1,
                    name: "Arcadia's Blessing",
                    baseElement: BaseElement.FEY,
                    requiredElement: BaseElement.EARTH
                ),
              ]
          ),
          Spell(
              id: "1-2-3-0",
              manaCost: 1,
              name: "Light Sail",
              baseElement: BaseElement.LIGHT,
              requiredElement: BaseElement.FIRE,
              isSubSpell:true,
              subSpells: [
                Spell(
                    id: "1-2-3-1",
                    manaCost: 1,
                    name: "Dream Walker",
                    baseElement: BaseElement.PSY,
                    requiredElement: BaseElement.AIR
                ),
                Spell(
                    id: "1-2-3-2",
                    manaCost: 1,
                    name: "Saving Grace",
                    baseElement: BaseElement.HOLY,
                    requiredElement: BaseElement.WATER
                ),
                Spell(
                    id: "1-2-3-4",
                    manaCost: 1,
                    name: "Cloak of Shadows",
                    baseElement: BaseElement.DARKNESS,
                    requiredElement: BaseElement.EARTH
                ),
              ]
          ),
          Spell(
              id: "1-2-4-0",
              manaCost: 1,
              name: "Weightless",
              baseElement: BaseElement.GRAVITY,
              requiredElement: BaseElement.EARTH,
              isSubSpell:true,
              subSpells: [
                Spell(
                    id: "1-2-3-1",
                    manaCost: 1,
                    name: "Time Travel",
                    baseElement: BaseElement.TIME,
                    requiredElement: BaseElement.AIR
                ),
                Spell(
                    id: "1-2-3-2",
                    manaCost: 1,
                    name: "Orbital Dance",
                    baseElement: BaseElement.GRAVITY,
                    requiredElement: BaseElement.WATER
                ),
                Spell(
                    id: "1-2-3-3",
                    manaCost: 1,
                    name: "Magnetic Presence",
                    baseElement: BaseElement.MAGNETISM,
                    requiredElement: BaseElement.FIRE
                ),
              ]
          ),
        ]
    ),
    Spell(
      id:"3-2-0-0",
      manaCost: 2,
      damage: 2,
      name: "Fire Ball",
      baseElement: BaseElement.FIRE,
      isSubSpell: false,
      requiredElement: BaseElement.NONE,
      rangeType: RangeType.SHORT_LINE,
      status: Status.BURNING,
      fg_image: Image.asset("spells/fire_ball_fg.png"),
      posByFame: (int player_pos,BuildContext context,int index){
          final height = MediaQuery.of(context).size.height;
          final width = MediaQuery.of(context).size.width;

          final left = width*0.33;
          final right = width*0.57;
          final top = height*0.37;
          final bottom = height*0.37;

          int i = 1;
          int col = 1;

          while(i<19){
            if(player_pos==i||player_pos-6==i||player_pos-12==i){
              col = i;
            }
            i++;
          }

          int lane = player_pos>12?3:player_pos>6?2:1;

          double h_mod = (col-2)*0.005*width;

          double v_mod = (lane-2)*0.16*height;


          return {
            "left":left + h_mod + (width*0.02*index),
            "top":top + v_mod,
            "right":right - h_mod - (width*0.02*index),
            "bottom":bottom - v_mod
          };
      },
      animationFrames: Helper.getFrames("fire_ball_frame", 10),
      subSpells: [
          Spell(
              id: "3-2-1-0",
              manaCost: 1,
              name: "Static Sphere",
              baseElement: BaseElement.ELECTRICITY,
              requiredElement: BaseElement.AIR,
              isSubSpell:true,
              subSpells: [
                Spell(
                  id: "3-2-1-2",
                  manaCost: 1,
                  name: "Holy Canon",
                  baseElement: BaseElement.HOLY,
                  requiredElement: BaseElement.WATER,
                  isSubSpell:true,
                ),
                Spell(
                  id: "3-2-1-3",
                  manaCost: 1,
                  name: "Satanic Canon",
                  baseElement: BaseElement.PROPHANE,
                  requiredElement: BaseElement.FIRE,
                  isSubSpell:true,
                ),
                Spell(
                  id: "3-2-1-4",
                  manaCost: 1,
                  name: "Singularity",
                  baseElement: BaseElement.GRAVITY,
                  requiredElement: BaseElement.EARTH,
                  isSubSpell:true,
                ),
              ]
          ),
          Spell(
              id: "3-2-2-0",
              manaCost: 2,
              damage: 2,
              name: "Corrosive Sphere",
              baseElement: BaseElement.ACID,
              requiredElement: BaseElement.WATER,
              rangeType: RangeType.SHORT_LINE,
              status: Status.CORRODED,
              fg_image: Image.asset("spells/corrosive_sphere_fg.png"),
              isSubSpell:true,
              posByFame: (int player_pos,BuildContext context,int index){
                final height = MediaQuery.of(context).size.height;
                final width = MediaQuery.of(context).size.width;


                final left = width*0.33;
                final right = width*0.57;
                final top = height*0.37;
                final bottom = height*0.37;


                double h_mod = player_pos ==1 ||player_pos == 4 || player_pos == 7?-(width*0.1):0.0;
                h_mod = player_pos == 2 ||player_pos == 5 || player_pos == 8?0.0:h_mod;
                h_mod = player_pos == 3 ||player_pos == 6 || player_pos == 9?(width*0.1):h_mod;

                double v_mod = player_pos == 1 ||player_pos == 2 || player_pos == 3?-(height*0.13):0.0;
                v_mod = player_pos == 4 ||player_pos == 5 || player_pos == 6?0.0:v_mod;
                v_mod = player_pos == 7 ||player_pos == 8 || player_pos == 9?(height*0.13):v_mod;


                return {
                  "left":left + h_mod + (width*0.037*index),
                  "top":top + v_mod,
                  "right":right - h_mod - (width*0.037*index),
                  "bottom":bottom - v_mod
                };
              },
              animationFrames: Helper.getFrames("corrosive_sphere_frame", 8),
              subSpells: [
                Spell(
                    id: "3-2-2-1",
                    manaCost: 1,
                    name: "Viral Infection",
                    baseElement: BaseElement.VIRUS,
                    requiredElement: BaseElement.AIR
                ),
                Spell(
                    id: "3-2-2-1",
                    manaCost: 1,
                    name: "Smoke Sphere",
                    baseElement: BaseElement.SMOKE,
                    requiredElement: BaseElement.FIRE
                ),
                Spell(
                    id: "3-2-2-4",
                    manaCost: 1,
                    name: "Oil Sphere",
                    baseElement: BaseElement.OIL,
                    requiredElement: BaseElement.EARTH
                ),
              ]
          ),
          Spell(
              id: "3-2-3-0",
              manaCost: 3,
              damage: 3,
              name: "Fire Ball+",
              baseElement: BaseElement.FIRE,
              requiredElement: BaseElement.FIRE,
              isSubSpell:true,
              rangeType: RangeType.SHORT_LINE,
              fg_image: Image.asset("spells/fire_ball_fg.png"),
              posByFame: (int player_pos,BuildContext context,int index){
                final height = MediaQuery.of(context).size.height;
                final width = MediaQuery.of(context).size.width;


                final left = width*0.33;
                final right = width*0.57;
                final top = height*0.37;
                final bottom = height*0.37;


                double h_mod = player_pos ==1 ||player_pos == 4 || player_pos == 7?-(width*0.1):0.0;
                h_mod = player_pos == 2 ||player_pos == 5 || player_pos == 8?0.0:h_mod;
                h_mod = player_pos == 3 ||player_pos == 6 || player_pos == 9?(width*0.1):h_mod;

                double v_mod = player_pos == 1 ||player_pos == 2 || player_pos == 3?-(height*0.13):0.0;
                v_mod = player_pos == 4 ||player_pos == 5 || player_pos == 6?0.0:v_mod;
                v_mod = player_pos == 7 ||player_pos == 8 || player_pos == 9?(height*0.13):v_mod;


                return {
                  "left":left + h_mod + (width*0.02*index),
                  "top":top + v_mod,
                  "right":right - h_mod - (width*0.02*index),
                  "bottom":bottom - v_mod
                };
              },
              animationFrames: Helper.getFrames("fire_ball_frame", 10),
              subSpells: [
                Spell(
                    id: "3-2-3-1",
                    manaCost: 1,
                    name: "Static Sphere+",
                    baseElement: BaseElement.ELECTRICITY,
                    requiredElement: BaseElement.AIR
                ),
                Spell(
                    id: "3-2-3-2",
                    manaCost: 1,
                    name: "Corrosive Sphere+",
                    baseElement: BaseElement.ACID,
                    requiredElement: BaseElement.WATER
                ),
                Spell(
                    id: "1-2-3-4",
                    manaCost: 1,
                    name: "Lava Sphere+",
                    baseElement: BaseElement.LAVA,
                    requiredElement: BaseElement.EARTH
                ),
              ]
          ),
          Spell(
              id: "3-2-4-0",
              manaCost: 1,
              name: "Lava Sphere",
              baseElement: BaseElement.LAVA,
              requiredElement: BaseElement.EARTH,
              isSubSpell:true,
              subSpells: [
                Spell(
                    id: "1-2-3-1",
                    manaCost: 1,
                    name: "Crystal Canon",
                    baseElement: BaseElement.CRYSTAL,
                    requiredElement: BaseElement.AIR
                ),
                Spell(
                    id: "1-2-3-2",
                    manaCost: 1,
                    name: "Iron Canon",
                    baseElement: BaseElement.GRAVITY,
                    requiredElement: BaseElement.WATER
                ),
                Spell(
                    id: "1-2-3-3",
                    manaCost: 1,
                    name: "Arcane Canon",
                    baseElement: BaseElement.ARCANE,
                    requiredElement: BaseElement.FIRE
                ),
              ]
          ),
        ]
    ),
    Spell(
      id:"2-2-0-0",
      manaCost: 1,
      name: "Sea Dragon",
      baseElement: BaseElement.WATER,
      isSubSpell: false,
      isAttunement: false,
      requiredElement: BaseElement.NONE,
      subSpells: [
        Spell(
          id:"2-2-1-0",
          manaCost: 1,
          name: "Ice Dragon",
          baseElement: BaseElement.ICE,
          isSubSpell: true,
          requiredElement: BaseElement.AIR,
          subSpells: [
            Spell(
              id:"2-2-1-2",
              manaCost: 1,
              name: "Ghost Dragon",
              baseElement: BaseElement.SPECTRAL,
              isSubSpell: true,
              requiredElement: BaseElement.WATER,
            ),
            Spell(
              id:"2-2-1-3",
              manaCost: 1,
              name: "Steam Dragon",
              baseElement: BaseElement.STEAM,
              isSubSpell: true,
              requiredElement: BaseElement.FIRE,
            ),
            Spell(
              id:"2-2-1-3",
              manaCost: 1,
              name: "Temporal Dragon",
              baseElement: BaseElement.TIME,
              isSubSpell: true,
              requiredElement: BaseElement.EARTH,
            ),
          ]
        ),
        Spell(
          id:"2-2-2-0",
          manaCost: 1,
          name: "Sea Dragon+",
          baseElement: BaseElement.WATER,
          isSubSpell: true,
          requiredElement: BaseElement.WATER,
          subSpells: [
            Spell(
              id:"2-2-2-1",
              manaCost: 1,
              name: "Ice Dragon+",
              baseElement: BaseElement.ICE,
              isSubSpell: true,
              requiredElement: BaseElement.WATER,
            ),
            Spell(
              id:"2-2-2-3",
              manaCost: 1,
              name: "Venom Dragon+",
              baseElement: BaseElement.VENOM,
              isSubSpell: true,
              requiredElement: BaseElement.FIRE,
            ),
            Spell(
              id:"2-2-2-4",
              manaCost: 1,
              name: "Wood Dragon+",
              baseElement: BaseElement.PLANT,
              isSubSpell: true,
              requiredElement: BaseElement.EARTH,
            ),
          ]
        ),
        Spell(
            id:"2-2-3-0",
            manaCost: 1,
            name: "Venom Dragon",
            baseElement: BaseElement.VENOM,
            isSubSpell: true,
            requiredElement: BaseElement.FIRE,
            subSpells: [
              Spell(
                id:"2-2-3-1",
                manaCost: 1,
                name: "Acid Dragon",
                baseElement: BaseElement.ACID,
                isSubSpell: true,
                requiredElement: BaseElement.AIR,
              ),
              Spell(
                id:"2-2-3-2",
                manaCost: 1,
                name: "Drunken Dragon",
                baseElement: BaseElement.ALCOHOL,
                isSubSpell: true,
                requiredElement: BaseElement.WATER,
              ),
              Spell(
                id:"2-2-3-4",
                manaCost: 1,
                name: "Shadow Dragon",
                baseElement: BaseElement.DARKNESS,
                isSubSpell: true,
                requiredElement: BaseElement.EARTH,
              ),
            ]
        ),
        Spell(
            id:"2-2-4-0",
            manaCost: 1,
            name: "Wood Dragon",
            baseElement: BaseElement.PLANT,
            isSubSpell: true,
            requiredElement: BaseElement.EARTH,
            subSpells: [
              Spell(
                id:"2-2-4-1",
                manaCost: 1,
                name: "Spider Dragon",
                baseElement: BaseElement.ARTHROPOD,
                isSubSpell: true,
                requiredElement: BaseElement.AIR,
              ),
              Spell(
                id:"2-2-4-2",
                manaCost: 1,
                name: "Fey Dragon",
                baseElement: BaseElement.FEY,
                isSubSpell: true,
                requiredElement: BaseElement.WATER,
              ),
              Spell(
                id:"2-2-4-3",
                manaCost: 1,
                name: "Lich Dragon",
                baseElement: BaseElement.NECRO,
                isSubSpell: true,
                requiredElement: BaseElement.FIRE,
              ),
            ]
        ),
      ]
    ),
  ];
}