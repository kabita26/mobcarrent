import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  final List<Map<String, dynamic>> wishlist;

  const WishlistScreen({Key? key, required this.wishlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Wishlist'),
      ),
      body: wishlist.isEmpty
          ? const Center(child: Text('Your wishlist is empty'))
          : ListView.builder(
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                final car = wishlist[index];
                return ListTile(
                  contentPadding: const EdgeInsets.all(8.0),
                  leading: Image.asset(
                    car['image']!,
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(car['name']!),
                  subtitle: Text(car['price']!),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      // Handle removal of the car from the wishlist
                      Navigator.pop(context, car); // Pass the car to be removed
                    },
                  ),
                  onTap: () {
                    // Show detailed car view when tapping on the car
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarDetailScreen(car: car),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class CarDetailScreen extends StatelessWidget {
  final Map<String, dynamic> car;

  const CarDetailScreen({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car['name']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              car['image']!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              car['name']!,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              car['price']!,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.green,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              'Brand: ${car['brandname']}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            // Add more details if needed, such as car description or other attributes
          ],
        ),
      ),
    );
  }
}
