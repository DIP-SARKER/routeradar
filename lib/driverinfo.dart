import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/menu.dart';

class DriverInfo extends StatefulWidget {
  const DriverInfo({super.key});

  @override
  State<DriverInfo> createState() => _DriverInfo();
}

class _DriverInfo extends State<DriverInfo> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 3) {
        {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  MenuPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        }
      }
    });
  }

  final List<Map<String, String>> transportRoutes = [
    {
      "bus": "Surjomukhi 100",
      "driver": "Abdul Karim",
      "phone": "01712345678",
      "age": "45"
    },
    {
      "bus": "Surjomukhi 101",
      "driver": "Rahim Uddin",
      "phone": "01723456789",
      "age": "50"
    },
    {
      "bus": "Oporajita 102",
      "driver": "Sohail Rana",
      "phone": "01734567890",
      "age": "40"
    },
    {
      "bus": "Oporajita 103",
      "driver": "Hasan Mahmud",
      "phone": "01745678901",
      "age": "48"
    },
    {
      "bus": "Surjomukhi 104",
      "driver": "Shafiqul Islam",
      "phone": "01756789012",
      "age": "55"
    },
    {
      "bus": "Oporajita 105",
      "driver": "Mizanur Rahman",
      "phone": "01767890123",
      "age": "42"
    },
    {
      "bus": "Surjomukhi 106",
      "driver": "Kamrul Hasan",
      "phone": "01778901234",
      "age": "47"
    },
    {
      "bus": "Oporajita 107",
      "driver": "Faruq Ahmed",
      "phone": "01789012345",
      "age": "53"
    },
    {
      "bus": "Surjomukhi 108",
      "driver": "Jahangir Alam",
      "phone": "01790123456",
      "age": "49"
    },
    {
      "bus": "Oporajita 109",
      "driver": "Nasir Uddin",
      "phone": "01701234567",
      "age": "44"
    },
    {
      "bus": "Surjomukhi 110",
      "driver": "Alamgir Hossain",
      "phone": "01712345679",
      "age": "52"
    },
    {
      "bus": "Oporajita 111",
      "driver": "Rakib Hasan",
      "phone": "01723456780",
      "age": "46"
    },
    {
      "bus": "Surjomukhi 112",
      "driver": "Shahadat Hossain",
      "phone": "01734567891",
      "age": "51"
    },
    {
      "bus": "Oporajita 113",
      "driver": "Belal Ahmed",
      "phone": "01745678902",
      "age": "50"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Driver Information"),
        toolbarHeight: 100,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: transportRoutes.length,
        itemBuilder: (context, index) {
          final route = transportRoutes[index];
          return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              title: Text(
                "${route["driver"]}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bus: ${route["bus"]}",
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).disabledColor)),
                  Text("Phone: ${route["phone"]}",
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).disabledColor)),
                  Text("Age: ${route["age"]} years",
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).disabledColor)),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.call, color: Theme.of(context).primaryColor),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
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
