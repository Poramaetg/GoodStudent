import 'package:flutter/material.dart';

class MyConstant {
//filed
  static Color dark = const Color.fromARGB(255, 0, 0, 0);
  static Color primary = const Color.fromARGB(255, 175, 2, 2);
  static Color light = const Color.fromARGB(255, 255, 101, 101);
  static Color active = const Color.fromARGB(255, 255, 77, 1);

//metthod
  TextStyle h1Style() => TextStyle(
        fontSize: 36,
        color: dark,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.w700,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );

  TextStyle h3ActiveStyle() => TextStyle(
        fontSize: 16,
        color: active,
        fontWeight: FontWeight.w500,
      );
}
