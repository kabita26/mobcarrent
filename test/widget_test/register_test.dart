import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:car_rent/features/auth/presentation/view/register_view.dart';

void main() {
  group('RegisterView Widget Tests', () {
    testWidgets('Should render all text fields and buttons', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterView()));

      expect(find.byType(TextFormField),
          findsNWidgets(4)); // Email, Username, Password, Confirm Password
      expect(find.text('Register'), findsOneWidget); // Register Button
      expect(find.text('Already have an account? Sign In'),
          findsOneWidget); // Sign In Button
    });

    testWidgets('Should allow user to enter email', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterView()));

      await tester.enterText(
          find.byType(TextFormField).at(0), 'test@example.com');
      expect(find.text('test@example.com'), findsOneWidget);
    });

    testWidgets('Should allow user to enter password', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterView()));

      await tester.enterText(find.byType(TextFormField).at(2), 'password123');
      expect(find.text('password123'), findsOneWidget);
    });

    testWidgets('Should show validation error when passwords do not match',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterView()));

      await tester.enterText(
          find.byType(TextFormField).at(2), 'password123'); // Password
      await tester.enterText(find.byType(TextFormField).at(3),
          'wrongpassword'); // Confirm Password
      await tester.tap(find.text('Register'));
      await tester.pump();

      expect(find.text('Passwords do not match'), findsOneWidget);
    });

  });
}
