import 'package:flutter/material.dart';

class AppTheme {
  // LIGHT MODE
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      elevation: 0
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(fontSize: 16), 
    )
  );
  // DARK MODE
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(fontSize: 16),
    ),
  );
}
