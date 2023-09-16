import 'package:bloc_pattern/src/shared/widgets/notifications/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class RegisterController {
  Future<bool> handleRegister({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        const String photoUrl = 'uploads/default-avatar.png';

        await credential.user?.updatePhotoURL(photoUrl);
        FlutterToast.toastInfo(
            msg:
                'Um e-mail de ativação de conta foi enviado para o seu endereço de e-mail cadastrado, cheque sua caixa de entrada.');
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        FlutterToast.toastInfo(msg: 'A senha informada é muito fraca');
      } else if (e.code == 'email-already-in-use') {
        FlutterToast.toastInfo(
            msg: 'O e-mail informado já está sendo utilizado');
      } else if (e.code == 'invalid-email') {
        FlutterToast.toastInfo(
            msg: 'O e-mail informado está em um formato inválido');
      } else {
        FlutterToast.toastInfo(
            msg: 'Não foi possível realizar o login. Tente novamente');
      }
    } catch (e) {
      debugPrint('Erro genérico: ${e.toString()}');
    }

    return false;
  }
}
