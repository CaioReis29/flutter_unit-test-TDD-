import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test/app/screens/register_screen.dart';

void main() {
  group('testes do campo de e-mail', () {
    testWidgets(
      'deve confirmar que o campo de e-mail aparece corretamente na tela',
      (widgetTester) async {
        await widgetTester.pumpWidget(
          const MaterialApp(
            home: RegisterScreen(),
          ),
        );

        final emailKey = find.byKey(const Key('email_key'));

        expect(emailKey, findsOneWidget);
      },
    );
    testWidgets(
      'deve mostrar uma SnackBar com mensagem de erro caso e-mail seja inválido',
      (widgetTester) async {
        await widgetTester.pumpWidget(
          const MaterialApp(
            home: RegisterScreen(),
          ),
        );

        final registerButton = find.byKey(const Key('register_button_key'));
        await widgetTester.tap(registerButton);
        await widgetTester.pumpAndSettle();

        expect(find.text('E-mail é obrigatório'), findsOneWidget);
      },
    );
    testWidgets(
      'deve mostrar uma SnackBar com mensagem de erro caso e-mail esteja vazio',
      (widgetTester) async {
        await widgetTester.pumpWidget(
          const MaterialApp(
            home: RegisterScreen(),
          ),
        );

        final emailKey = find.byKey(const Key('email_key'));
        await widgetTester.tap(emailKey);
        await widgetTester.pumpAndSettle();

        await widgetTester.enterText(emailKey, '');
        await widgetTester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await widgetTester.tap(registerButton);
        await widgetTester.pumpAndSettle();

        expect(find.text('E-mail é obrigatório'), findsOneWidget);
      },
    );
    testWidgets(
      'deve mostrar uma SnackBar com mensagem de erro caso e-mail seja inválido',
      (widgetTester) async {
        await widgetTester.pumpWidget(
          const MaterialApp(
            home: RegisterScreen(),
          ),
        );

        final emailKey = find.byKey(const Key('email_key'));
        await widgetTester.tap(emailKey);
        await widgetTester.pumpAndSettle();

        await widgetTester.enterText(emailKey, 'caio');
        await widgetTester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await widgetTester.tap(registerButton);
        await widgetTester.pumpAndSettle();

        expect(find.text('e-mail inválido'), findsOneWidget);
      },
    );
    testWidgets(
      'não deve mostrar nenhuma mensagem de erro caso e-mail seja válido',
      (widgetTester) async {
        await widgetTester.pumpWidget(
          const MaterialApp(
            home: RegisterScreen(),
          ),
        );

        final emailKey = find.byKey(const Key('email_key'));
        await widgetTester.tap(emailKey);
        await widgetTester.pumpAndSettle();

        await widgetTester.enterText(emailKey, 'caio@gmail.com');
        await widgetTester.pumpAndSettle();

        final registerButton = find.byKey(const Key('register_button_key'));
        await widgetTester.tap(registerButton);
        await widgetTester.pumpAndSettle();

        expect(find.text('e-mail inválido'), findsNothing);
      },
    );
  });
  group(
    'testes do campo de senha',
    () {
      testWidgets(
        'deve confirmar que o campo de senha aparece na tela corretamente',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            const MaterialApp(
              home: RegisterScreen(),
            ),
          );

          final passwordKey = find.byKey(const Key('password_key'));

          expect(passwordKey, findsOneWidget);
        },
      );
      testWidgets(
        'deve abrir uma SnackBar caso a senha seja inválida',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            const MaterialApp(
              home: RegisterScreen(),
            ),
          );

          final emailKey = find.byKey(const Key('email_key'));
          await widgetTester.tap(emailKey);
          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(emailKey, 'caio@gmail.com');
          await widgetTester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await widgetTester.tap(registerButton);
          await widgetTester.pumpAndSettle();

          expect(find.text('a senha é obrigatória'), findsOneWidget);
        },
      );
      testWidgets(
        'deve abrir uma SnackBar caso a senha esteja vazia',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            const MaterialApp(
              home: RegisterScreen(),
            ),
          );

          final emailKey = find.byKey(const Key('email_key'));
          await widgetTester.tap(emailKey);
          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(emailKey, 'caio@gmail.com');
          await widgetTester.pumpAndSettle();

          final passwordKey = find.byKey(const Key('password_key'));
          await widgetTester.tap(passwordKey);
          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(passwordKey, '');
          await widgetTester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await widgetTester.tap(registerButton);
          await widgetTester.pumpAndSettle();

          expect(find.text('a senha é obrigatória'), findsOneWidget);
        },
      );
      testWidgets(
        'deve abrir uma SnackBar caso a senha possua menos que 6 caracteres',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            const MaterialApp(
              home: RegisterScreen(),
            ),
          );

          final emailKey = find.byKey(const Key('email_key'));
          await widgetTester.tap(emailKey);
          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(emailKey, 'caio@gmail.com');
          await widgetTester.pumpAndSettle();

          final passwordKey = find.byKey(const Key('password_key'));
          await widgetTester.tap(passwordKey);
          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(passwordKey, 'caio');
          await widgetTester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await widgetTester.tap(registerButton);
          await widgetTester.pumpAndSettle();

          expect(
            find.text('a senha precisa ter no mínimo 6 caracteres'),
            findsOneWidget,
          );
        },
      );
      testWidgets(
        'deve abrir uma SnackBar caso a senha não seja alfanumérica',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            const MaterialApp(
              home: RegisterScreen(),
            ),
          );

          final emailKey = find.byKey(const Key('email_key'));
          await widgetTester.tap(emailKey);
          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(emailKey, 'caio@gmail.com');
          await widgetTester.pumpAndSettle();

          final passwordKey = find.byKey(const Key('password_key'));
          await widgetTester.tap(passwordKey);
          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(passwordKey, 'caiosilva');
          await widgetTester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await widgetTester.tap(registerButton);
          await widgetTester.pumpAndSettle();

          expect(
            find.text('a senha precisa ser alfanumérica'),
            findsOneWidget,
          );
        },
      );
      testWidgets(
        'deve abrir uma SnackBar caso a senha não seja alfanumérica',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            const MaterialApp(
              home: RegisterScreen(),
            ),
          );

          final emailKey = find.byKey(const Key('email_key'));
          await widgetTester.tap(emailKey);
          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(emailKey, 'caio@gmail.com');
          await widgetTester.pumpAndSettle();

          final passwordKey = find.byKey(const Key('password_key'));
          await widgetTester.tap(passwordKey);
          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(passwordKey, 'caiosilva123');
          await widgetTester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await widgetTester.tap(registerButton);
          await widgetTester.pumpAndSettle();

          expect(
            find.text('a senha precisa ser alfanumérica'),
            findsNothing,
          );
        },
      );
    },
  );
  group(
    'teste para o botão de cadastro',
    () {
      testWidgets(
        'deve confirmar que o botão de cadastrar está aparecendo corretamente',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            const MaterialApp(
              home: RegisterScreen(),
            ),
          );

          final registerButtonKey =
              find.byKey(const Key('register_button_key'));

          expect(registerButtonKey, findsOneWidget);
        },
      );
      testWidgets(
        'deve confirmar que irá aparecer um SnackBar quando e-mail ou senha estão inválidos',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            const MaterialApp(
              home: RegisterScreen(),
            ),
          );

          final emailKey = find.byKey(const Key('email_key'));
          await widgetTester.tap(emailKey);
          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(emailKey, 'caio');
          await widgetTester.pumpAndSettle();

          final passwordKey = find.byKey(const Key('password_key'));
          await widgetTester.tap(passwordKey);
          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(passwordKey, 'caio');
          await widgetTester.pumpAndSettle();

          final registerButtonKey =
              find.byKey(const Key('register_button_key'));
          await widgetTester.tap(registerButtonKey);
          await widgetTester.pumpAndSettle();

          expect(
            find.byType(SnackBar),
            findsOneWidget,
          );
        },
      );
      testWidgets(
        'não deve aparecer nenhum SnackBar caso e-mail e senha sejam válidos',
        (widgetTester) async {
          await widgetTester.pumpWidget(
            const MaterialApp(
              home: RegisterScreen(),
            ),
          );

          final emailKey = find.byKey(const Key('email_key'));
          await widgetTester.tap(emailKey);
          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(emailKey, 'caio@gmail.com');
          await widgetTester.pumpAndSettle();

          final passwordKey = find.byKey(const Key('password_key'));
          await widgetTester.tap(passwordKey);
          await widgetTester.pumpAndSettle();

          await widgetTester.enterText(passwordKey, 'caiosilva123');
          await widgetTester.pumpAndSettle();

          final registerButtonKey =
              find.byKey(const Key('register_button_key'));
          await widgetTester.tap(registerButtonKey);
          await widgetTester.pumpAndSettle();

          expect(
            find.byType(SnackBar),
            findsNothing,
          );
        },
      );
    },
  );
}
