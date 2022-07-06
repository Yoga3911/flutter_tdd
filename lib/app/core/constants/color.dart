import 'package:flutter/material.dart';

class MyColor {
  MyColor._();

  static final ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: red,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: red,
    ),
  );

  static const Color red = Color(0xFFE83D3D);
  static const Color black = Color(0xFF242424);
}
