import 'package:flutter/material.dart';

class RatingsAndRecommendationsScreen extends StatelessWidget {
  final String trailName;
  final List<int> ratings;
  final List<String> recommendations;

  RatingsAndRecommendationsScreen({
    required this.trailName,
    required this.ratings,
    required this.recommendations,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ratings and Recommendations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ratings and Recommendations for $trailName',
              style: TextStyle(fontSize: 20),
            ),
            // Display the ratings
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int rating in ratings)
                  Icon(
                    rating >= 4 ? Icons.star : Icons.star_border,
                    color: rating >= 4 ? Colors.yellow : Colors.grey,
                  ),
              ],
            ),
            // Display the recommendations
            ListView.builder(
              itemCount: recommendations.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(recommendations[index]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
