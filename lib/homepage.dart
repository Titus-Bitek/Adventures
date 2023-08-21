import 'package:flutter/material.dart';
// import 'package:helloworld/TrailDetailsScreen.dart';
// import 'package:helloworld/FamilyFriendlyTrailSelectionScreen.dart';
// import 'package:helloworld/GroupHikingExpeditionPlanningScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> filteredTrendingPlaces = dummyTrendingPlaces;
  List<Map<String, dynamic>> filteredAccommodationPlaces =
      dummyAccommodationPlaces;
  List<Map<String, dynamic>> filteredHikingPlaces = dummyHikingPlaces;
  bool showFirstImage = true;
  bool isAdmin = true;
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Center(
        title: Text(
          'Hiking Adventures',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Arial',
            // You can add more properties like letterSpacing, fontStyle, etc.
          ),
        ),
        // ),
        actions: [
          // Add admin panel button
          if (isAdmin)
            IconButton(
              icon: const Icon(Icons.admin_panel_settings),
              onPressed: () {
                // Navigate to admin panel
                Navigator.pushNamed(context, '/adminPanel');
              },
            ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search trails...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onChanged: (value) {
                setState(() {
                  filteredTrendingPlaces = dummyTrendingPlaces
                      .where((trail) => trail['name']
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();

                  filteredAccommodationPlaces = dummyAccommodationPlaces
                      .where((place) => place['name']
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();

                  filteredHikingPlaces = dummyHikingPlaces
                      .where((place) => place['name']
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                });
              },
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
                          itemCount: filteredTrendingPlaces.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Toggle the condition to switch between images
                                  filteredTrendingPlaces[index]
                                          ['showFirstImage'] =
                                      !filteredTrendingPlaces[index]
                                          ['showFirstImage'];
                                  // showFirstImage = !showFirstImage;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TrendingPlaceCard(
                                  placeName: filteredTrendingPlaces[index]
                                      ['name'],
                                  imageUrl: filteredTrendingPlaces[index]
                                          ['showFirstImage']
                                      ? filteredTrendingPlaces[index]['image']
                                      : filteredTrendingPlaces[index]
                                          ['imageUrl'],
                                ),
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
                          itemCount: filteredAccommodationPlaces.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Toggle the condition to switch between images
                                  filteredAccommodationPlaces[index]
                                          ['showFirstImage'] =
                                      !filteredAccommodationPlaces[index]
                                          ['showFirstImage'];
                                  // showFirstImage = !showFirstImage;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AccommodationPlaceCard(
                                  placeName: filteredAccommodationPlaces[index]
                                      ['name'],
                                  imageUrl: filteredAccommodationPlaces[index]
                                          ['showFirstImage']
                                      ? filteredAccommodationPlaces[index]
                                          ['image']
                                      : filteredAccommodationPlaces[index]
                                          ['imageUrl'],
                                ),
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
                          itemCount: filteredHikingPlaces.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Toggle the condition to switch between images
                                  filteredHikingPlaces[index]
                                          ['showFirstImage'] =
                                      !filteredHikingPlaces[index]
                                          ['showFirstImage'];
                                  // showFirstImage = !showFirstImage;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: HikingPlaceCard(
                                  placeName: filteredHikingPlaces[index]
                                      ['name'],
                                  imageUrl: filteredHikingPlaces[index]
                                          ['showFirstImage']
                                      ? filteredHikingPlaces[index]['image']
                                      : filteredHikingPlaces[index]['imageUrl'],
                                  description: filteredHikingPlaces[index]
                                      ['description'],
                                ),
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
            case 4:
              Navigator.pushNamed(context, '/adventure');
              break;
            case 5:
              // Handle the menu icon tap to open the additional routes.
              // For example:
              Navigator.pushNamed(context, '/moreRoutes');
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
            label: 'Family',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Group',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.details),
            label: 'find',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_sharp),
            label: 'Details',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu), // Add your desired menu icon here
            label:
                'More', // You can set the label to 'More' or any other appropriate text
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
    return
        // GestureDetector(
        // onTap: () {
        //   // Navigate to the details screen when the image is clicked
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) =>
        //           DetailsScreen(placeName: placeName, imageUrl: imageUrl),
        //     ),
        //   );
        // },
        Column(
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
    // );
  }
}

