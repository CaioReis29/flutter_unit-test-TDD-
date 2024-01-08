import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test/app/shared/auth/auth_service.dart';

void main() {
  late AuthService auth;

  setUp(() => auth = AuthService());
  group(
    'validação de cadastro',
    () {
      test('deve retornar uma mensagem para e-mail e/ou senha inválidos', () {
        final result = auth.register(
          email: 'caio',
          password: '123',
        );

        expect(result, isA<String>());
      });
      test('deve retornar null caso e-mail e senha sejam válidos', () {
        final result = auth.register(
          email: 'caio@gmail.com',
          password: 'caio123',
        );

        expect(result, isNull);
      });
    },
  );
}
