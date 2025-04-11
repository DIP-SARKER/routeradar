import 'package:flutter/material.dart';
import 'package:routeradar/pages/live_tracking.dart';
import 'package:routeradar/pages/profile_page.dart';
import 'package:routeradar/pages/request_ride.dart';
import 'package:routeradar/pages/schedule.dart';
import 'package:routeradar/widgets/bnavbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of pages corresponding to navigation items
  final List<Widget> _pages = [
    const Schedule(),
    const LiveTrackingPage(),
    RequestRidePage(),
    const ProfileSettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
