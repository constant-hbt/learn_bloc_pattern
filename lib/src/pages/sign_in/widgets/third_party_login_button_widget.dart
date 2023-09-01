import 'package:flutter/material.dart';

class ThirdPartyLoginButtonWidget extends StatelessWidget {
  const ThirdPartyLoginButtonWidget({
    super.key,
    required this.imagePath,
    required this.func,
  });

  final String imagePath;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => func,
      customBorder: const CircleBorder(),
      child: SizedBox(
        width: 40,
        height: 40,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
