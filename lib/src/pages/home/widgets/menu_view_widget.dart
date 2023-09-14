import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:bloc_pattern/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

class MenuViewWidget extends StatelessWidget {
  const MenuViewWidget({super.key});

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
      child: BaseTextWidget(
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
            const Expanded(
              child: BaseTextWidget('Choose your course'),
            ),
            GestureDetector(
              onTap: () {},
              child: const BaseTextWidget(
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
