

import 'package:carrent/auth/login.dart';
import 'package:carrent/auth/register.dart';
import 'package:carrent/auth/reset.dart';
import 'package:carrent/user_view/home.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const ScreenPanel(), // Main Screen
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot': (context) => const ForgotPasswordScreen(),
      },
    );
  }
}
