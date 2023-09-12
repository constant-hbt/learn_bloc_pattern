import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:flutter/material.dart';

class MenuViewWidget extends StatelessWidget {
  const MenuViewWidget({super.key});

  Widget _reusableMenuText(
    String text, {
    Color color = AppColorScheme.primaryText,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.clip,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }

  Widget _reusableMenuTab(String title, {bool isSelected = false}) {
    final Color backgroundColor = isSelected
        ? AppColorScheme.primaryElement
        : AppColorScheme.primaryBackground;
    final Color titleColor = isSelected
        ? AppColorScheme.primaryElementText
        : AppColorScheme.primaryThreeElementText;
    final FontWeight fontWeight =
        isSelected ? FontWeight.normal : FontWeight.bold;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: isSelected
            ? Border.all(color: AppColorScheme.primaryElement)
            : null,
      ),
      child: _reusableMenuText(
        title,
        color: titleColor,
        fontWeight: fontWeight,
        fontSize: 12,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: _reusableMenuText('Choose your course'),
            ),
            GestureDetector(
              onTap: () {},
              child: _reusableMenuText(
                'See all',
                color: AppColorScheme.primaryThreeElementText,
                fontSize: 12,
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 16),
          child: Row(
            children: [
              _reusableMenuTab('All', isSelected: true),
              _reusableMenuTab('Popular'),
              _reusableMenuTab('Newest'),
            ],
          ),
        ),
      ],
    );
  }
}
