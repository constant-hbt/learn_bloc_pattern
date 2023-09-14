import 'package:flutter/material.dart';

class OpaqueTextMarginWidget extends StatelessWidget {
  const OpaqueTextMarginWidget(
    this.text, {
    super.key,
    this.color,
    this.margin = const EdgeInsets.only(bottom: 5),
    this.fontWeight = FontWeight.normal,
    this.fontSize = 14,
  });

  final String text;
  final EdgeInsets margin;
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Text(
        text,
        style: TextStyle(
          color: color ?? Colors.grey.withOpacity(0.8),
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
