import 'package:flutter/material.dart';
import 'package:splitify/const/colors.dart';
import 'package:splitify/utils/theme/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: TColors.secondaryColor,
    scaffoldBackgroundColor: TColors.tertiaryColor,
    textTheme: TTextTheme.lightTextTheme,
  );
}
