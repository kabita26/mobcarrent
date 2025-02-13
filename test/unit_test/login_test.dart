import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:car_rent/features/auth/presentation/view/login_view.dart';

void main() {
  group('LoginView Tests', () {
    testWidgets('LoginView has email, password fields, and login button',
        (tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginView()));

      expect(find.byType(TextFormField),
          findsNWidgets(2)); // Email & Password fields
      expect(find.byType(ElevatedButton), findsOneWidget); // Login Button
    });

    testWidgets('User can enter email', (tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginView()));

      await tester.enterText(
          find.byType(TextFormField).first, 'test@example.com');
      expect(find.text('test@example.com'), findsOneWidget);
    });

    testWidgets('User can enter password', (tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginView()));

      await tester.enterText(find.byType(TextFormField).at(1), 'password123');
      expect(find.text('password123'), findsOneWidget);
    });
  });
}
