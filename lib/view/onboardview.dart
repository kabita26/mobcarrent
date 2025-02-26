import 'package:car_rent/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});

  final List<Map<String, String>> _onboardingData = const [
    {
      "image": 'assets/images/Car-rental-cuate.png',
      "title": 'Welcome to the Car Rent App!',
      "description": 'Find the perfect car for your trip.'
    },
    {
      "image": 'assets/images/Front-car-pana.png',
      "title": 'Choose the best car for you',
      "description": 'Browse our wide range of cars.'
    },
    {
      "image": 'assets/images/lo.png',
      "title": 'Enjoy your ride with us',
      "description": 'Experience the comfort and convenience.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);

    void nextPage() {
      if (currentPageNotifier.value < _onboardingData.length - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginView()),
        );
      }
    }

    void goToPage(int index) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    void skipOnboarding() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: (index) => currentPageNotifier.value = index,
            itemCount: _onboardingData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      _onboardingData[index]["image"]!,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Text(
                            _onboardingData[index]["title"]!,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            _onboardingData[index]["description"]!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            top: 50,
            right: 20,
            child: GestureDetector(
              onTap: skipOnboarding,
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Change color if needed
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                ValueListenableBuilder<int>(
                  valueListenable: currentPageNotifier,
                  builder: (context, currentPage, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _onboardingData.length,
                        (index) => GestureDetector(
                          onTap: () => goToPage(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: 10,
                            width: currentPage == index ? 20 : 10,
                            decoration: BoxDecoration(
                              color: currentPage == index
                                  ? Colors.blue
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Adjust color to match theme
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: ValueListenableBuilder<int>(
                    valueListenable: currentPageNotifier,
                    builder: (context, currentPage, child) {
                      return Text(
                        currentPage == _onboardingData.length - 1
                            ? "Get Started"
                            : "Next",
                        style: const TextStyle(color: Colors.white),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
