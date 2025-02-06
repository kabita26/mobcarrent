import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:car_rent/features/auth/presentation/view/register_view.dart';

void main() {
  group('RegisterView Tests', () {
    testWidgets(
        'RegisterView has email, username, password, and register button',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterView()));

      expect(find.byType(TextFormField),
          findsNWidgets(4)); // Email, Username, Password, Confirm Password
      expect(find.byType(ElevatedButton), findsOneWidget); // Register Button
    });

    testWidgets('User can enter email', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterView()));

      await tester.enterText(
          find.byType(TextFormField).at(0), 'test@example.com');
      expect(find.text('test@example.com'), findsOneWidget);
    });

    testWidgets('User can enter username', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterView()));

      await tester.enterText(find.byType(TextFormField).at(1), 'testuser');
      expect(find.text('testuser'), findsOneWidget);
    });

    testWidgets('Password validation fails when passwords do not match',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterView()));

      await tester.enterText(
          find.byType(TextFormField).at(2), 'password123'); // Password
      await tester.enterText(find.byType(TextFormField).at(3),
          'wrongpassword'); // Confirm Password
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text('Passwords do not match'), findsOneWidget);
    });
  });
}
