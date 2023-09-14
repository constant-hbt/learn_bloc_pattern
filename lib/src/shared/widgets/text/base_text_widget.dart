import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:flutter/widgets.dart';

class BaseTextWidget extends StatelessWidget {
  const BaseTextWidget(
    this.text, {
    super.key,
    this.color = AppColorScheme.primaryText,
    this.fontWeight = FontWeight.bold,
    this.fontSize = 16,
    this.maxLines = 1,
    this.textOverflow = TextOverflow.clip,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.decorationColor,
    this.margin,
  });

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final TextOverflow textOverflow;
  final TextAlign textAlign;
  final EdgeInsets? margin;
  final TextDecoration textDecoration;
  final Color? decorationColor;

  @override
  Widget build(BuildContext context) {
    final Widget textWidget = Text(
      text,
      maxLines: maxLines,
      overflow: textOverflow,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: textDecoration,
        decorationColor: decorationColor,
      ),
    );

    if (margin != null) {
      return Container(
        margin: margin,
        child: textWidget,
      );
    }

    return textWidget;
  }
}
