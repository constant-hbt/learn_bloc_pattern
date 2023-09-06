import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:flutter/material.dart';

class CustomWidgets {
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
