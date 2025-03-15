import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class LiveTrackingPage extends StatefulWidget {
  const LiveTrackingPage({super.key});

  @override
  State<LiveTrackingPage> createState() => _LiveTrackingPageState();
}

class _LiveTrackingPageState extends State<LiveTrackingPage> {
  double latitude = 23.8103; // Default location (Dhaka, Bangladesh)
  double longitude = 90.4125;

  void _updateLocation() {
    // Simulating location change (in real cases, you would update dynamically)
    setState(() {
      latitude += 0.001; // Simulating small movement
      longitude += 0.001;
    });
  }

  @override
  Widget build(BuildContext context) {
    // String mapUrl =
    //     "https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&markers=color:red%7C$latitude,$longitude&key=YOUR_GOOGLE_MAPS_API_KEY";

    String url = "https://i.ibb.co.com/rGdrkT9f/mapimage.jpg";

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey[700],
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.none,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(30)),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search location',
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[700],
                  ),
                  onSubmitted: (value) {
                    // Handle search action
                  },
                ),
              ),
              SizedBox(
                height: 690,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: _updateLocation,
                    icon: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[700],
                        ),
                        child: Icon(
                          FontAwesome.location_crosshairs_solid,
                          color: Colors.white,
                        )),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
