import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/pages/bookticketpage.dart';
import 'package:routeradar/pages/live_tracking.dart';
import 'package:routeradar/pages/profile_page.dart';
import 'package:routeradar/pages/schedule.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBar();
}

class _CustomNavBar extends State<CustomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) async {
    setState(() => _selectedIndex = index);
    switch (index) {
      case 0:
        Get.to(
          () => Schedule(),
          transition: Transition.downToUp,
          duration: const Duration(milliseconds: 1300),
        );
        break;
      case 1:
        Get.to(
          () => LiveTrackingPage(),
          transition: Transition.downToUp,
          duration: const Duration(milliseconds: 1300),
        );
        break;
      case 2:
        Get.to(
          () => BookTicketPage(),
          transition: Transition.downToUp,
          duration: const Duration(milliseconds: 1300),
        );
        break;
      case 3:
        Get.to(
          () => ProfileSettingsPage(),
          transition: Transition.downToUp,
          duration: const Duration(milliseconds: 1300),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // backgroundColor: Colors.black,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.white,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,

      items: [
        BottomNavigationBarItem(
          icon: Icon(HeroIcons.calendar_days),
          label: "Schedule",
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.location_bold),
          label: "Live Tracking",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.confirmation_number),
          label: "Book Tickets",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesome.user_tie_solid),
          label: "Profile",
        ),
      ],
    );
  }
}
