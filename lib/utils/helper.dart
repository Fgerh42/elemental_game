


import 'package:flutter/material.dart';

class Helper {

  static Color darkenColor(Color color, {double amount = .1}) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  static Color lightenColor(Color color, {double? amount}) {

    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness((hsl.lightness + (amount??0.1)).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  static List<Image> getFrames(String frame_name, int frame_amount){
    int i = 1;
    List<Image> frames = [];
    while(i<=frame_amount){
      frames.add(Image.asset("assets/animations/${frame_name}_$i.png"));
      i++;
    }
    return frames;
  }

}