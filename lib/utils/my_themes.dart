import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF5B5B5B),
    primaryColor: const Color(0xFF85538A),
    primaryColorDark: const Color(0xFFF7F7F7),
    cardColor: const Color(0xFFAF92C1),
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(color: Colors.white),
  );


  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF8F7F6),
    primaryColorDark: Colors.black,
    primaryColor: const Color(0xFFCBCBCB),
    cardColor: const Color(0xFFE1E4D2),
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Color(0xFF68BBE3)),
  );
}
