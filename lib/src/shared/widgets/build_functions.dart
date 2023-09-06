import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:flutter/material.dart';

class BuildFunctions {
  static AppBar buildAppBar(String title) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: AppColorScheme.primaryText),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: AppColorScheme.primarySecondaryBackground,
        ),
      ),
    );
  }

  static Widget reusableText(String text) => Container(
        margin: const EdgeInsets.only(
          bottom: 5,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.grey.withOpacity(0.8),
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
      );
}
