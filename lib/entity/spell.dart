
import 'package:flutter/material.dart';

import '../utils/palette.dart';


enum RangeType{
  SHORT_LINE,
  MEDIUM_LINE,
  LONG_LINE,
  SHORT_DUAL_LINE,
  MEDIUM_DUAL_LINE,
  LONG_DUAL_LINE,
  SHORT_BACK_LINE,
  MEDIUM_BACK_LINE,
  BACK_COL,
  MID_COL,
  FORWARD_COL,
  FULL,
  SELF,
  CROSS,
  EXCLUSIVE_CROSS,
}
enum BaseElement{
  AIR,
  WATER,
  FIRE,
  EARTH,
  ICE,
  LIGHT,
  ALCOHOL,
  SPECTRAL,
  PLANT,
  ELECTRICITY,
  STEAM,
  CRYSTAL,
  SAND,
  MUD,
  LAVA,
  OIL,
  GRAVITY,
  VENOM,
  SMOKE,
  DARKNESS,
  NECRO,
  METAL,
  ACID,
  PSY,
  TIME,
  MAGNETISM,
  HOLY,
  PROPHANE,
  FEY,
  CHI,
  ARCANE,
  PLASMA,
  ARTHROPOD,
  GLASS,
  VIRUS,
  NONE
}
enum Status{
  BURNING,
  WET,
  BLIND,
  COLD,
  CONTAMINATED,
  PARANOID,
  ELECTRIFIED,
  VOLATILE,
  CONCUSSED,
  DEHYDRATED,
  MUDDLED,
  INTOXICATED,
  LAVA_COVERED,
  CORRODED,
  NONE
}
class Spell {

  String id;
  String name;
  BaseElement baseElement;
  int manaCost;
  int? damage;
  bool isAttunement;
  String? description;
  String? comment;
  bool isSubSpell;
  List<Spell>? subSpells;
  BaseElement requiredElement;
  Status status;
  Image? fg_image;
  RangeType? rangeType;
  bool targetsOpponentField;
  int? positionBeingCast;
  List<Widget>? animationFrames;
  Function? posByFame;

  Spell(
      {
        required this.id,
        this.baseElement=BaseElement.NONE,
        required this.manaCost,
        this.name="",
        this.damage,
        this.isAttunement=false,
        this.description,
        this.comment,
        this.isSubSpell=false,
        this.subSpells,
        this.targetsOpponentField=true,
        this.requiredElement=BaseElement.NONE,
        this.status=Status.NONE,
        this.fg_image,
        this.positionBeingCast,
        this.rangeType,
        this.animationFrames,
        this.posByFame,
      });

  List<int>? calculateTargets(int pos,bool facingForward){

    switch(rangeType){
      case(RangeType.SHORT_LINE):
        if(facingForward){
          if(pos==6||pos==12||pos==18){
            return [];
          }
          if(pos==5||pos==11||pos==17){
            return [pos+1];
          }

          return [pos+1,pos+2];

        }else{
          if(pos==1||pos==7||pos==13){
            return [];
          }
          if(pos==2||pos==8||pos==4){
            return [pos-1];
          }
          return [pos-1,pos-2];
        }
      case(RangeType.MEDIUM_LINE):
        if(facingForward){
          if(pos==6||pos==12||pos==18){
            return [];
          }
          if(pos==5||pos==11||pos==17){
            return [pos+1];
          }
          if(pos==4||pos==10||pos==16){
            return [pos+1,pos+2];
          }

          return [pos+1,pos+2,pos+3];

        }else{
          if(pos==1||pos==7||pos==13){
            return [];
          }
          if(pos==2||pos==8||pos==14){
            return [pos-1];
          }
          if(pos==3||pos==9||pos==15){
            return [pos-1,pos-2];
          }

          return [pos-1,pos-2,pos-3];
        }
      case(RangeType.LONG_LINE):
        if(facingForward){
          if(pos==6||pos==11||pos==18){
            return [];
          }
          if(pos==5||pos==10||pos==17){
            return [pos+1];
          }
          if(pos==4||pos==9||pos==16){
            return [pos+1,pos+2];
          }
          if(pos==3||pos==8||pos==15){
            return [pos+1,pos+2,pos+3];
          }
          return [pos+1,pos+2,pos+3,pos+4];
        }else{
          if(pos==1||pos==7||pos==13){
            return [];
          }
          if(pos==2||pos==8||pos==14){
            return [pos-1];
          }
          if(pos==3||pos==9||pos==15){
            return [pos-1,pos-2];
          }
          if(pos==4||pos==10||pos==16){
            return [pos-1,pos-2,pos-3];
          }
          return [pos-1,pos-2,pos-3,pos-4];
        }
      default:
      return [];
    }

  }

