import 'package:flutter/material.dart';

class CarDetail extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String brandName;

  const CarDetail({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.brandName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Details'),
        backgroundColor: theme.primaryColor,
      ),
      body: SingleChildScrollView(
        // To allow scrolling for content if needed
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Car image with full width and 50% screen height
              Image.asset(
                image,
                width: MediaQuery.of(context).size.width +
                    100, // Increase width by 100
                height: MediaQuery.of(context).size.height *
                    0.5, // 50% of screen height
                fit: BoxFit
                    .cover, // To make the image cover the entire width and height without distortion
              ),
              const SizedBox(height: 20), // Spacing after image

              // Car name
              Text(
                name,
                style: theme.textTheme.headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              // Car brand
              Text(
                'Brand: $brandName',
                style: theme.textTheme.bodyLarge!
                    .copyWith(fontSize: 18, color: Colors.grey[700]),
              ),
              const SizedBox(height: 10),

              // Car price
              Text(
                'Price: $price',
                style: theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              const SizedBox(height: 20), // Spacing at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
