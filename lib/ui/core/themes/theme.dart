import 'package:flutter/material.dart';

class LinkupTheme {
  static var lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
  );

  static var darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: Colors.deepPurple,
      secondary: Colors.purpleAccent,
    ),
  );
}
