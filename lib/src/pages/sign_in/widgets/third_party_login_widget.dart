import 'package:flutter/material.dart';

class ThirdPartyLoginWidget extends StatelessWidget {
  const ThirdPartyLoginWidget({super.key});

  Widget _buildThirdPartyLoginButton({
    required String imagePath,
    required Function func,
  }) {
    return GestureDetector(
      onTap: () => func,
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32,
        bottom: 24,
        left: 32,
        right: 32,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildThirdPartyLoginButton(
              imagePath: 'assets/icons/google.png', func: () {}),
          _buildThirdPartyLoginButton(
              imagePath: 'assets/icons/apple.png', func: () {}),
          _buildThirdPartyLoginButton(
              imagePath: 'assets/icons/facebook.png', func: () {}),
        ],
      ),
    );
  }
}
