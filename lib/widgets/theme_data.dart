// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// tema color
ColorScheme colorMode = ColorScheme.fromSeed(
  seedColor: Color(0xFFA8E25C),
  primary: Color(0xFFA8E25C),
  onPrimary: Colors.white,
  primaryContainer: Colors.transparent,
  onPrimaryContainer: Colors.white,
);

// tema teks
TextTheme teksMode = TextTheme(
  headlineLarge: TextStyle(
    fontSize: 36,
    fontFamily: "Oddval",
    color: colorMode.onPrimaryContainer, // warna putih
  ),
  headlineMedium: TextStyle(
    fontSize: 32,
    fontFamily: "Oddval",
    color: colorMode.onPrimaryContainer, // warna putih
  ),
  headlineSmall: TextStyle(
    fontSize: 16.5,
    height: 1.5,
    fontFamily: "dity",
    color: colorMode.onPrimaryContainer.withOpacity(0.8), // warna putih
  ),
  bodyLarge: TextStyle(
    fontSize: 20,
    fontFamily: "dity",
    letterSpacing: 2,
    color: colorMode.onPrimaryContainer.withOpacity(0.8),
  ),
  bodyMedium: TextStyle(
    fontSize: 16,
    fontFamily: "dity",
    letterSpacing: 2,
    color: colorMode.onPrimaryContainer.withOpacity(0.8),
  ),
  bodySmall: TextStyle(
    fontSize: 14,
    fontFamily: "dity",
    letterSpacing: 2,
    color: colorMode.primary,
  ),
  displayLarge: TextStyle(
    fontSize: 16,
    fontFamily: "Oddval",
    color: colorMode.onPrimary,
  ),
  displayMedium: TextStyle(
    fontSize: 12,
    fontFamily: "dity",
    color: colorMode.onPrimary,
    fontWeight: FontWeight.normal,
  ),
  displaySmall: TextStyle(
    fontSize: 8,
    fontFamily: "dity",
    color: colorMode.onPrimary,
  ),
  labelLarge: TextStyle(
    fontSize: 16,
    fontFamily: "dity",
    color: colorMode.onPrimary,
  ),
  labelMedium: TextStyle(
    fontSize: 14,
    fontFamily: "dity",
    color: colorMode.onPrimary,
  ),
  labelSmall: TextStyle(
    fontSize: 12,
    fontFamily: "dity",
    color: colorMode.onPrimary.withOpacity(0.5),
  ),
  titleLarge: TextStyle(
    fontSize: 18,
    fontFamily: "Oddval",
    color: colorMode.onPrimary,
  ),
  titleMedium: TextStyle(
    fontSize: 14,
    fontFamily: "Oddval",
    color: colorMode.onPrimary,
  ),
);

IconThemeData iconMode = IconThemeData(
  color: colorMode.onPrimary,
);

// tema elevated button
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
