import 'package:carrent/auth/login.dart';
import 'package:carrent/auth/register.dart';
import 'package:carrent/auth/reset.dart';
import 'package:carrent/user_view/on_boarding_panel.dart';
import 'package:carrent/user_view/home.dart';
import 'package:carrent/user_view/placeholder.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // Authentication routes
        '/': (context) => const OnboardingScreen(), // Main Screen
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot': (context) => const ForgotPasswordScreen(),
        
        // User view routes
        '/home': (context) => const HomeScreen(),
        '/bookCar': (context) => const BookCarScreen(),
      },
    );
  }
}
