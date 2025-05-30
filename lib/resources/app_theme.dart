import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static final AppTheme _instance = AppTheme._();

  static AppTheme get instance => _instance;

  static  TextStyle titleText = TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'CormorantGaramond',
  );

  static TextStyle montserratText = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w300,
    fontFamily: 'Montserrat',
  );

  static TextStyle pacificoText = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.w500,
    color: AppColors.mainGreen,
    fontFamily: 'Pacifico',
  );

  static ElevatedButtonThemeData elevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.mainSand,
      textStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: 'Montserrat',
      ),
      foregroundColor: AppColors.scaffold,
    ),
  );

  static ThemeData themeData = ThemeData(
    textTheme: TextTheme(
      titleMedium: titleText,
      labelMedium: montserratText,
      bodyMedium: pacificoText,
    ),
    elevatedButtonTheme: elevatedButton,
  );
}
