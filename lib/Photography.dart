import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class PhotographyPage extends StatefulWidget {
//   @override
//   _PhotographyPageState createState() => _PhotographyPageState();
// }

// class _PhotographyPageState extends State<PhotographyPage> {
//   List<String> hikingPhotos = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchPhotosFromServer();
//   }

//   Future<void> fetchPhotosFromServer() async {
//     final url =
//         'https://your-server-url.com/photos'; // Replace with your server's URL
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final List<dynamic> data = jsonDecode(response.body);
//         final List<String> photoUrls =
//             data.map((e) => e['url'].toString()).toList();
//         setState(() {
//           hikingPhotos = photoUrls;
//         });
//       } else {
//         // Handle error, such as displaying a snackbar with an error message.
//       }
//     } catch (e) {
//       // Handle error, such as displaying a snackbar with an error message.
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Photography Page'),
//       ),
//       body: ListView.builder(
//         itemCount: hikingPhotos.length,
//         itemBuilder: (context, index) {
//           final photoPath = hikingPhotos[index];
//           return GestureDetector(
//             onTap: () {
//               // Navigate to the full-screen view of the photo.
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       FullScreenPhotoView(photoPath: photoPath),
//                 ),
//               );
//             },
//             child: Container(
//               margin: EdgeInsets.all(8),
//               child: Image.network(
//                 photoPath,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Handle the action to upload a new photo.
//           // Implement your photo upload logic here.
//         },
//         child: Icon(Icons.add_a_photo),
//       ),
//     );
//   }
// }

// class FullScreenPhotoView extends StatelessWidget {
//   final String photoPath;

//   FullScreenPhotoView({required this.photoPath});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Image.network(photoPath),
//       ),
//     );
//   }
// }

class PhotographyPage extends StatefulWidget {
  @override
  _PhotographyPageState createState() => _PhotographyPageState();
}

class _PhotographyPageState extends State<PhotographyPage> {
  List<String> hikingPhotos = [
    'assets/hiking_photo_1.jpg',
    'assets/hiking_photo_2.jpg',
    'assets/hiking_photo_3.jpg',
    // Add more sample photo paths here or load photos dynamically from the server.
  ];
  File? _imageFile;

  Future<void> _takePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photography Page'),
      ),
      body: ListView.builder(
        itemCount: hikingPhotos.length,
        itemBuilder: (context, index) {
          final photoPath = hikingPhotos[index];
          return GestureDetector(
            onTap: () {
              // Navigate to the full-screen view of the photo.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FullScreenPhotoView(photoPath: photoPath),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(8),
              child: Image.asset(
                photoPath,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _takePhoto(); // Call the function to take a photo when the button is pressed.
          // Handle the action to upload a new photo.
          // Implement your photo upload logic here.
        },
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

class FullScreenPhotoView extends StatelessWidget {
  // final String photoPath;
  final String? photoPath;
  final File? imageFile; // Add a new field to hold the image File.

  FullScreenPhotoView({this.photoPath, this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: photoPath !=
                null // Display the image based on whether photoPath or imageFile is provided.
            ? Image.asset(photoPath!)
            : (imageFile != null
                ? Image.file(imageFile!)
                : Text('No photo available')),
      ),
    );
  }
}
