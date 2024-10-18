import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    primaryColor: Colors.deepPurple,
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: Colors.deepPurple,
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