final List<Map<String, dynamic>> dummyTrendingPlaces = [
  {
    'name': 'Scenic Mountain',
    'image': 'Assets/2.jpg',
    'imageUrl':
        'https://www.gorilla-tracking.com/wp-content/uploads/2019/04/uganda-gorilla-trekking-tours-safaris-1-scaled.jpg',
    'showFirstImage': true,
  },
  {
    'name': 'Forest Trail',
    'image': 'Assets/3.jpg',
    'imageUrl': '',
    'showFirstImage': true,
  },
  {
    'name': 'Treking Trail',
    'image': 'Assets/6.jpg',
    'imageUrl': '',
    'showFirstImage': true,
  },
  {
    'name': 'Zoo Trail',
    'image': 'Assets/4.jpg',
    'imageUrl': '',
    'showFirstImage': true,
  },
  {
    'name': 'Scenic Mountain',
    'image': 'Assets/1.jpg',
    'imageUrl': '',
    'showFirstImage': true,
  },
  {
    'name': 'Group Trail',
    'image': 'Assets/7.jpg',
    'imageUrl': '',
    'showFirstImage': true,
  },
  // Add more trending places here
];

class AccommodationPlaceCard extends StatelessWidget {
  final String placeName;
  final String imageUrl;

  AccommodationPlaceCard({required this.placeName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return
        // GestureDetector(
        // onTap: () {
        //   // Navigate to the details screen when the image is clicked
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) =>
        //           DetailsScreen(placeName: placeName, imageUrl: imageUrl),
        //     ),
        //   );
        // },
        Column(
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
    // );
  }
}

final List<Map<String, dynamic>> dummyAccommodationPlaces = [
  {
    'name': 'Safaris',
    'image': 'Assets/rest2.jpg',
    'imageUrl': '',
    'showFirstImage': true,
  },
  {
    'name': 'Nile Resort',
    'image': 'Assets/rest.jpg',
    'imageUrl': '',
    'showFirstImage': true,
  },
  {
    'name': 'Telegraph Travel',
    'image': 'Assets/rest6.jpg',
    'imageUrl': '',
    'showFirstImage': true,
  },
  {
    'name': 'Outdoor Trail',
    'image': 'Assets/rest4.jpg',
    'imageUrl': '',
    'showFirstImage': true,
  },
  {
    'name': 'Scenic Beauty',
    'image': 'Assets/rest1.jpg',
    'imageUrl': '',
    'showFirstImage': true,
  },
  {
    'name': 'Group Trail',
    'image': 'Assets/rest7.jpg',
    'imageUrl': '',
    'showFirstImage': true,
  },
  // Add more trending places here
];

class HikingPlaceCard extends StatelessWidget {
  final String placeName;
  final String imageUrl;
  final String description;
  HikingPlaceCard(
      {required this.placeName,
      required this.imageUrl,
      required this.description});

  // void _showTrailDetails(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Container(
  //         padding: EdgeInsets.all(16),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               placeName,
  //               style: TextStyle(
  //                 fontSize: 24,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             SizedBox(height: 16),
  //             Image.asset(imageUrl),
  //             SizedBox(height: 16),
  //             Text(
  //               'Description:',
  //               style: TextStyle(
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //             SizedBox(height: 8),
  //             Text(
  //               description,
  //               style: TextStyle(
  //                 fontSize: 16,
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return
        // GestureDetector(
        // onTap: () {
        //   // _showTrailDetails(context); // Show trail details on tap
        //   // Navigate to the details screen when the image is clicked
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) =>
        //           DetailsScreen(placeName: placeName, imageUrl: imageUrl),
        //     ),
        //   );
        // },
        Column(
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
        // SizedBox(height: 8),
        // ElevatedButton(
        //   onPressed: () {
        //     _showTrailDetails(context); // Show trail details on button click
        //   },
        //   child: Text('See Details'),
        // ),
      ],
    );
    // );
  }
}

final List<Map<String, dynamic>> dummyHikingPlaces = [
  {
    'name': 'Safaris',
    'image': 'Assets/e.jpg',
    'imageUrl': '',
    'showFirstImage': true,
  },
  {
    'name': 'Nile Resort',
    'image': 'Assets/z.jpg',
    'imageUrl': '',
    'showFirstImage': true,
  },
  {
    'name': 'Telegraph Travel',
    'image': 'Assets/m.jpg',
    'imageUrl': '',
    'showFirstImage': true,
  },
  {
    'name': 'Outdoor Trail',
    'image': 'Assets/t.jpg',
    'imageUrl': '',
    'showFirstImage': true,
  },
  {
    'name': 'Scenic Beauty',
    'image': 'Assets/r.jpg',
    'imageUrl': '',
    'showFirstImage': true,
  },
  {
    'name': 'Group Trail',
    'image': 'Assets/g.jpg',
    'imageUrl': '',
    'showFirstImage': true,
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
