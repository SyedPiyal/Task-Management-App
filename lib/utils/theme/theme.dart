

import 'package:flutter/material.dart';
import 'package:taskmanagment/utils/theme/text_theme.dart';

import 'color_scheme.dart';


class ThemeDataConfig {


  //------------------------------
  // Light Theme Data
  //------------------------------

  static final lightTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    textTheme: TextThemeConfig.lightTextTheme,
    colorScheme: ColorSchemeConfig.lightColorScheme,
    scaffoldBackgroundColor: ColorSchemeConfig.lightColorScheme.onPrimary,

  );



  //------------------------------
  // Dark Theme Data
  //------------------------------


  static final darkTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    textTheme: TextThemeConfig.darkTextThemeData,
    colorScheme: ColorSchemeConfig.darkColorScheme,
    scaffoldBackgroundColor: ColorSchemeConfig.darkColorScheme.background,

  );
}
