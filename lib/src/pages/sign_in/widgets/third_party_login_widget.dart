import 'package:bloc_pattern/src/pages/sign_in/widgets/third_party_login_button_widget.dart';
import 'package:flutter/material.dart';

class ThirdPartyLoginWidget extends StatelessWidget {
  const ThirdPartyLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 20,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ThirdPartyLoginButtonWidget(
              imagePath: 'assets/icons/google.png', func: () {}),
          ThirdPartyLoginButtonWidget(
              imagePath: 'assets/icons/apple.png', func: () {}),
          ThirdPartyLoginButtonWidget(
              imagePath: 'assets/icons/facebook.png', func: () {}),
        ],
      ),
    );
  }
}
