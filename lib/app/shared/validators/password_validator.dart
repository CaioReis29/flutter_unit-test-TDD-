class PasswordValidator {
  String? validate({String? password}) {
    if (password == null || password.isEmpty) {
      return 'a senha é obrigatória';
    }
    if (password.length < 6) {
      return 'a senha precisa ter no mínimo 6 caracteres';
    }

    final alphanumericRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9]).+$');

    if (!alphanumericRegex.hasMatch(password)) {
      return 'a senha precisa ser alfanumérica';
    }
    return null;
  }
}
