import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String placeName;
  final String imageUrl;

  DetailsScreen({required this.placeName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(placeName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageUrl),
            SizedBox(height: 16),
            Text(
              placeName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Add more details about the trail here
          ],
        ),
      ),
    );
  }
}
