import 'package:flutter/material.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  final List<Map<String, String>> carBrands = const [
    {'label': 'Mahindra', 'image': 'assets/icons/Tesla.png'},
    {'label': 'Toyota', 'image': 'assets/icons/toyota.jpeg'},
    {'label': 'BMW', 'image': 'assets/icons/BMW.jpeg'},
    {'label': 'Ford', 'image': 'assets/icons/ford.png'},
    {'label': 'Audi', 'image': 'assets/icons/Audi.jpeg'},
    {'label': 'Honda', 'image': 'assets/icons/Honda.jpeg'},
    {'label': 'Tesla', 'image': 'assets/icons/Tesla.png'},
    {'label': 'Hyundai', 'image': 'assets/icons/hyundai.png'},
    {'label': 'Kia', 'image': 'assets/icons/Kia.png'},
  ];

  final List<Map<String, String>> carModels = const [
    {'name': 'SUV', 'image': 'assets/images/suv.png'},
    {'name': 'Sedan', 'image': 'assets/images/sedan.png'},
    {'name': 'Convertible', 'image': 'assets/images/convertible.png'},
  ];

  final List<Map<String, String>> topCars = const [
    {'name': 'Tesla Model S', 'image': 'assets/images/tesla_model_s.png'},
    {'name': 'BMW X5', 'image': 'assets/images/bmw_x5.png'},
    {'name': 'Audi A6', 'image': 'assets/images/audi_a6.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Simplified Search Bar without the Positioned widget
            Container(
              height: screenHeight * 0.07,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 238, 235, 235),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for cars',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 120, 118, 118)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.08),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: const Text(
                        'Car Brands',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // Car Brands Section
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Row(
                        children: List.generate(
                          carBrands.length,
                          (index) => Container(
                            margin: EdgeInsets.only(right: screenWidth * 0.04),
                            child: Column(
                              children: [
                                Container(
                                  width: screenWidth * 0.2,
                                  height: screenWidth * 0.2,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[300],
                                    image: DecorationImage(
                                      image: AssetImage(carBrands[index]['image']!),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.10),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
                                SizedBox(
                                  width: screenWidth * 0.2,
                                  child: Text(
                                    carBrands[index]['label']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // Car Models Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: const Text(
                        'Cars',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Row(
                        children: List.generate(
                          carModels.length,
                          (index) => Container(
                            margin: EdgeInsets.only(right: screenWidth * 0.04),
                            width: screenWidth * 0.45,
                            height: screenHeight * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(carModels[index]['image']!),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.7),
                                  ],
                                ),
                              ),
                              padding: EdgeInsets.all(screenWidth * 0.04),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    carModels[index]['name']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),

                

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Row(
                        children: List.generate(
                          topCars.length,
                          (index) => Container(
                            margin: EdgeInsets.only(right: screenWidth * 0.04),
                            width: screenWidth * 0.45,
                            height: screenHeight * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(topCars[index]['image']!),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(screenWidth * 0.04),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  topCars[index]['name']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
