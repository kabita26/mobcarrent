import 'package:car_rent/features/home/presentation/view/buttomview/homeview.dart';
import 'package:car_rent/view/bookinglistview.dart';
import 'package:car_rent/view/wishlistview.dart';
import 'package:car_rent/view/profileview.dart';
import 'package:flutter/material.dart';

class Dashboardview extends StatelessWidget {
  Dashboardview({super.key});

  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);

  final List<Widget> _bottomScreens = [
    const Homeview(),
    const Bookinglistview(),
    const Bucketlistview(), // Removed Schedule
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 45, 109), // Updated color
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/lo.png",
              height: screenHeight * 0.22,
              width: screenWidth * 0.5,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedIndexNotifier,
        builder: (context, selectedIndex, child) {
          return _bottomScreens[selectedIndex];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _selectedIndexNotifier,
        builder: (context, selectedIndex, child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 22,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.book_outlined,
                  size: 22,
                ),
                label: 'Bookings',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                  size: 22,
                ),
                label: 'Wish-List',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  size: 22,
                ),
                label: 'Profile',
              ),
            ],
            backgroundColor: Colors.white,
            selectedItemColor: const Color.fromARGB(255, 8, 45, 109), // Updated color
            unselectedItemColor: const Color.fromARGB(255, 57, 57, 57),
            currentIndex: selectedIndex,
            onTap: (index) {
              _selectedIndexNotifier.value = index;
            },
          );
        },
      ),
    );
  }
}
