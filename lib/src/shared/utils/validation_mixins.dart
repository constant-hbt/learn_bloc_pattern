mixin ValidationMixins {
  String? emailValidation(
      {required String? email,
      String? errorMsgEmpty,
      String? errorMsgFormato}) {
    String? erro;
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

    if (email == null || email.isEmpty) {
      erro = errorMsgEmpty ?? 'Informe o e-mail';
    } else if (!emailRegex.hasMatch(email)) {
      erro = errorMsgFormato ?? 'Verifique o e-mail e tente novamente';
    }

    return erro;
  }

  String? passwordValidation({
    required String? password,
    String? errorMsgEmpty,
    String? errorMsgFormato,
  }) {
    if (password == null || password.isEmpty) {
      return errorMsgEmpty ?? 'Informe a senha';
    }

    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }

    return null;
  }
}
