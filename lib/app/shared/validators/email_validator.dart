class EmailValidator {
  String? validate({String? email}) {
    if (email == null || email.isEmpty) {
      return 'E-mail é obrigatório';
    }

    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

    if (!emailRegex.hasMatch(email)) {
      return 'e-mail inválido';
    }
    return null;
  }
}
