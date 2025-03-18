import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/pages/live_tracking.dart';
import 'package:routeradar/pages/menu.dart';
import 'package:routeradar/pages/request_ride.dart';


class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBar();
}

class _CustomNavBar extends State<CustomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) async {
    if (index == 1) {
      Get.to(
        () => LiveTrackingPage(),
        transition: Transition.downToUp,
        duration: Duration(milliseconds: 1300),
      );

      setState(() => _selectedIndex = 0);
    } else if (index == 2) {
      Get.to(
        () => RequestRidePage(),
        transition: Transition.downToUp,
        duration: Duration(milliseconds: 1300),
      );

      setState(() => _selectedIndex = 0);
    } else if (index == 3) {
      Get.to(
        () => MenuPage(),
        transition: Transition.rightToLeftWithFade,
        duration: Duration(milliseconds: 1300),
      );

      setState(() => _selectedIndex = 0);
    } else {
      setState(() => _selectedIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.black,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(HeroIcons.calendar_days),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.location_bold),
            label: "Live Tracking",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_taxi),
            label: "Request Ride",
          ),
          BottomNavigationBarItem(
            icon: Icon(HeroIcons.bars_4),
            label: "Menu",
          ),
        ],
      ),
    );
  }
}
