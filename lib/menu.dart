import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/driverinfo.dart';
import 'package:routeradar/emergency_contacts.dart';
import 'package:routeradar/feedback.dart';
import 'package:routeradar/lost_and_found.dart';
import 'package:routeradar/profile_page.dart';
import 'package:routeradar/request_ride.dart';
import 'package:routeradar/routes_and_fare.dart';
import 'package:routeradar/schedule.dart';

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
                      color: Theme.of(context)
                          .primaryColor, // Set your border color here
                      width: 3.0, // Border width
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/IMG.png"),
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
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).disabledColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Theme.of(context).primaryColor,
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
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        Schedule(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: child,
                      );
                    },
                  ));
            },
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
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        RequestRidePage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: child,
                      );
                    },
                  ));
            },
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
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        RoutesAndFares(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: child,
                      );
                    },
                  ));
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 30, bottom: 10),
            leading: const Icon(
              FontAwesome.address_card,
              size: 25,
            ),
            horizontalTitleGap: 30.0,
            title: const Text(
              "Driver Information",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        DriverInfo(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: child,
                      );
                    },
                  ));
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
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ProfileSettingsPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: child,
                      );
                    },
                  ));
            },
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
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        EmergencyContactsPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: child,
                      );
                    },
                  ));
            },
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
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        LostAndFound(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: child,
                      );
                    },
                  ));
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
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        FeedbackComplaintsPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return ScaleTransition(
                        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: child,
                      );
                    },
                  ));
            },
          ),
        ],
      ),
    );
  }
}
