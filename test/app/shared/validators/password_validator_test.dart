import 'package:flutter_test/flutter_test.dart';

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

void main() {
  late PasswordValidator passwordValidator;

  setUp(() => passwordValidator = PasswordValidator());

  group(
    'validação da senha',
    () {
      test('deve retornar uma mensagem de erro caso a senha seja nula(null)',
          () {
        final result = passwordValidator.validate();

        expect(result, equals('a senha é obrigatória'));
      });
      test('deve retornar uma mensagem de erro caso a senha esteja vazia', () {
        final result = passwordValidator.validate(password: '');

        expect(result, equals('a senha é obrigatória'));
      });
      test(
          'deve retornar uma mensagem de erro caso a senha seja menor que 6 caracteres',
          () {
        final result = passwordValidator.validate(password: 'caio');

        expect(result, equals('a senha precisa ter no mínimo 6 caracteres'));
      });
      test(
          'deve retornar uma mensagem de erro caso a senha não seja alfanumérica',
          () {
        final result = passwordValidator.validate(password: 'caiosilva');

        expect(result, equals('a senha precisa ser alfanumérica'));
      });
      test('deve retornar null caso a senha seja válida', () {
        final result = passwordValidator.validate(password: 'caio123');

        expect(result, isNull);
      });
    },
  );
}
