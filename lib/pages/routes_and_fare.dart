import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/database/database.dart';
import 'package:routeradar/widgets/customappbar.dart';

class RoutesAndFares extends StatefulWidget {
  const RoutesAndFares({super.key});

  @override
  State<RoutesAndFares> createState() => _RoutesAndFares();
}

class _RoutesAndFares extends State<RoutesAndFares> {
  late Future<List<Map<String, dynamic>>> _busInfoFuture;

  @override
  void initState() {
    super.initState();
    _busInfoFuture = database.value.getBusInfo(); // calling your method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Routes & Fares",
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _busInfoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final routes = snapshot.data ?? [];

          if (routes.isEmpty) {
            return const Center(child: Text("No routes found."));
          }

          return ListView.builder(
            itemCount: routes.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 0,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  leading: Icon(
                    FontAwesome.route_solid,
                    size: 30,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    '${routes[index]["startPoint"]} to ${routes[index]["endPoint"]}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Fare: ৳${routes[index]["fare"] ?? "N/A"}\nEstimated Time: ${routes[index]["estimatedJourneyTime"] ?? "N/A"}",
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
          );
        },
      ),
    );
  }
}
