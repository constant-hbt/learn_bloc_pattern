import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:bloc_pattern/src/shared/widgets/form_elements/custom_text_field_widget.dart';
import 'package:flutter/material.dart';

class CustomOutlinedTextFieldWidget extends StatelessWidget {
  const CustomOutlinedTextFieldWidget(
      {super.key,
      this.obscureText = false,
      this.autoCorrect = false,
      this.hintText,
      this.height = 40,
      this.borderRadius = 16,
      this.icon});

  final bool obscureText;
  final bool autoCorrect;
  final String? hintText;
  final double height;
  final double borderRadius;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final EdgeInsets containerPadding = icon != null
        ? const EdgeInsets.only(right: 16)
        : const EdgeInsets.symmetric(horizontal: 16);

    return Container(
      padding: containerPadding,
      height: height,
      decoration: BoxDecoration(
        color: AppColorScheme.primaryBackground,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: AppColorScheme.primaryFourElementText),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (icon != null)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              width: 16,
              height: 16,
              child: icon,
            ),
          Expanded(
            child: CustomTextFieldWidget(
              hintText: hintText,
              obscureText: obscureText,
              autoCorrect: autoCorrect,
              contentPadding: const EdgeInsets.all(0),
            ),
          ),
        ],
      ),
    );
  }
}
