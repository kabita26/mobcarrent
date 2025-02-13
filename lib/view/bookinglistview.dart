import 'package:flutter/material.dart';

class BookingListView extends StatelessWidget {
  final String carName;
  final String carImage;
  final String carPrice;

  const BookingListView({
    this.carName = "Unknown Model",
    this.carImage = "assets/images/default_car.png",
    this.carPrice = "Price Unavailable",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Booking Confirmation")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(carImage, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(carName, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Price: $carPrice", style: const TextStyle(fontSize: 20, color: Colors.green)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
