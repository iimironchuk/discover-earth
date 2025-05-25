import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static final AppTheme _instance = AppTheme._();

  static AppTheme get instance => _instance;

  static const TextStyle titleText = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'CormorantGaramond'
  );

  static TextStyle montserratText = TextStyle(
    fontWeight: FontWeight.w400,
      fontFamily: 'Montserrat'
  );

  static TextStyle pacificoText = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Pacifico'
  );


  static ThemeData themeData = ThemeData(
    textTheme: TextTheme(
      titleMedium: titleText,
      labelMedium: montserratText,
      bodyMedium: pacificoText,
    ),
  );
}
