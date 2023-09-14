import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:bloc_pattern/src/shared/widgets/shared_widgets.dart';
import 'package:flutter/material.dart';

class HelloUserWidget extends StatelessWidget {
  const HelloUserWidget({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BaseTextWidget(
          'Hello,',
          fontSize: 24,
          color: AppColorScheme.primaryThreeElementText,
        ),
        const SizedBox(
          height: 5,
        ),
        BaseTextWidget(
          userName,
          fontSize: 24,
        ),
      ],
    );
  }
}
