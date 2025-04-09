import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/database.dart';
import 'package:routeradar/widgets/bnavbar.dart';
import 'package:routeradar/widgets/customappbar.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _Schedule();
}

class _Schedule extends State<Schedule> {
  final List<Map<String, dynamic>> businfo = Database().busInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Transport Schedule",
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: businfo.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    title: Text(
                      "${businfo[index]['startPoint']} to ${businfo[index]['endPoint']}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text("Time: ${businfo[index]['startTime']}",
                            style: TextStyle(
                                color: Theme.of(context).disabledColor)),
                        Text("Bus: ${businfo[index]['bus']}",
                            style: TextStyle(
                                color: Theme.of(context).disabledColor)),
                        Text("Driver: ${businfo[index]['driver']['name']}",
                            style: TextStyle(
                                color: Theme.of(context).disabledColor)),
                      ],
                    ),
                    leading: Icon(FontAwesome.bus_solid,
                        color: Theme.of(context).primaryColor),
                    trailing: IconButton(
                      icon: Icon(Icons.info_outline_rounded,
                          color: Theme.of(context).primaryColor),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Colors.grey[900],
                            title: Text("Bus Details"),
                            content: Text(
                              "Bus: ${businfo[index]['bus']}\nDriver: ${businfo[index]['driver']['name']}\nTime: ${businfo[index]['startTime']}\nRoute: ${businfo[index]['startPoint']} to ${businfo[index]['endPoint']}\nStart Point: ${businfo[index]['startPoint']}",
                              style: TextStyle(color: Colors.white),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Close",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor)),
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
      bottomNavigationBar: CustomNavBar(),
    );
  }
}

// BottomNavigationBar(
//         // backgroundColor: Colors.black,
//         selectedItemColor: Theme.of(context).primaryColor,
//         unselectedItemColor: Colors.white,
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(HeroIcons.calendar_days),
//             label: "Schedule",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Iconsax.location_bold),
//             label: "Live Tracking",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.local_taxi),
//             label: "Request Ride",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(HeroIcons.bars_4),
//             label: "Menu",
//           ),
//         ],
//       ),
