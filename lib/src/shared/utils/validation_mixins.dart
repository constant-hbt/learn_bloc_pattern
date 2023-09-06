mixin ValidationMixins {
  static const int _minimunAmountCharsForPassword = 6;

  String? notEmpty(String? value, {String? emptyMsgError}) {
    if (value == null || value.trim().isEmpty) {
      return emptyMsgError ?? 'Informe o valor';
    }
    return null;
  }

  String? minimumTextLenght(
    String? text,
    int minimumLenght, {
    String? msgError,
  }) {
    if (text == null || text.isEmpty || text.trim().length < minimumLenght) {
      return msgError ??
          'O texto deve possuir no mínimo $minimumLenght caracteres';
    }
    return null;
  }

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
    int? minimunAmountChars,
    String? errorMsgMinimunAmountChars,
    bool isConfirmPassword = false,
  }) {
    minimunAmountChars = minimunAmountChars ?? _minimunAmountCharsForPassword;
    final senhaText = isConfirmPassword ? 'senha de confirmação' : 'senha';

    if (password == null || password.isEmpty) {
      return errorMsgEmpty ?? 'Informe a $senhaText';
    } else if (password.trim().length < minimunAmountChars) {
      return errorMsgMinimunAmountChars ??
          'A $senhaText deve possuir no mínimo $minimunAmountChars caracteres';
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
