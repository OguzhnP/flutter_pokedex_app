import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constans {
  Constans._();

  static getTitleTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 46,
    );
  }

  static getPokemonNameTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
  }

  static getPokemonInfoTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 16,
    );
  }

  static getPokemonInfoLabelTextStyle() {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontSize: 20,
    );
  }

  static getPokemonTypeTextStyle() {
    return const TextStyle(color: Colors.white, fontSize: 16);
  }

// static _calculateFontSize(int fontSize) {
//  if (ScreenUtil().orientation == Orientation.portrait) {
//    return fontSize.sp;
//  } else {
//     return (fontSize * 1.35).sp;
//  }
// }
}
