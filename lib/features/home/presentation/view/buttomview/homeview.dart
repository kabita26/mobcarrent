import 'package:flutter/material.dart';
import 'package:car_rent/view/bookinglistview.dart';

class Homeview extends StatefulWidget {
  Homeview({super.key});

  @override
  _HomeviewState createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  final List<Map<String, String>> carBrands = [
    {'label': 'Mahindra', 'image': 'assets/icons/mahindra.png'},
    {'label': 'Toyota', 'image': 'assets/icons/toyota.jpeg'},
    {'label': 'BMW', 'image': 'assets/icons/BMW.jpeg'},
    {'label': 'Ford', 'image': 'assets/icons/ford.png'},
    {'label': 'Audi', 'image': 'assets/icons/Audi.jpeg'},
    {'label': 'Honda', 'image': 'assets/icons/Honda.jpeg'},
    {'label': 'Tesla', 'image': 'assets/icons/Tesla.png'},
    {'label': 'Hyundai', 'image': 'assets/icons/hyundai.png'},
    {'label': 'Kia', 'image': 'assets/icons/Kia.png'},
  ];

  final List<Map<String, String>> carModels = [
    {'name': 'SUV', 'image': 'assets/images/a.jpeg', 'price': '\$35,000'},
    {'name': 'Sedan', 'image': 'assets/images/b.jpg', 'price': '\$28,000'},
    {'name': 'Convertible', 'image': 'assets/images/d.jpg', 'price': '\$50,000'},
    {'name': 'Tesla Model S', 'image': 'assets/images/f.jpg', 'price': '\$75,000'},
    {'name': 'BMW X5', 'image': 'assets/images/i.jpeg', 'price': '\$60,000'},
    {'name': 'Audi A6', 'image': 'assets/images/lo.png', 'price': '\$55,000'},
  ];

  List<Map<String, String>> wishlist = [];

  void addToWishlist(Map<String, String> car) {
    setState(() {
      if (!wishlist.contains(car)) {
        wishlist.add(car);
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${car['name']} added to wishlist!'),
        backgroundColor: Colors.orange,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search for cars',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: const Text(
                'Car Brands',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Row(
                children: carBrands.map((brand) {
                  return Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.04),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: screenWidth * 0.08,
                          backgroundImage: AssetImage(brand['image'] ?? ''),
                        ),
                        SizedBox(height: screenHeight * 0.008),
                        Text(
                          brand['label'] ?? 'Unknown',
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: const Text(
                'Available Cars',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: screenHeight * 0.015),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                itemCount: carModels.length,
                itemBuilder: (context, index) {
                  return CarTile(
                    car: carModels[index],
                    onBook: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingListView(
                            carName: carModels[index]['name']!,
                            carImage: carModels[index]['image']!,
                            carPrice: carModels[index]['price']!,
                          ),
                        ),
                      );
                    },
                    onWishlist: () {
                      addToWishlist(carModels[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarTile extends StatelessWidget {
  final Map<String, String> car;
  final VoidCallback onBook;
  final VoidCallback onWishlist;

  const CarTile({required this.car, required this.onBook, required this.onWishlist, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(car['image'] ?? '', fit: BoxFit.cover, height: 200, width: double.infinity),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.red, size: 28),
                  onPressed: onWishlist,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(car['name'] ?? 'Unknown Model', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(car['price'] ?? 'Price Unavailable', style: const TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: onBook,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text("Book Now", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
