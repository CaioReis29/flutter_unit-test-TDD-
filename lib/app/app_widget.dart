import 'package:flutter/material.dart';
import 'package:flutter_unit_test/app/screens/register_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testes Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 9, 149, 230)),
        useMaterial3: true,
      ),
      home: const RegisterScreen(),
    );
  }
}
