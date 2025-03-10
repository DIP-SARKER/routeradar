import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class RoutesAndFares extends StatefulWidget {
  const RoutesAndFares({super.key});

  @override
  State<RoutesAndFares> createState() => _RoutesAndFares();
}

class _RoutesAndFares extends State<RoutesAndFares> {
  final List<Map<String, String>> routes = [
    {"route": "DSC to Rajlokkhi", "fare": "৳30", "time": "40 minutes"},
    {"route": "DSC to Dhanmondi", "fare": "৳40", "time": "60 minutes"},
    {"route": "DSC to Mirpur", "fare": "৳25", "time": "40 minutes"},
    {"route": "DSC to Narayanganj", "fare": "৳50", "time": "1 Hour 40 minutes"},
    {"route": "DSC to Tongi", "fare": "৳35", "time": "45 minutes"},
    {"route": "DSC to Rampura", "fare": "৳40", "time": "55 minutes"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routes and Fares"),
        toolbarHeight: 100,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 13),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              leading: Icon(FontAwesome.bus_solid, color: Colors.blueAccent),
              title: Text(
                routes[index]["route"]!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Fare: ${routes[index]["fare"]}\nEstimated Time: ${routes[index]["time"]}"),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
