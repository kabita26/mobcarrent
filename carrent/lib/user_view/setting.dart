import 'package:flutter/material.dart';


class Menu extends StatelessWidget {
  final String userName = "Kabita Mahato";
  final String userEmail = "kabi@gmail.com";
  final String userPhone = "+1 234 567 890";
  final String userAddress = "123 Car Street, Rentville, RV 12345";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 60, // Size of the image
                backgroundImage: AssetImage(
                    'assets/images/girl.jpg'), // Replace with your image
              ),
            ),
            SizedBox(height: 20),
            Text(
              userName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              userEmail,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              userPhone,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              userAddress,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
