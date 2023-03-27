import 'package:flutter/material.dart';

class MoviesTheme {
  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    fontFamily: 'NotoSans',
    textTheme: MoviesTextTheme().regular,
  );
}

class MoviesTextTheme {
  TextTheme regular = const TextTheme(
    displayLarge: TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.bold,
      color: Colors.white70,
    ),
    titleLarge: TextStyle(
      fontSize: 22.0,
      color: Colors.white70,
    ),
    titleMedium: TextStyle(
      fontSize: 20.0,
      color: Colors.white70,
    ),
    titleSmall: TextStyle(
      fontSize: 16.0,
      color: Colors.white70,
    ),
    bodyLarge: TextStyle(
      fontSize: 18.0,
      height: 2.0,
      color: Colors.white70,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0,
      height: 1.5,
      color: Colors.white70,
    ),
    bodySmall: TextStyle(
      fontSize: 14.0,
      height: 1.5,
      color: Colors.white70,
    ),
  );
}
