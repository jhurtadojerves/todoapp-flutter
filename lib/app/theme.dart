import 'package:flutter/material.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xff0a7ea4),
    error: const Color(0xffef4444),
  ),
  scaffoldBackgroundColor: const Color(0xfff8fafc),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(minimumSize: const Size(48, 48)),
  ),
);
