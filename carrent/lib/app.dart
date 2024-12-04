import 'package:flutter/material.dart';
import 'user_view/home.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserHome(),
    );
  }
}
