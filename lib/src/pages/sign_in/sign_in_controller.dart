import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class SignInController {
  void handleSignIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user == null) {
        debugPrint('Usuário não encontrado');
      }

      if (!credential.user!.emailVerified) {
        debugPrint('Email não verificado');
      }

      User? user = credential.user;
      if (user != null) {
        debugPrint('Usuário credenciado');
      } else {
        debugPrint('Usuário não existe');
      }
    } on FirebaseAuthException catch (e) {
      debugPrint('Erro Firebase: ${e.message}');

      if (e.code == 'user-not-found') {
        debugPrint('user-not-found');
      } else if (e.code == 'wrong-password') {
        debugPrint('wrong-password');
      } else if (e.code == 'invalid-email') {
        debugPrint('invalid-email');
      }
    } catch (e) {
      debugPrint('Erro genérico: ${e.toString()}');
    }
  }
}
