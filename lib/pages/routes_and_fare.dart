import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/database.dart';
import 'package:routeradar/widgets/customappbar.dart';

class RoutesAndFares extends StatefulWidget {
  const RoutesAndFares({super.key});

  @override
  State<RoutesAndFares> createState() => _RoutesAndFares();
}

class _RoutesAndFares extends State<RoutesAndFares> {
  final List<Map<String, dynamic>> routes = Database().routes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Routed & Fares",
      ),
      body: ListView.builder(
        itemCount: routes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              leading:
                  Icon(FontAwesome.route_solid, size: 30, color: Colors.white),
              title: Text(
                routes[index]["route"]!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Fare: ৳${routes[index]["fare"]}\nEstimated Time: ${routes[index]["estimatedJourneyTime"]}",
                style: TextStyle(
                  color: Theme.of(context).disabledColor,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.chevron_right,
                    color: Theme.of(context).primaryColor),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
