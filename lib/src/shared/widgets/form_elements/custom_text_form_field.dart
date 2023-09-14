import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:bloc_pattern/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.textType,
    this.icon,
    this.labelText,
    this.validator,
    this.hintText,
    this.obscureText = false,
    this.onChange,
    this.controller,
    this.contentPadding,
  });

  final String? labelText;
  final TextInputType textType;
  final String? hintText;
  final IconData? icon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Function? onChange;
  final TextEditingController? controller;
  final EdgeInsets? contentPadding;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  final _textFormFieldKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null && widget.labelText!.isNotEmpty)
            OpaqueTextMarginWidget(
              widget.labelText!,
              margin: const EdgeInsets.only(bottom: 10),
            ),
          TextFormField(
            key: _textFormFieldKey,
            controller: widget.controller,
            autocorrect: false,
            keyboardType: widget.textType,
            obscureText: _obscureText,
            onChanged: (value) {
              if (_textFormFieldKey.currentState != null &&
                  _textFormFieldKey.currentState!.hasError &&
                  value.isNotEmpty) {
                widget.onChange!();
              }
            },
            validator: widget.validator,
            style: const TextStyle(
              color: AppColorScheme.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
            decoration: InputDecoration(
              contentPadding: widget.contentPadding,
              prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
              suffixIcon: widget.obscureText
                  ? IconButton(
                      icon: Icon(_obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: AppColorScheme.primarySecondaryElementText,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                      color: AppColorScheme.primaryFourElementText)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                      color: AppColorScheme.primaryFourElementText)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                      color: AppColorScheme.primaryFourElementText)),
            ),
          ),
        ],
      ),
    );
  }
}
