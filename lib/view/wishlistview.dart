import 'package:flutter/material.dart';

class WishlistView extends StatefulWidget {
  const WishlistView({super.key});

  @override
  _WishlistViewState createState() => _WishlistViewState();
}

class _WishlistViewState extends State<WishlistView> {
  List<Map<String, String>> wishlist = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as List<Map<String, String>>?;
    if (args != null) {
      setState(() {
        wishlist = args;
      });
    }
  }

  void removeFromWishlist(int index) {
    setState(() {
      wishlist.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Car removed from wishlist!"),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wishlist")),
      body: wishlist.isEmpty
          ? const Center(
              child: Text(
                "Your Wishlist is Empty!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                final car = wishlist[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: Image.asset(car['image'] ?? '', width: 80, height: 60, fit: BoxFit.cover),
                    title: Text(car['name'] ?? 'Unknown Model', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text(car['price'] ?? 'Price Unavailable', style: const TextStyle(fontSize: 16, color: Colors.grey)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => removeFromWishlist(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
