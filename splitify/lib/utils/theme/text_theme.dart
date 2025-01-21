import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
  );
}
