import 'package:flutter/material.dart';

import 'package:helloworld/TrailDetailsScreen.dart';
import 'package:helloworld/FamilyFriendlyTrailSelectionScreen.dart';
import 'package:helloworld/GroupHikingExpeditionPlanningScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hiking Adventures',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomePage(),
      routes: {
        '/trailDetails': (context) => TrailDetailsScreen(
              trailName: 'Example Trail',
              difficultyLevel: 'Moderate',
              distance: 10.5,
              elevationProfile: 'Some ups and downs',
              trailPhotos: [
                'Assets/1.jpg',
                'Assets/1.jpg',
                'Assets/1.jpg',
                'Assets/1.jpg',
                'Assets/1.jpg',
                'Assets/1.jpg',
                'Assets/1.jpg',
                'Assets/1.jpg',
              ],
            ),
        '/familyFriendlyTrails': (context) =>
            FamilyFriendlyTrailSelectionScreen(
              familyFriendlyTrails: dummyFamilyFriendlyTrails,
            ),
        '/groupHikingExpedition': (context) =>
            GroupHikingExpeditionPlanningScreen(
              trailName: 'Example Trail for Group',
              dateTime: DateTime.now(),
              maxParticipants: 10,
            ),
        '/photography': (context) => FamilyFriendlyTrailSelectionScreen(
              familyFriendlyTrails: dummyPhotography,
            ),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Hiking Adventures',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Arial',
              // You can add more properties like letterSpacing, fontStyle, etc.
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Trails',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    try {
                      // For example, you can use the print statement to simulate a search:
                      print('Performing search for: ${_searchController.text}');
                    } catch (e) {
                      // Handle any errors that occur during the search
                      print('An error occurred during search: $e');
                    } // Perform search based on _searchController's text
                    // Implement your search logic here
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Trending Trails',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 200, // Adjust the height as needed
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dummyTrendingPlaces.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TrendingPlaceCard(
                                placeName: dummyTrendingPlaces[index]['name'],
                                imageUrl: dummyTrendingPlaces[index]['image'],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Nearest Accommodation',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 200, // Adjust the height as needed
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dummyAccommodationPlaces.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AccommodationPlaceCard(
                                placeName: dummyAccommodationPlaces[index]
                                    ['name'],
                                imageUrl: dummyAccommodationPlaces[index]
                                    ['image'],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Wildlife Trails',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 200, // Adjust the height as needed
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dummyHikingPlaces.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: HikingPlaceCard(
                                placeName: dummyHikingPlaces[index]['name'],
                                imageUrl: dummyHikingPlaces[index]['image'],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: CustomScrollView(
          //     slivers: [
          //       SliverList(
          //         delegate: SliverChildListDelegate(
          //           [
          //             Padding(
          //               padding: const EdgeInsets.all(16.0),
          //               child: Text(
          //                 'Trending Places',
          //                 style: TextStyle(
          //                   fontSize: 24,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ),
          //             Container(
          //               height: 200, // Adjust the height as needed
          //               child: ListView.builder(
          //                 scrollDirection: Axis.horizontal,
          //                 itemCount: dummyAccommodationPlaces.length,
          //                 itemBuilder: (context, index) {
          //                   return Padding(
          //                     padding: const EdgeInsets.all(8.0),
          //                     child: AccommodationPlaceCard(
          //                       placeName: dummyAccommodationPlaces[index]
          //                           ['name'],
          //                       imageUrl: dummyAccommodationPlaces[index]
          //                           ['image'],
          //                     ),
          //                   );
          //                 },
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       // SliverList(
          //       //   delegate: SliverChildListDelegate(
          //       //     [
          //       //       Padding(
          //       //         padding: const EdgeInsets.all(16.0),
          //       //         child: Text(
          //       //           'Nearest Accommodation',
          //       //           style: TextStyle(
          //       //             fontSize: 24,
          //       //             fontWeight: FontWeight.bold,
          //       //           ),
          //       //         ),
          //       //       ),
          //       //       Container(
          //       //         height: 200, // Adjust the height as needed
          //       //         child: ListView.builder(
          //       //           scrollDirection: Axis.horizontal,
          //       //           itemCount: dummyTrendingPlaces.length,
          //       //           itemBuilder: (context, index) {
          //       //             return Padding(
          //       //               padding: const EdgeInsets.all(8.0),
          //       //               child: TrendingPlaceCard(
          //       //                 placeName: dummyTrendingPlaces[index]['name'],
          //       //                 imageUrl: dummyTrendingPlaces[index]['image'],
          //       //               ),
          //       //             );
          //       //           },
          //       //         ),
          //       //       ),
          //       //     ],
          //       //   ),
          //       // ),
          //     ],
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              // Do nothing, as we are already on the home page.
              break;
            case 1:
              Navigator.pushNamed(context, '/familyFriendlyTrails');
              break;
            case 2:
              Navigator.pushNamed(context, '/groupHikingExpedition');
              break;
            case 3:
              Navigator.pushNamed(context, '/trailDetails');
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.family_restroom),
            label: 'Family-Friendly Trails',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Group Expedition',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Trail Details',
          ),
        ],
        selectedItemColor: Colors.blue, // Color for the selected item
        unselectedItemColor: Colors.grey, // Color for the unselected items
      ),
    );
  }
}

