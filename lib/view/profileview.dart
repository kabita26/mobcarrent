import 'package:car_rent/core/common/snackbar/my_snackbar.dart';
import 'package:car_rent/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Picture
            const SizedBox(height: 20),
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/blankprofile.png'),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Kabita',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'kabita@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),

            // Profile Options
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.blueAccent),
              title: const Text('Edit Profile'),
              onTap: () {
                // Navigate to Edit Profile Screen
              },
            ),
            const Divider(),

            ListTile(
              leading: const Icon(Icons.settings, color: Colors.blueAccent),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to Settings Screen
              },
            ),
            const Divider(),

            ListTile(
              leading: const Icon(Icons.help, color: Colors.blueAccent),
              title: const Text('Help & Support'),
              onTap: () {
                // Navigate to Help & Support Screen
              },
            ),
            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              onTap: () {
                _handleLogout(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogout(BuildContext context) {
    // Show Snackbar
    showMySnackBar(
      context: context,
      message: 'Logging out...',
      color: Colors.red,
    );

    // Navigate to Login Screen and remove all previous screens from stack
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
        (route) => false, // Removes all previous routes
      );
    });
  }
}
