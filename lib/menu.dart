import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/feedback.dart';
import 'package:routeradar/lost_and_found.dart';
import 'package:routeradar/routes_and_fare.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPage();
}

class _MenuPage extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text("Route-Radar"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 30),
                Container(
                  width: 60, // Adjust this to fit your border needs
                  height: 60, // Adjust this to fit your border needs
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blueAccent, // Set your border color here
                      width: 3.0, // Border width
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/IMG.jpg"),
                  ),
                ),
                SizedBox(width: 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "XX XXXX XXXX",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "221-15-XXXX",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 30, bottom: 10),
            leading: const Icon(
              HeroIcons.calendar_days,
              size: 30,
            ),
            horizontalTitleGap: 30.0,
            title: const Text(
              "Transport Schedule",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 30, bottom: 10),
            leading: const Icon(
              Iconsax.location_bold,
              size: 30,
            ),
            horizontalTitleGap: 30.0,
            title: const Text(
              "Live Tracking",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 30, bottom: 10),
            leading: const Icon(
              Icons.local_taxi,
              size: 30,
            ),
            horizontalTitleGap: 30.0,
            title: const Text(
              "Request a Ride",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 30, bottom: 10),
            leading: const Icon(
              LineAwesome.map_marked_alt_solid,
              size: 30,
            ),
            horizontalTitleGap: 30.0,
            title: const Text(
              "Routes & Fares",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RoutesAndFares()),
              );
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 30, bottom: 10),
            leading: const Icon(
              FontAwesome.user_tie_solid,
              size: 30,
            ),
            horizontalTitleGap: 30.0,
            title: const Text(
              "Profile & Settings",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 30, bottom: 10),
            leading: const Icon(
              HeroIcons.phone_arrow_up_right,
              size: 30,
            ),
            horizontalTitleGap: 30.0,
            title: const Text(
              "Emergency Contacts",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 30, bottom: 10),
            leading: const Icon(
              Icons.find_in_page,
              size: 30,
            ),
            horizontalTitleGap: 30.0,
            title: const Text(
              "Lost & Found",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LostAndFound()),
              );
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 30),
            leading: const Icon(
              HeroIcons.chat_bubble_bottom_center_text,
              size: 30,
            ),
            horizontalTitleGap: 30.0,
            title: const Text(
              "Feedback & Complaints",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FeedbackComplaintsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
