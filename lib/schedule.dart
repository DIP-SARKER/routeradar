import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/menu.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _Schedule();
}

class _Schedule extends State<Schedule> {
  int selectedDateIndex = 0;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 3) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuPage()),
        );
      }
    });
  }

  final List<Map<String, String>> schedule = [
    {
      "time": "06:30 AM",
      "route": "DSC to Tongi",
      "bus": "Surjomukhi 100",
      "driver": "Abdul Karim"
    },
    {
      "time": "08:00 AM",
      "route": "DSC to Rajlokkhi",
      "bus": "Surjomukhi 101",
      "driver": "Rahim Uddin"
    },
    {
      "time": "09:00 AM",
      "route": "Tongi to DSC",
      "bus": "Oporajita 102",
      "driver": "Sohail Rana"
    },
    {
      "time": "10:30 AM",
      "route": "Rajlokkhi to DSC",
      "bus": "Oporajita 103",
      "driver": "Hasan Mahmud"
    },
    {
      "time": "12:00 PM",
      "route": "DSC to Dhanmondi",
      "bus": "Surjomukhi 104",
      "driver": "Shafiqul Islam"
    },
    {
      "time": "01:30 PM",
      "route": "Dhanmondi to DSC",
      "bus": "Oporajita 105",
      "driver": "Mizanur Rahman"
    },
    {
      "time": "03:00 PM",
      "route": "DSC to Mirpur",
      "bus": "Surjomukhi 106",
      "driver": "Kamrul Hasan"
    },
    {
      "time": "04:30 PM",
      "route": "Mirpur to DSC",
      "bus": "Oporajita 107",
      "driver": "Faruq Ahmed"
    },
    {
      "time": "05:30 PM",
      "route": "DSC to Rampura",
      "bus": "Surjomukhi 108",
      "driver": "Jahangir Alam"
    },
    {
      "time": "07:00 PM",
      "route": "Rampura to DSC",
      "bus": "Oporajita 109",
      "driver": "Nasir Uddin"
    },
    {
      "time": "08:30 PM",
      "route": "DSC to Narayanganj",
      "bus": "Surjomukhi 110",
      "driver": "Alamgir Hossain"
    },
    {
      "time": "09:30 PM",
      "route": "Narayanganj to DSC",
      "bus": "Oporajita 111",
      "driver": "Rakib Hasan"
    },
    {
      "time": "11:00 PM",
      "route": "DSC to Tongi",
      "bus": "Surjomukhi 112",
      "driver": "Shahadat Hossain"
    },
    {
      "time": "12:30 AM",
      "route": "Tongi to DSC",
      "bus": "Oporajita 113",
      "driver": "Belal Ahmed"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _onItemTapped(3);
            }),
        title: Text("Transport Schedule"),
        toolbarHeight: 100,
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(HeroIcons.arrow_path_rounded_square),
              onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: schedule.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Colors.grey[900],
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    title: Text(
                      schedule[index]['route']!,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text("Time: ${schedule[index]['time']}",
                            style: TextStyle(color: Colors.grey)),
                        Text("Bus: ${schedule[index]['bus']}",
                            style: TextStyle(color: Colors.grey)),
                        Text("Driver: ${schedule[index]['driver']}",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    leading:
                        Icon(FontAwesome.bus_solid, color: Colors.blueAccent),
                    trailing: IconButton(
                      icon: Icon(Icons.info_outline_rounded,
                          color: Colors.blueAccent),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Colors.grey[900],
                            title: Text("Bus Details"),
                            content: Text(
                              "Bus: ${schedule[index]['bus']}\nDriver: ${schedule[index]['driver']}\nTime: ${schedule[index]['time']}\nRoute: ${schedule[index]['route']}",
                              style: TextStyle(color: Colors.white),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Close",
                                    style: TextStyle(color: Colors.blueAccent)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
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
            icon: Icon(Icons.menu),
            label: "Menu",
          ),
        ],
      ),
    );
  }
}
