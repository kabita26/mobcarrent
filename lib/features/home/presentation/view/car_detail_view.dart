import 'package:flutter/material.dart';
import '../../domain/entities/car.dart';

class CarDetailView extends StatelessWidget {
  final Car car;
  const CarDetailView({Key? key, required this.car}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${car.brand} ${car.model}'),
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
            Text(car.description.isNotEmpty 
              ? car.description 
              : 'No description available.'),
          ],
        ),
      ),
    );
  }
}
