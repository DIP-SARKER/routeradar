import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _Schedule();
}

class _Schedule extends State<Schedule> {
  int selectedDateIndex = 0;
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
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 150,
              child: DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      LineAwesome.shuttle_van_solid,
                    ),
                    IconButton(
                      icon: Icon(HeroIcons.x_mark),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(HeroIcons.home), // Home icon
              title: Text("Home"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Iconsax.location_bold), // Bus tracking icon
              title: Text("Live Tracking"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.local_taxi), // Ride request icon
              title: Text("Request a Ride"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(LineAwesome.map_marked_alt_solid), // Routes icon
              title: Text("Routes & Fares"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                FontAwesome.user_tie_solid,
                size: 22,
              ), // Profile icon
              title: Text("Profile & Settings"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                HeroIcons.phone_arrow_up_right,
                size: 22,
              ), // Emergency contact icon
              title: Text("Emergency Contacts"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.find_in_page), // Lost & Found icon
              title: Text("Lost & Found"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(HeroIcons.chat_bubble_bottom_center_text), // Feedback icon
              title: Text("Feedback & Complaints"),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Transport Schedule"),
        toolbarHeight: 100,
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
                      icon:
                          Icon(Icons.info_outline_rounded, color: Colors.white),
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
    );
  }
}
