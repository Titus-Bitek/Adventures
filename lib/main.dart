import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helloworld/intropage.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_options.dart';
import 'package:helloworld/homepage.dart';
import 'package:helloworld/TrailDetailsScreen.dart';
import 'package:helloworld/FamilyFriendlyTrailSelectionScreen.dart';
import 'package:helloworld/GroupHikingExpeditionPlanningScreen.dart';
import 'find_adventure.dart';
import 'more_route_screen.dart';
import 'admin.dart';

Future main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  )); // this is to remove the status bar at the top of the screen
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hiking Adventures',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: IntroPage(),
      routes: {
        '/adminPanel': (context) => AdminPanelScreen(),
        '/trailDetails': (context) => TrailDetailsScreen(
              trailName: 'Choose Trail',
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
              trailName: 'Choose Trail for Group',
              dateTime: DateTime.now(),
              maxParticipants: 10,
            ),
        '/adventure': (context) => Adventure(),
        '/moreRoutes': (context) => PhotographyPage(),
      },
    );
  }
}
