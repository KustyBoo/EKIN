// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

ColorScheme colorMode = ColorScheme.fromSeed(
  seedColor: Color(0xFFA8E25C),
  primary: Color(0xFFA8E25C),
  onPrimary: Colors.white,
  primaryContainer: Colors.transparent,
  onPrimaryContainer: Colors.white,
);

TextTheme teksMode = TextTheme(
  // styling headline intro
  headlineLarge: TextStyle(
    fontSize: 36,
    fontFamily: "Oddval",
    color: colorMode.onPrimaryContainer, // warna putih
  ),

  // styling caption headline intro
  headlineMedium: TextStyle(
    fontSize: 16.5,
    height: 1.5,
    fontFamily: "dity",
    color: colorMode.onPrimaryContainer.withOpacity(0.8), // warna putih
  ),
  //
);

ElevatedButtonThemeData btnMode = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0.7,
    backgroundColor: Color(0xFFA8E25C),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6),
    ),
    textStyle: TextStyle(
      fontSize: 26,
      fontFamily: "dity",
      color: colorMode.onPrimaryContainer,
    ),
  ),
);
