import 'package:bloc_pattern/src/shared/themes/color_scheme.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static get lightTheme => ThemeData.light().copyWith(
        colorScheme: CustomColorScheme.lightColorScheme,
      );
}
