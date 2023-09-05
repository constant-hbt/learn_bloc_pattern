import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static get lightTheme => ThemeData.light().copyWith(
      colorScheme: AppColorScheme.lightColorScheme,
      appBarTheme: AppBarTheme(
        color: AppColorScheme.lightColorScheme.background,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          elevation: 1,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColorScheme.primaryBackground,
          foregroundColor: AppColorScheme.primaryText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          side: const BorderSide(
              width: 1.0, color: AppColorScheme.primaryFourElementText),
          elevation: 0,
        ),
      ));
}
