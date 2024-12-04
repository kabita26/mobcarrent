import 'package:flutter/material.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/b.webp'),
            fit: BoxFit.cover,
          ),
        ),
        
      ),
    );
  }
}
