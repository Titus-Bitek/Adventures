import 'package:flutter/material.dart';

class GroupHikingExpeditionPlanningScreen extends StatelessWidget {
  final String trailName;
  final DateTime dateTime;
  final int maxParticipants;

  GroupHikingExpeditionPlanningScreen({
    required this.trailName,
    required this.dateTime,
    required this.maxParticipants,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hiking Expedition Planning'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trail: $trailName',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Date and Time: ${dateTime.toString()}'),
            SizedBox(height: 8),
            Text('Max Participants: $maxParticipants'),
            SizedBox(height: 16),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // Add a TextFormField or a TextField to allow the organizer to add description.

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Create Hiking Event'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
