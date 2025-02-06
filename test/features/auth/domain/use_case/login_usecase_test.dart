// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:car_rent/features/auth/presentation/view/login_view.dart';  // Adjust the path as needed
// import 'package:car_rent/features/auth/presentation/view_model/login/login_bloc.dart'; // Adjust the path as needed

// void main() {
//   testWidgets('LoginView renders with title, email, password, and login button', (tester) async {
//     // Arrange: Build the LoginView with a BlocProvider
//     await tester.pumpWidget(
//       MaterialApp(
//         home: BlocProvider(
//           create: (context) => LoginBloc(),
//           child: const LoginView(),
//         ),
//       ),
//     );

//     // Act: Find widgets
//     final titleFinder = find.text('Log In');
//     final emailFieldFinder = find.byType(TextFormField).first;
//     final passwordFieldFinder = find.byType(TextFormField).at(1);
//     final loginButtonFinder = find.text('Log In');

//     // Assert: Check if widgets are found
//     expect(titleFinder, findsOneWidget); // Check if the title "Log In" is found
//     expect(emailFieldFinder, findsOneWidget); // Check if the email field is found
//     expect(passwordFieldFinder, findsOneWidget); // Check if the password field is found
//     expect(loginButtonFinder, findsOneWidget); // Check if the login button is found
//   });
// }
