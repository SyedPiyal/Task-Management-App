

import 'package:flutter/material.dart';
import 'package:taskmanagment/utils/theme/color_scheme.dart';



class TextThemeConfig {
  //--------------------> Light Text Theme <---------------------//
  static final lightTextTheme = TextTheme(
    /*--------------------> headline <---------------------*/
    headlineLarge: const TextStyle().copyWith(
      color: ColorSchemeConfig.lightColorScheme.onBackground,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: "NotoSerif",
    ),
    headlineMedium: const TextStyle().copyWith(
      color: ColorSchemeConfig.lightColorScheme.onBackground,
      fontSize: 18,
      fontWeight: FontWeight.normal,
      fontFamily: "NotoSerif",
    ),
    headlineSmall: const TextStyle().copyWith(
      color: ColorSchemeConfig.lightColorScheme.onBackground,
      fontSize: 16,
      fontWeight: FontWeight.w900,
      fontFamily: "NotoSerif",
    ),
    /*--------------------> title <---------------------*/
    titleLarge: const TextStyle().copyWith(
      color: ColorSchemeConfig.lightColorScheme.onBackground,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: "NotoSerif",
    ),
    titleMedium: const TextStyle().copyWith(
      color: ColorSchemeConfig.lightColorScheme.onBackground,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: "NotoSerif",
    ),
    titleSmall: const TextStyle().copyWith(
      color: ColorSchemeConfig.lightColorScheme.onBackground,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: "NotoSerif",
    ),
    /*--------------------> body <---------------------*/
    bodyLarge: const TextStyle().copyWith(
      color: ColorSchemeConfig.lightColorScheme.onBackground,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: "NotoSerif",
    ),
    bodyMedium: const TextStyle().copyWith(
      color: ColorSchemeConfig.lightColorScheme.onBackground,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: "NotoSerif",
    ),
    bodySmall: const TextStyle().copyWith(
      color: ColorSchemeConfig.lightColorScheme.onBackground,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: "NotoSerif",
    ),
    /*--------------------> label <---------------------*/
    labelLarge: const TextStyle().copyWith(
      color: ColorSchemeConfig.lightColorScheme.onBackground,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: "NotoSerif",
    ),
    labelMedium: const TextStyle().copyWith(
      color: ColorSchemeConfig.lightColorScheme.onBackground,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      fontFamily: "NotoSerif",
    ),
    labelSmall: const TextStyle().copyWith(
      color: ColorSchemeConfig.lightColorScheme.onBackground,
      fontSize: 8,
      fontWeight: FontWeight.w500,
      fontFamily: "NotoSerif",
    ),
  );

  //--------------------> Dark Text Theme <---------------------//
  static final darkTextThemeData = TextTheme(
    /*--------------------> headline <---------------------*/
    headlineLarge: const TextStyle().copyWith(
      color: ColorSchemeConfig.darkColorScheme.onSecondary,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontFamily: "NotoSerif",
    ),
    headlineMedium: const TextStyle().copyWith(
      color: ColorSchemeConfig.darkColorScheme.onSecondary,
      fontSize: 18,
      fontWeight: FontWeight.normal,
      fontFamily: "NotoSerif",
    ),
    headlineSmall: const TextStyle().copyWith(
      color: ColorSchemeConfig.darkColorScheme.onSecondary,
      fontSize: 16,
      fontWeight: FontWeight.w900,
      fontFamily: "NotoSerif",
    ),
    /*--------------------> title <---------------------*/
    titleLarge: const TextStyle().copyWith(
      color: ColorSchemeConfig.darkColorScheme.onSecondary,
      fontSize: 16,
      fontWeight: FontWeight.w700,
      fontFamily: "NotoSerif",
    ),
    titleMedium: const TextStyle().copyWith(
      color: ColorSchemeConfig.darkColorScheme.onSecondary,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      fontFamily: "NotoSerif",
    ),
    titleSmall: const TextStyle().copyWith(
      color: ColorSchemeConfig.darkColorScheme.onSecondary,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: "NotoSerif",
    ),
    /*--------------------> body <---------------------*/
    bodyLarge: const TextStyle().copyWith(
      color: ColorSchemeConfig.darkColorScheme.onSecondary,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: "NotoSerif",
    ),
    bodyMedium: const TextStyle().copyWith(
      color: ColorSchemeConfig.darkColorScheme.onSecondary,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: "NotoSerif",
    ),
    bodySmall: const TextStyle().copyWith(
      color: ColorSchemeConfig.darkColorScheme.onSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: "NotoSerif",
    ),
    /*--------------------> label <---------------------*/
    labelLarge: const TextStyle().copyWith(
      color: ColorSchemeConfig.darkColorScheme.onSecondary,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: "NotoSerif",
    ),
    labelMedium: const TextStyle().copyWith(
      color: ColorSchemeConfig.darkColorScheme.onSecondary,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      fontFamily: "NotoSerif",
    ),
    labelSmall: const TextStyle().copyWith(
      color: ColorSchemeConfig.darkColorScheme.onSecondary,
      fontSize: 8,
      fontWeight: FontWeight.w500,
      fontFamily: "NotoSerif",
    ),
  );
}
