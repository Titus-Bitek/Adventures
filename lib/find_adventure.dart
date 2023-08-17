import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:latlong2/latlong.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Adventure extends StatefulWidget {
  @override
  _AdventureState createState() => _AdventureState();
}

class _AdventureState extends State<Adventure> {
  bool _darkmode = false; // false means dark mode off; true means dark mode on
  int counter = 0; // counter for switch onChanged

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('PiniC AND ADVENTURES IN AND AROUND KAMPALA'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(0.3136, 32.5811), // Centered on Kampala, Uganda
          zoom: 10.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: _darkmode
                ? "https://api.mapbox.com/styles/v1/sharvai101/ckeprilzn1ze11apdg00u5ym4/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2hhcnZhaTEwMSIsImEiOiJja2VwbmZocTQzdnF5MnNsdDV1a3hmcGF1In0.jn75qR8gTdrZpy7cIvKlxQ"
                : "https://api.mapbox.com/styles/v1/sharvai101/ckev14dyrakva19lqj0z9rzn9/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2hhcnZhaTEwMSIsImEiOiJja2VwbmZocTQzdnF5MnNsdDV1a3hmcGF1In0.jn75qR8gTdrZpy7cIvKlxQ",
            additionalOptions: {
              'accessToken':
                  'pk.eyJ1Ijoic2hhcnZhaTEwMSIsImEiOiJja2VwbmZocTQzdnF5MnNsdDV1a3hmcGF1In0.jn75qR8gTdrZpy7cIvKlxQ',
              'id': 'mapbox.mapbox-streets-v7',
            },
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(0.3136, 32.5811), // Kampala, Uganda
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.location_city,
                    color: Colors.blue[400],
                    size: 40,
                  ),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(0.3132, 32.5984), // Hiking location 1 in Kampala
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.place,
                    color: Colors.green[400],
                    size: 40,
                  ),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(0.3204, 32.5740), // Hiking location 2 in Kampala
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.place,
                    color: Colors.red[400],
                    size: 40,
                  ),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(0.3609, 32.7587), // Mabira Forest
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.place,
                    color: Colors.green[400],
                    size: 40,
                  ),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(
                    0.3609, 32.7587), // Nearest accommodation to Mabira Forest
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.hotel,
                    color: Colors.black54,
                    size: 40,
                  ),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(2.1960, 31.9265), // Murchison Falls
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.place,
                    color: Colors.green[400],
                    size: 40,
                  ),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(0.0507, 32.4640), // Entebbe Zoo
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.place,
                    color: Colors.green[400],
                    size: 40,
                  ),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(
                    0.0507, 32.4640), // Nearest accommodation to Entebbe Zoo
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.hotel,
                    color: Colors.black54,
                    size: 40,
                  ),
                ),
              ),
              // Add more markers for other hiking locations in Kampala
              Marker(
                width: 80.0,
                height: 80.0,
                point:
                    LatLng(0.3136, 32.5711), // Nearest accommodation to Kampala
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.hotel,
                    color: Colors.black54,
                    size: 40,
                  ),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(0.3132,
                    32.6084), // Nearest accommodation to Hiking location 1
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.hotel,
                    color: Colors.black54,
                    size: 40,
                  ),
                ),
              ),
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(0.3204,
                    32.5640), // Nearest accommodation to Hiking location 2
                builder: (ctx) => Container(
                  child: Icon(
                    Icons.hotel,
                    color: Colors.black54,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 250),
        child: RotatedBox(
          quarterTurns: 3,
          child: LiteRollingSwitch(
            value: false, // Initial value
            textOn: 'DARK',
            textOff: 'LIGHT',
            colorOn: Colors.blueGrey[700],
            colorOff: Colors.yellow[700],
            iconOn: Icons.nightlight_round,
            iconOff: Icons.wb_sunny,
            textSize: 16.0,
            onChanged: (value) {
              if (counter > 0) {
                setState(() {
                  _darkmode = !_darkmode;
                });
              }
              counter += 1;
            },
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: Adventure()));
