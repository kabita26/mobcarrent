import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:car_rent/features/home/domain/entity/car.dart';

class CarDetailView extends StatefulWidget {
  final Car car;
  const CarDetailView({Key? key, required this.car}) : super(key: key);

  @override
  _CarDetailViewState createState() => _CarDetailViewState();
}

class _CarDetailViewState extends State<CarDetailView> {
  late StreamSubscription _accelerometerSubscription;
  bool _addedToWishlist = false; // Prevent duplicate wishlist additions

  @override
  void initState() {
    super.initState();
    _listenToAccelerometer();
  }

  void _listenToAccelerometer() {
    _accelerometerSubscription = accelerometerEvents.listen((event) {
      double acceleration = (event.x * event.x) +
          (event.y * event.y) +
          (event.z * event.z);
      
      if (acceleration > 25) { // Adjust sensitivity threshold here
        _handleShakeGesture();
      }
    });
  }

  void _handleShakeGesture() {
    if (!_addedToWishlist) {
      setState(() {
        _addedToWishlist = true;
      });

      // Simulate adding to wishlist
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Car added to Wishlist by shaking!"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    _accelerometerSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.car.brand} ${widget.car.model}'),
        actions: [
          IconButton(
            icon: Icon(_addedToWishlist ? Icons.favorite : Icons.favorite_border, color: _addedToWishlist ? Colors.red : null),
            onPressed: () {
              setState(() {
                _addedToWishlist = true;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Car added to Wishlist")),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            widget.car.imageUrls.isNotEmpty
                ? Image.network(widget.car.imageUrls.first)
                : const Icon(Icons.directions_car, size: 100),
            const SizedBox(height: 16),
            Text(
              '${widget.car.brand} ${widget.car.model}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Year: ${widget.car.year}'),
            Text('Price: \$${widget.car.regularPrice.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            Text(widget.car.description.isNotEmpty
                ? widget.car.description
                : 'No description available.'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
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
