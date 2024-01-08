import 'package:flutter_test/flutter_test.dart';

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

void main() {
  late EmailValidator emailValidator;

  setUp(() => emailValidator = EmailValidator());
  group(
    'validação de e-mail',
    () {
      test(
        'ele deve retornar uma mensagem de erro caso o e-mail seja nulo(null)',
        () {
          final result = emailValidator.validate();
          expect(result, equals('E-mail é obrigatório'));
        },
      );
      test(
        'ele deve retornar uma mensagem de erro caso o e-mail esteja vazio',
        () {
          final result = emailValidator.validate(email: '');
          expect(result, equals('E-mail é obrigatório'));
        },
      );
      test(
        'ele deve retornar uma mensagem de erro caso o e-mail seja inválido',
        () {
          final result = emailValidator.validate(email: 'caio');
          expect(result, equals('e-mail inválido'));
        },
      );
      test(
        'ele deve retornar null caso o e-mail seja válido',
        () {
          final result = emailValidator.validate(email: 'caio@gmail.com');
          expect(result, isNull);
        },
      );
    },
  );
}
