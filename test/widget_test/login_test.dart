import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:car_rent/features/auth/presentation/view/login_view.dart';

void main() {
  group('LoginView widgets', () {
    testWidgets('renders with title, email, password, and login button',
        (tester) async {
      // Arrange: Build the LoginView widget
      await tester.pumpWidget(
        MaterialApp(
          home: LoginView(),
        ),
      );

      // Act: Find widgets
      final titleFinder =
          find.text('Log In'); // This will find the "Log In" text in AppBar
      final emailFieldFinder = find.byType(TextFormField).first;
      final passwordFieldFinder = find.byType(TextFormField).at(1);
      final loginButtonFinder =
          find.byType(ElevatedButton); // This specifically finds the button

      // Assert: Check if widgets are found
      expect(titleFinder,
          findsOneWidget); // Check if the title "Log In" in the AppBar is found
      expect(emailFieldFinder,
          findsOneWidget); // Check if the email field is found
      expect(passwordFieldFinder,
          findsOneWidget); // Check if the password field is found
      expect(loginButtonFinder,
          findsOneWidget); // Check if the login button is found
    });

    testWidgets('should show error message when invalid login', (tester) async {
      // Arrange: Build the LoginView widget
      await tester.pumpWidget(
        MaterialApp(
          home: LoginView(),
        ),
      );

      // Act: Enter invalid data and tap the login button
      await tester.enterText(find.byType(TextFormField).first, 'invalidemail');
      await tester.enterText(find.byType(TextFormField).at(1), 'wrongpassword');
      await tester.tap(find.byType(
          ElevatedButton)); // Use the button finder to tap the login button
      await tester.pump();

      // Assert: Check if error message is shown
      expect(find.text('Invalid username or password'), findsOneWidget);
    });
  });
}
