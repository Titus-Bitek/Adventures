import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TrailDetailsScreen extends StatelessWidget {
  final String trailName;
  final String difficultyLevel;
  final double distance;
  final String elevationProfile;
  final List<String> trailPhotos;

  TrailDetailsScreen({
    required this.trailName,
    required this.difficultyLevel,
    required this.distance,
    required this.elevationProfile,
    required this.trailPhotos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trail Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trailName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Difficulty: $difficultyLevel'),
              SizedBox(height: 8),
              Text('Distance: $distance km'),
              SizedBox(height: 8),
              Text('Elevation Profile: $elevationProfile'),
              SizedBox(height: 16),
              Text(
                'Trail Photos:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: trailPhotos.length,
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    imageUrl: trailPhotos[index],
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
