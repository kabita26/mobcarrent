import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Rental System'),
        backgroundColor: const Color(0xFFD39632),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to Car Rental System',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildFeatureCard(
                    context,
                    icon: Icons.directions_car,
                    title: 'Book a Car',
                    onTap: () {
                      Navigator.pushNamed(context, '/bookCar');
                    },
                  ),
                  _buildFeatureCard(
                    context,
                    icon: Icons.list,
                    title: 'Available Cars',
                    onTap: () {
                      Navigator.pushNamed(context, '/availableCars');
                    },
                  ),
                  _buildFeatureCard(
                    context,
                    icon: Icons.history,
                    title: 'Rental History',
                    onTap: () {
                      Navigator.pushNamed(context, '/rentalHistory');
                    },
                  ),
                  _buildFeatureCard(
                    context,
                    icon: Icons.account_circle,
                    title: 'Account Settings',
                    onTap: () {
                      Navigator.pushNamed(context, '/accountSettings');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color.fromRGBO(211, 150, 50, 1),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
