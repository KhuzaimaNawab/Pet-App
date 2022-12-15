import 'package:flutter/material.dart';
import 'package:pet_app/view/login_screen.dart';

import 'view/onboarding_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFFD9340),
        ),
        primaryColor: const Color(0xFFFD9340),
        fontFamily: 'Inter',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
      },
    );
  }
}
