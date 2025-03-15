import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/driverinfo.dart';
import 'package:routeradar/emergency_contacts.dart';
import 'package:routeradar/feedback.dart';
import 'package:routeradar/live_tracking.dart';
import 'package:routeradar/lost_and_found.dart';
import 'package:routeradar/profile_page.dart';
import 'package:routeradar/request_ride.dart';
import 'package:routeradar/routes_and_fare.dart';
import 'package:routeradar/schedule.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      {required double iconSize,
      required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: ListTile(
        leading: Icon(icon, size: iconSize, color: Colors.white),
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          "Route-Radar",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 30),
              GestureDetector(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 3.0,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/IMG.png"),
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            image: DecorationImage(
                              image: AssetImage("assets/IMG.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
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
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          _buildSectionTitle("Transport Services"),
          _buildMenuItem(
              iconSize: 35.0,
              icon: HeroIcons.calendar_days,
              title: "Transport Schedule",
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Schedule()),
                  )),
          _buildMenuItem(
            iconSize: 35.0,
            icon: Iconsax.location_bold,
            title: "Live Tracking",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LiveTrackingPage()),
            ),
          ),
          _buildMenuItem(
            iconSize: 35.0,
            icon: Icons.local_taxi,
            title: "Request a Ride",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RequestRidePage()),
            ),
          ),
          _buildMenuItem(
            iconSize: 35.0,
            icon: LineAwesome.map_marked_alt_solid,
            title: "Routes & Fares",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RoutesAndFares()),
            ),
          ),
          const Divider(),
          _buildSectionTitle("User & Driver Info"),
          _buildMenuItem(
              iconSize: 28.0,
              icon: FontAwesome.address_card,
              title: "Driver Information",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DriverInfo()),
                );
              }),
          _buildMenuItem(
            iconSize: 28.0,
            icon: FontAwesome.user_tie_solid,
            title: "Profile & Settings",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProfileSettingsPage()),
            ),
          ),
          const Divider(),
          _buildSectionTitle("Support & Assistance"),
          _buildMenuItem(
            iconSize: 28.0,
            icon: HeroIcons.phone_arrow_up_right,
            title: "Emergency Contacts",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const EmergencyContactsPage()),
            ),
          ),
          _buildMenuItem(
            iconSize: 30.0,
            icon: Icons.find_in_page,
            title: "Lost & Found",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LostAndFound()),
            ),
          ),
          _buildMenuItem(
            iconSize: 30.0,
            icon: HeroIcons.chat_bubble_bottom_center_text,
            title: "Feedback & Complaints",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const FeedbackComplaintsPage()),
            ),
          ),
        ],
      ),
    );
  }
}
