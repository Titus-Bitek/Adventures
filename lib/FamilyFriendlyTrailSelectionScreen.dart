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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BadgeIconButton(
            icon: Icon(Icons.book),
            text: 'Booking',
            onPressed: () {
              // Handle the booking button press.
              // Add your booking logic here.
            },
          ),
          SizedBox(height: 16),
          // BadgeIconButton(
          //   icon: Icon(Icons.explore),
          //   text: 'Explore',
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) =>
          //             ExplorePage(), // Navigate to ExplorePage
          //       ),
          //     );
          //     // Handle the explore button press.
          //     // Add your explore logic here.
          //   },
          // ),
          // SizedBox(height: 16),
          // BadgeIconButton(
          //   icon: Icon(Icons.camera_alt),
          //   text: 'Photography',
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => PhotographyPage(),
          //       ),
          //     );
          //     // Handle the photography button press.
          //     // Add your photography logic here.
          //   },
          // ),
        ],
      ),
    );
  }
}

class BadgeIconButton extends StatelessWidget {
  final Icon icon;
  final String text;
  final int badgeValue;
  final VoidCallback onPressed;

  BadgeIconButton(
      {required this.icon,
      required this.text,
      this.badgeValue = 0,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ElevatedButton.icon(
          onPressed: onPressed,
          icon: icon,
          label: Text(text),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
        if (badgeValue > 0)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                badgeValue.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
