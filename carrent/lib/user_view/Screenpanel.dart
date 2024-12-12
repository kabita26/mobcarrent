import 'package:flutter/material.dart';

class ScreenPanel extends StatelessWidget {
  const ScreenPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/a.webp'), // Update the image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Centered Content (only title now)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to Car Rental',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(211, 150, 50, 1),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          // Positioned "Get Started" Button at the Bottom
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD39632),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Get Started'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
