import 'package:bloc_pattern/src/shared/themes/app_color_scheme.dart';
import 'package:flutter/material.dart';

class HelloUserWidget extends StatelessWidget {
  const HelloUserWidget({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Hello,',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColorScheme.primaryThreeElementText,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          userName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColorScheme.primaryText,
          ),
        ),
      ],
    );
  }
}
