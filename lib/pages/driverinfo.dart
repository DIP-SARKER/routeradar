import 'package:flutter/material.dart';
import 'package:routeradar/database/database.dart';
import 'package:routeradar/widgets/customappbar.dart';

class DriverInfo extends StatefulWidget {
  const DriverInfo({super.key});

  @override
  State<DriverInfo> createState() => _DriverInfo();
}

class _DriverInfo extends State<DriverInfo> {
  late Future<List<Map<String, dynamic>>> _transportRoutes;

  @override
  void initState() {
    super.initState();
    _transportRoutes = database.value.getBusInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Drivers Information",
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _transportRoutes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text("No driver information available."));
          }

          final transportRoutes = snapshot.data!;

          return ListView.builder(
            itemCount: transportRoutes.length,
            itemBuilder: (context, index) {
              final route = transportRoutes[index];
              return Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  title: Text(
                    "${route["driver"]["name"]}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bus: ${route["bus"]}",
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).disabledColor)),
                      Text("Phone: ${route["driver"]["phone"]}",
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).disabledColor)),
                      Text("Age: ${route["driver"]["age"]} years",
                          style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).disabledColor)),
                    ],
                  ),
                  trailing: IconButton(
                    icon:
                        Icon(Icons.call, color: Theme.of(context).primaryColor),
                    onPressed: () {
                      // Add phone call logic here if needed
                    },
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
