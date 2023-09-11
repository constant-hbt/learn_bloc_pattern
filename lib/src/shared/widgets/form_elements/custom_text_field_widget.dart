import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    this.obscureText = false,
    this.autoCorrect = false,
    this.hintText,
    this.contentPadding,
    this.fontSize = 15,
  });

  final bool obscureText;
  final bool autoCorrect;
  final String? hintText;
  final EdgeInsets? contentPadding;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      obscureText: obscureText,
      autocorrect: autoCorrect,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColorScheme.primarySecondaryElementText,
          fontFamily: "Avenir",
          fontWeight: FontWeight.normal,
          fontSize: fontSize,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
