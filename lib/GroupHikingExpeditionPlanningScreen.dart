import 'package:flutter/material.dart';
// import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class GroupHikingExpeditionPlanningScreen extends StatefulWidget {
  final String trailName;
  final DateTime dateTime;
  final int maxParticipants;

  GroupHikingExpeditionPlanningScreen({
    required this.trailName,
    required this.dateTime,
    required this.maxParticipants,
  });

  @override
  _GroupHikingExpeditionPlanningScreenState createState() =>
      _GroupHikingExpeditionPlanningScreenState();
}

class _GroupHikingExpeditionPlanningScreenState
    extends State<GroupHikingExpeditionPlanningScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int nextEventId = 1;
  String trailName = '';
  DateTime dateTime = DateTime.now();
  int maxParticipants = 0;
  String description = '';

  List<HikingEvent> hikingEvents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hiking Expedition Planning'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trail: ${widget.trailName}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text('Date and Time: ${widget.dateTime.toString()}'),
              SizedBox(height: 8),
              Text('Max Participants: ${widget.maxParticipants}'),
              SizedBox(height: 16),
              Text(
                'Description:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),

              // Add a TextFormField or a TextField to allow the organizer to add description.

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    HikingEvent newEvent = HikingEvent(
                      id: nextEventId,
                      trailName: widget.trailName,
                      dateTime: widget.dateTime,
                      maxParticipants: widget.maxParticipants,
                      description: description,
                    );

                    setState(() {
                      hikingEvents.add(newEvent);
                    });

                    // Clear form fields
                    _formKey.currentState!.reset();
                  }
                },
                child: Text('Create Hiking Event'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: hikingEvents.length,
                  itemBuilder: (context, index) {
                    final hikingEvent = hikingEvents[index];
                    return ListTile(
                      title: Text(hikingEvent.trailName),
                      subtitle: Text(
                          'Date and Time: ${hikingEvent.dateTime.toString()}\nMax Participants: ${hikingEvent.maxParticipants}\nDescription: ${hikingEvent.description}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: Icon(Icons.text_snippet),
                                        title: Text('Share Hiking Event'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          _shareHikingEvent(hikingEvent);
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.link),
                                        title: Text('Share Link'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          _shareLink(hikingEvent);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _showEditDialog(index);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                hikingEvents.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _shareHikingEvent(HikingEvent hikingEvent) {
    String shareText =
        'Join us for a hiking event!\n\nTrail: ${hikingEvent.trailName}\nDate and Time: ${hikingEvent.dateTime.toString()}\nMax Participants: ${hikingEvent.maxParticipants}\nDescription: ${hikingEvent.description}';

    Share.share(shareText, subject: 'Hiking Event Details');
  }

  void _shareLink(HikingEvent hikingEvent) async {
    String link =
        'https://.com/hiking_event/${hikingEvent.id}'; // Replace with your app's deep link

    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }

  void _showEditDialog(int index) async {
    HikingEvent hikingEvent = hikingEvents[index];
    DateTime selectedDate = hikingEvent.dateTime;
    TimeOfDay selectedTime = TimeOfDay.fromDateTime(hikingEvent.dateTime);
    String editedTrailName = hikingEvent.trailName;
    int editedMaxParticipants = hikingEvent.maxParticipants;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Hiking Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: hikingEvent.trailName,
                decoration: InputDecoration(labelText: 'Trail Name'),
                onChanged: (value) {
                  editedTrailName = value;
                },
              ),
              // DatePicker(
              //   initialDate: selectedDate,
              //   firstDate: DateTime.now(),
              //   lastDate: DateTime(2101),
              //   onDateChanged: (date) {
              //     setState(() {
              //       selectedDate = date;
              //     });
              //   },
              // ),
              SizedBox(height: 10),
              // TimePicker(
              //   initialTime: selectedTime,
              //   onTimeChanged: (time) {
              //     setState(() {
              //       selectedTime = time;
              //     });
              //   },
              // ),
              SizedBox(height: 10),
              TextFormField(
                initialValue: hikingEvent.maxParticipants.toString(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Max Participants',
                ),
                onChanged: (value) {
                  editedMaxParticipants = int.parse(value);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  hikingEvent.dateTime = DateTime(
                    selectedDate.year,
                    selectedDate.month,
                    selectedDate.day,
                    selectedTime.hour,
                    selectedTime.minute,
                  );
                  hikingEvents[index].trailName = editedTrailName;
                  hikingEvent.maxParticipants = editedMaxParticipants;
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class HikingEvent {
  int id;
  String trailName;
  DateTime dateTime;
  int maxParticipants;
  String description;

  HikingEvent({
    required this.id,
    required this.trailName,
    required this.dateTime,
    required this.maxParticipants,
    required this.description,
  });
}

void main() {
  runApp(MaterialApp(
    home: GroupHikingExpeditionPlanningScreen(
      trailName: 'Create Trail',
      dateTime: DateTime.now(),
      maxParticipants: 10,
    ),
  ));
}
