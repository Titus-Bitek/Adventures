import 'package:flutter/material.dart';
import 'package:helloworld/TrailDetailsScreen.dart';
import 'package:helloworld/RatingsAndRecommendationsScreen.dart';
import 'package:helloworld/Photography.dart';
import 'package:helloworld/explore.dart';

class FamilyFriendlyTrailSelectionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> familyFriendlyTrails;

  FamilyFriendlyTrailSelectionScreen({required this.familyFriendlyTrails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Family-Friendly Trails'),
      ),
      body: ListView.builder(
        itemCount: familyFriendlyTrails.length,
        itemBuilder: (context, index) {
          final trail = familyFriendlyTrails[index];
          return ListTile(
            title: Text(trail['name']),
            subtitle: Text(trail['description']),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Navigate to the Trail Details Screen passing trail details.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrailDetailsScreen(
                    trailName: trail['name'],
                    difficultyLevel: trail['difficulty'],
                    distance: trail['distance'],
                    elevationProfile: trail['elevation'],
                    trailPhotos: trail['photos'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