class TrendingPlaceCard extends StatelessWidget {
  final String placeName;
  final String imageUrl;

  TrendingPlaceCard({required this.placeName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imageUrl),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          placeName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

final List<Map<String, dynamic>> dummyTrendingPlaces = [
  {
    'name': 'Scenic Mountain',
    'image': 'Assets/2.jpg',
  },
  {
    'name': 'Forest Trail',
    'image': 'Assets/3.jpg',
  },
  {
    'name': 'Treking Trail',
    'image': 'Assets/6.jpg',
  },
  {
    'name': 'Zoo Trail',
    'image': 'Assets/4.jpg',
  },
  {
    'name': 'Scenic Mountain',
    'image': 'Assets/1.jpg',
  },
  {
    'name': 'Group Trail',
    'image': 'Assets/7.jpg',
  },
  // Add more trending places here
];

class AccommodationPlaceCard extends StatelessWidget {
  final String placeName;
  final String imageUrl;

  AccommodationPlaceCard({required this.placeName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imageUrl),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          placeName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

final List<Map<String, dynamic>> dummyAccommodationPlaces = [
  {
    'name': 'Safaris',
    'image': 'Assets/rest2.jpg',
  },
  {
    'name': 'Nile Resort',
    'image': 'Assets/rest.jpg',
  },
  {
    'name': 'Telegraph Travel',
    'image': 'Assets/rest6.jpg',
  },
  {
    'name': 'Outdoor Trail',
    'image': 'Assets/rest4.jpg',
  },
  {
    'name': 'Scenic Beauty',
    'image': 'Assets/rest1.jpg',
  },
  {
    'name': 'Group Trail',
    'image': 'Assets/rest7.jpg',
  },
  // Add more trending places here
];

class HikingPlaceCard extends StatelessWidget {
  final String placeName;
  final String imageUrl;

  HikingPlaceCard({required this.placeName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imageUrl),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          placeName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

final List<Map<String, dynamic>> dummyHikingPlaces = [
  {
    'name': 'Safaris',
    'image': 'Assets/rest2.jpg',
  },
  {
    'name': 'Nile Resort',
    'image': 'Assets/rest.jpg',
  },
  {
    'name': 'Telegraph Travel',
    'image': 'Assets/rest6.jpg',
  },
  {
    'name': 'Outdoor Trail',
    'image': 'Assets/rest4.jpg',
  },
  {
    'name': 'Scenic Beauty',
    'image': 'Assets/rest1.jpg',
  },
  {
    'name': 'Group Trail',
    'image': 'Assets/rest7.jpg',
  },
  // Add more trending places here
];

final List<Map<String, dynamic>> dummyFamilyFriendlyTrails = [
  {
    'name': 'Family Trail A',
    'description': 'A short and easy trail for families with young kids.',
    'difficulty': 'Easy',
    'distance': 5.0,
    'elevation': 'Flat',
    'photos': ['Assets/7.jpg', 'Assets/3.jpg', 'Assets/2.jpg', 'Assets/1.jpg'],
  },
  {
    'name': 'Family Trail B',
    'description':
        'An enjoyable trail with beautiful views for the whole family.',
    'difficulty': 'Moderate',
    'distance': 8.0,
    'elevation': 'Some hills',
    'photos': ['Assets/1.jpg', 'Assets/1.jpg', 'Assets/1.jpg', 'Assets/1.jpg'],
  },
];
final List<Map<String, dynamic>> dummyPhotography = [
  {
    'name': 'Family Trail A',
    'description': 'A short and easy trail for families with young kids.',
    'difficulty': 'Easy',
    'distance': 5.0,
    'elevation': 'Flat',
    'photos': ['Assets/7.jpg', 'Assets/3.jpg', 'Assets/2.jpg', 'Assets/1.jpg'],
  },
  {
    'name': 'Family Trail B',
    'description':
        'An enjoyable trail with beautiful views for the whole family.',
    'difficulty': 'Moderate',
    'distance': 8.0,
    'elevation': 'Some hills',
    'photos': ['Assets/1.jpg', 'Assets/1.jpg', 'Assets/1.jpg', 'Assets/1.jpg'],
  },
];
