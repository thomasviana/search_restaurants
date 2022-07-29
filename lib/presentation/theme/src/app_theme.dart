import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static const ColorScheme _colorSchemeLight = ColorScheme.light(
    background: AppColors.greyBackground,
    primary: AppColors.primaryColor,
    primaryContainer: AppColors.primaryVariant,
    secondary: AppColors.secundaryColor,
    secondaryContainer: AppColors.secundaryVariant,
  );

  static const ColorScheme _colorSchemeDark = ColorScheme.light(
    background: AppColors.black,
    primary: AppColors.primaryColor,
    primaryContainer: AppColors.primaryVariant,
    secondary: AppColors.secundaryColor,
    secondaryContainer: AppColors.secundaryVariant,
  );

  static ThemeData get light => ThemeData.light().copyWith(
        colorScheme: _colorSchemeLight,
      );

  static ThemeData get dark => ThemeData.dark().copyWith(
        colorScheme: _colorSchemeDark,
      );
}
