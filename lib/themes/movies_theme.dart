import 'package:flutter/material.dart';

class MoviesTheme {
  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black38,
    fontFamily: 'NotoSans',
    textTheme: MoviesTextTheme().regular,
  );

class MoviesTextTheme {
  TextTheme regular = const TextTheme(
    displayLarge: TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 22.0,
    ),
    titleMedium: TextStyle(
      fontSize: 20.0,
    ),
    titleSmall: TextStyle(
      fontSize: 16.0,
    ),
    bodyLarge: TextStyle(
      fontSize: 14.0,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 12.0,
      height: 1.5,
    ),
    bodySmall: TextStyle(
      fontSize: 10.0,
      height: 1.5,
    ),
  );
}
