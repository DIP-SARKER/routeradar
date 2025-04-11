import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.white,
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
          icon: Icon(FontAwesome.user_tie_solid),
          label: "Profile",
        ),
      ],
    );
  }
}