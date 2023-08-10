import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  final List<Map<String, dynamic>> hikingAdventures = [
    {
      'name': 'Murchison Falls National Park',
      'description':
          'Murchison Falls National Park is Uganda\'s largest and oldest conservation area, known for its beautiful landscape, wildlife, and the dramatic Murchison Falls.',
      'image': 'assets/murchison_falls.jpg',
    },
    {
      'name': 'Rwenzori Mountains National Park',
      'description':
          'Rwenzori Mountains National Park offers an incredible hiking experience with its snow-capped peaks and diverse flora and fauna.',
      'image': 'assets/rwenzori_mountains.jpg',
    },
    {
      'name': 'Mount Elgon National Park',
      'description':
          'Mount Elgon National Park is home to Mount Elgon, an extinct volcano with the largest volcanic base in the world.',
      'image': 'assets/mount_elgon.jpg',
    },
    {
      'name': 'Ngamba Island Chimpanzee Sanctuary',
      'description':
          'Ngamba Island is a sanctuary for orphaned chimpanzees, and you can explore the island with guided walks.',
      'image': 'assets/ngamba_island.jpg',
    },
    {
      'name': 'Mabira Forest',
      'description':
          'Mabira Forest is a lush rainforest with hiking trails where you can spot various bird species and wildlife.',
      'image': 'assets/mabira_forest.jpg',
    },
    // Add more hiking adventures here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Hiking Adventures in Uganda'),
      ),
      body: ListView.builder(
        itemCount: hikingAdventures.length,
        itemBuilder: (context, index) {
          final adventure = hikingAdventures[index];
          return GestureDetector(
            onTap: () {
              // Navigate to the details page for the selected hiking adventure.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HikingAdventureDetailsScreen(
                    name: adventure['name'],
                    description: adventure['description'],
                    image: adventure['image'],
                  ),
                ),
              );
            },
            child: Card(
              elevation: 4,
              margin: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    adventure['image'],
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          adventure['name'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(adventure['description']),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class HikingAdventureDetailsScreen extends StatelessWidget {
  final String name;
  final String description;
  final String image;

  HikingAdventureDetailsScreen({
    required this.name,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              image,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(description),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Implement the logic for booking the hiking adventure.
                      // You can use this button to handle booking functionality.
                      // Add your booking logic here.
                    },
                    child: Text('Book Now'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
