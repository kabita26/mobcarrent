import 'package:flutter/material.dart';

class BookCarScreen extends StatelessWidget {
  const BookCarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book a Car')),
      body: const Center(child: Text('Book Car Screen')),
    );
  }
}
