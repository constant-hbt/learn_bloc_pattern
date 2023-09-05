import 'package:firebase_auth/firebase_auth.dart';

class SignInController {
  void handleSignIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user == null) {}

      if (!credential.user!.emailVerified) {}

      User? user = credential.user;
      if (user != null) {
      } else {}
    } catch (e) {}
  }
}
