import 'package:carrent/auth/login.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "title": "Welcome to Car Rental",
      "description":
          "Your trusted platform for flexible and easy vehicle rentals.",
      "image":
          "assets/images/car_rental-pana.png", // Replace with actual image path
    },
    {
      "title": "Explore Features",
      "description":
          "Search, compare, and book vehicles seamlessly from anywhere.",
      "image":
          "assets/images/city_driver_bro.png", // Replace with actual image path
    },
    {
      "title": "Get Started Now",
      "description":
          "Sign up or log in to experience the ultimate car rental service.",
      "image":
          "assets/images/city_driver_pana.png", // Replace with actual image path
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: const Text(
          'FleetRider',
          style: TextStyle(fontFamily: "Montserrat Bold"),
        )),
        backgroundColor: const Color.fromARGB(255, 232, 230, 229),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                final data = _onboardingData[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Make the image fully visible without cropping
                    Image.asset(
                      data["image"]!,
                      width: MediaQuery.of(context)
                          .size
                          .width, // Full width of the screen
                      height: MediaQuery.of(context).size.height *
                          0.4, // 40% of screen height
                      fit: BoxFit
                          .contain, // Ensures the entire image fits without cropping
                    ),
                    const SizedBox(height: 20),
                    Text(
                      data["title"]!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        data["description"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardingData.length,
              (index) => buildDot(index, _currentPage),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: _currentPage == _onboardingData.length - 1
                  ? () {
                      // Navigate to the login screen when the user is on the last page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    }
                  : () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD39632),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                _currentPage == _onboardingData.length - 1
                    ? "Get Started"
                    : "Next",
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildDot(int index, int currentPage) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
        color: currentPage == index
            ? const Color(0xFFD39632)
            : const Color(0xFFD3D3D3),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
