import 'package:bloc_pattern/src/shared/themes/color_scheme.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static get lightTheme => ThemeData.light().copyWith(
        colorScheme: CustomColorScheme.lightColorScheme,
        appBarTheme: AppBarTheme(
          color: CustomColorScheme.lightColorScheme.background,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          centerTitle: true,
          elevation: 0,
        ),
      );
}
