import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:flutter/material.dart';

class CustomWidgets {
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

  static Widget forgotPassword(BuildContext context, Function func) =>
      Container(
        margin: const EdgeInsets.only(
          bottom: 5,
        ),
        child: GestureDetector(
          onTap: () => func,
          child: Text(
            'Forgot Password',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppColorScheme.primaryText,
              fontWeight: FontWeight.normal,
              fontSize: 12,
              decoration: TextDecoration.underline,
              decorationColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      );
}
