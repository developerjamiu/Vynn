import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'app_colors.dart';
part 'app_typography.dart';

abstract class AppTheme {
  static ThemeData defaultTheme = ThemeData(
    useMaterial3: true,
    textTheme: _Typography.light(),
    primaryTextTheme: _Typography.light(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorsLight.grey.shade100,
      ),
    ),
    extensions: <ThemeExtension>[
      _AppColorsLight(),
    ],
  );
}
