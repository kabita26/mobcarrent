import 'package:car_rent/features/home/domain/entity/car.dart';
import 'package:flutter/material.dart';

class CarDetailView extends StatelessWidget {
  final Car car;
  const CarDetailView({Key? key, required this.car}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${car.brand} ${car.model}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Add car to wishlist logic goes here.
              // For demonstration, we show a snackbar.
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Car added to wishlist")),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            car.imageUrls.isNotEmpty 
              ? Image.network(car.imageUrls.first)
              : const Icon(Icons.directions_car, size: 100),
            const SizedBox(height: 16),
            Text(
              '${car.brand} ${car.model}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Year: ${car.year}'),
            Text('Price: \$${car.regularPrice.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            Text(
              car.description.isNotEmpty 
                ? car.description 
                : 'No description available.',
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Book now functionality goes here.
                // For demonstration, we show a snackbar.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Booking confirmed")),
                );
              },
              child: const Text("Book Now"),
            ),
          ],
        ),
      ),
    );
  }
}
