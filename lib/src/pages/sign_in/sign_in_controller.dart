import 'package:bloc_pattern/src/global.dart';
import 'package:bloc_pattern/src/shared/enums/EnumLoginType.dart';
import 'package:bloc_pattern/src/shared/models/entities.dart';
import 'package:bloc_pattern/src/shared/values/app_constants.dart';
import 'package:bloc_pattern/src/shared/widgets/notifications/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SignInController {
  Future<bool> handleSignIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = credential.user;

      if (user == null) {
        FlutterToast.toastInfo(
            msg: 'Usuário não encontrado. Verifique seu e-mail/senha');
        return false;
      }

      if (!user.emailVerified) {
        FlutterToast.toastInfo(
            msg: 'E-mail não verificado. Verifique-o e tente novamente');
        return false;
      }

      LoginRequestEntity loginRequestEntity = LoginRequestEntity(
        open_id: user.uid,
        name: user.displayName,
        email: user.email,
        avatar: user.photoURL,
        type: EnumLoginType.email.id,
      );

      Global.storageService
          .setString(AppConstants.STORAGE_USER_TOKEN_KEY, '12345678');
      FlutterToast.toastInfo(msg: 'Bem-vindo, ${user.displayName}');

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        FlutterToast.toastInfo(
            msg: 'Usuário não encontrado para essa conta de e-mail');
      } else if (e.code == 'wrong-password') {
        FlutterToast.toastInfo(
            msg: 'Informações inválidas. Verifique seu e-mail/senha');
      } else if (e.code == 'invalid-email') {
        FlutterToast.toastInfo(msg: 'Seu formato de e-mail é inválido');
      } else {
        FlutterToast.toastInfo(
            msg: 'Não foi possível realizar o login. Tente novamente');
      }
    } catch (e) {
      debugPrint('Erro genérico: ${e.toString()}');
    }

    return false;
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );

    //var result = await UserApi.login(loginRequestEntity);
  }
}
