import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF202323),
    primaryColor: const Color(0xFF4B8282),
    cardColor: const Color(0xFF519F9F),
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        fontSize: 14.0,
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        fontSize: 10.0,
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: const ColorScheme.dark(),
    iconTheme: const IconThemeData(color: Color.fromARGB(255, 111, 192, 192)),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF8F7F6),
    primaryColor: const Color(0xFFD9D9D9),
    cardColor: const Color(0xFFFFCA42),
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        fontSize: 14.0,
        color: Color(0xFF000000),
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        fontSize: 10.0,
        color: Color(0xFF000000),
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Color(0xFFFFCA42)),
  );
}
