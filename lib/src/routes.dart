import 'package:bloc_pattern/src/pages/pages.dart';
import 'package:flutter/material.dart';

class Routes {
  static const welcome = '/welcome';
  static const signIn = '/sign-in';

  static Map<String, Widget Function(BuildContext context)> routes(
          BuildContext context) =>
      {
        welcome: (context) => const WelcomePage(),
        signIn: (context) => const SignInPage(),
      };
}
