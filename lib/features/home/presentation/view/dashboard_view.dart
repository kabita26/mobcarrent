import 'package:flutter/material.dart';
import 'package:car_rent/features/home/presentation/view/buttomview/homeview.dart';
import 'package:car_rent/view/bookinglistview.dart';
import 'package:car_rent/view/wishlistview.dart';
import 'package:car_rent/view/profileview.dart';
import 'dart:math'; // ✅ Import to use min() function

class Dashboardview extends StatelessWidget {
  Dashboardview({super.key});

  final ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);

  // ✅ Ensuring Bottom Screens Count Matches BottomNavigationBar Items
  final List<Widget> _bottomScreens = [
    Homeview(),             // Index 0: Home
    const BookingListView(), // Index 1: Bookings
    const WishlistView(),    // Index 2: Wishlist
    const ProfileScreen(),   // Index 3: Profile
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 8, 45, 109),
        title: Center(
          child: Image.asset(
            "assets/images/log.png",
            height: screenHeight * 0.22,
            width: screenWidth * 0.22,
          ),
        ),
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: _selectedIndexNotifier,
        builder: (context, selectedIndex, child) {
          // ✅ Ensure index is within valid range
          int safeIndex = min(selectedIndex, _bottomScreens.length - 1);
          return _bottomScreens[safeIndex];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: _selectedIndexNotifier,
        builder: (context, selectedIndex, child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 22),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined, size: 22),
                label: 'Bookings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border, size: 22),
                label: 'Wish-List',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, size: 22),
                label: 'Profile',
              ),
            ],
            backgroundColor: Colors.white,
            selectedItemColor: const Color.fromARGB(255, 8, 45, 109),
            unselectedItemColor: const Color.fromARGB(255, 57, 57, 57),
            currentIndex: min(selectedIndex, _bottomScreens.length - 1), // ✅ Ensure valid index
            onTap: (index) {
              if (index < _bottomScreens.length) { // ✅ Prevent invalid index selection
                _selectedIndexNotifier.value = index;
              }
            },
          );
        },
      ),
    );
  }
}
