
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorSchemeConfig {
  static final lightColorScheme =
  ColorScheme.fromSeed(seedColor: const Color(0xFF1D95C8)).copyWith(
    primaryContainer: const Color(0xFF1D95C8),
    brightness: Brightness.light,
    primary: const Color(0x6B1D3FC8),
    onPrimary: Colors.white,
    secondary: const Color(0x1B1D3FC8),
    onSecondary: Colors.white,
    background: CupertinoColors.systemGrey6,
    onBackground: Colors.black,
    error: Colors.red,
    inversePrimary: Colors.green,
    onInverseSurface: Colors.yellow,
    tertiary: Colors.grey,
    onTertiary: CupertinoColors.systemGrey5,
    surface: Colors.white,
    surfaceTint: Colors.transparent,
  );

  static final darkColorScheme =
  ColorScheme.fromSeed(seedColor: const Color(0xFF1D95C8)).copyWith(
    primaryContainer: const Color(0xFF1D95C8),
    brightness: Brightness.dark,
    primary: const Color(0xFF1D95C8),
    onPrimary: Colors.transparent,
    secondary: Colors.white,
    onSecondary: Colors.white,
    background: Colors.black45,
    onBackground: Colors.white,
    error: Colors.red,
    inversePrimary: Colors.green,
    onInverseSurface: Colors.yellow,
    tertiary: Colors.grey,
    onTertiary: CupertinoColors.systemGrey5,
    surface: Colors.white,
    surfaceTint: Colors.transparent,
  );
}
