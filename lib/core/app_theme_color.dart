import 'package:flutter/material.dart';

class ThemeColor {
  static const MaterialColor primaryColor = MaterialColor(
    0xff37da8b, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff37da8b), //10%
      100: Color(0xff37da8b), //20%
      200: Color(0xff37da8b), //30%
      300: Color(0xff37da8b), //40%
      400: Color(0xff37da8b), //50%
      500: Color(0xff37da8b), //60%
      600: Color(0xff37da8b), //70%
      700: Color(0xff37da8b), //80%
      800: Color(0xff37da8b), //90%
      900: Color(0xff37da8b), //100%
    },
  );
}