  Color getTextColor(){
    switch(baseElement){
      case(BaseElement.DARKNESS):
        return Colors.white;
      case(BaseElement.NECRO):
        return Colors.green;
      case(BaseElement.SMOKE):
        return Colors.purpleAccent;
      default:return Colors.black;
    }
  }

  static Color getColorFromStatus(Status status){
    switch(status){
      case(Status.BURNING):
        return Palette.fire;
      case(Status.CORRODED):
        return Palette.acid;
      default: return Colors.black;
    }
  }

  Color getColorFromBaseElement(bool enoughMana){
    if(enoughMana){
      switch(baseElement){
        case(BaseElement.AIR):
          return Palette.air;
        case(BaseElement.WATER):
          return Palette.water;
        case(BaseElement.FIRE):
          return Palette.fire;
        case(BaseElement.EARTH):
          return Palette.earth;
        case(BaseElement.LIGHT):
          return Palette.light;
        case(BaseElement.ICE):
          return Palette.ice;
        case(BaseElement.ALCOHOL):
          return Palette.alcohol;
        case(BaseElement.PLANT):
          return Palette.plant;
        case(BaseElement.SPECTRAL):
          return Palette.spectral;
        case(BaseElement.STEAM):
          return Palette.steam;
        case(BaseElement.ELECTRICITY):
          return Palette.electricity;
        case(BaseElement.SAND):
          return Palette.sand;
        case(BaseElement.MUD):
          return Palette.mud;
        case(BaseElement.LAVA):
          return Palette.lava;
        case(BaseElement.CRYSTAL):
          return Palette.crsytal;
        case(BaseElement.GRAVITY):
          return Palette.gravity;
        case(BaseElement.PSY):
          return Palette.psy;
        case(BaseElement.TIME):
          return Palette.time;
        case(BaseElement.HOLY):
          return Palette.holy;
        case(BaseElement.PROPHANE):
          return Palette.prophane;
        case(BaseElement.FEY):
          return Palette.fey;
        case(BaseElement.CHI):
          return Palette.chi;
        case(BaseElement.ACID):
          return Palette.acid;
        case(BaseElement.MAGNETISM):
          return Palette.magnetism;
        case(BaseElement.NECRO):
          return Palette.necro;
        case(BaseElement.ARCANE):
          return Palette.arcane;
        case(BaseElement.PLASMA):
          return Palette.plasma;
        case(BaseElement.VENOM):
          return Palette.venom;
        case(BaseElement.METAL):
          return Palette.metal;
        case(BaseElement.ARTHROPOD):
          return Palette.arthropod;
        case(BaseElement.GLASS):
          return Palette.glass;
        case(BaseElement.SMOKE):
          return Palette.smoke;
        case(BaseElement.OIL):
          return Palette.oil;
        case(BaseElement.DARKNESS):
          return Palette.darkness;
        case(BaseElement.VIRUS):
          return Palette.virus;
        default:
          return Colors.transparent;
      }
    }else{
      return Colors.grey.shade900;
    }
  }
}