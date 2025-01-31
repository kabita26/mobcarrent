import 'package:car_rent/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:car_rent/features/splash/presentation/view_model/splash_screen_cubit.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashScreenCubit, SplashScreenState>(
      listener: (context, state) {
        // Navigate to LoginView when the last page (pageIndex == 2) is reached
        if (state.pageIndex == 2) {
          Future.delayed(Duration(seconds: 1), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginView()),
            );
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: PageView(
            onPageChanged: (index) {
              // Update the cubit state when the page changes
              context.read<SplashScreenCubit>().emit(SplashScreenState(index));
            },
            controller: PageController(initialPage: state.pageIndex),
            children: [
              buildSplashPage(
                  'assets/images/Car-rental-cuate.png',
                  'Welcome to the Car Rent App!',
                  'Find the perfect car for your trip.'),
              buildSplashPage(
                  'assets/images/Front-car-pana.png',
                  'Choose the best car for you',
                  'Browse our wide range of cars.'),
              buildSplashPage('assets/images/lo.png', 'Enjoy your ride with us',
                  'Experience the comfort and convenience.'),
            ],
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Skip the onboarding screens and go directly to the LoginView
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginView()),
                    );
                  },
                  child: Text("Skip"),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    // Go to the next page when the button is pressed
                    context.read<SplashScreenCubit>().goToNextPage();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildSplashPage(String imagePath, String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath), // Display image from assets
        SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
