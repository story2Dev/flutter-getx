import 'package:flutter/material.dart';

import 'app_theme_color.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    primaryColor: ThemeColor.primaryColor,
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: ThemeColor.primaryColor,
      brightness: Brightness.dark,
    ),
  );

  static final lightTheme = ThemeData(
    primaryColor: Colors.deepPurple,
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  );
}
