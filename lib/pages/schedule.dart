import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/database/database.dart';
import 'package:routeradar/widgets/customappbar.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _Schedule();
}

class _Schedule extends State<Schedule> {
  late Future<List<Map<String, dynamic>>> _busInfoFuture;

  @override
  void initState() {
    super.initState();
    _busInfoFuture = database.value.getBusInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Transport Schedule",
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

          final businfo = snapshot.data ?? [];

          if (businfo.isEmpty) {
            return const Center(child: Text("No schedule available."));
          }

          return ListView.builder(
            itemCount: businfo.length,
            itemBuilder: (context, index) {
              final item = businfo[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: Text(
                    "${item['startPoint']} to ${item['endPoint']}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        "Time: ${item['startTime']}",
                        style: TextStyle(color: Theme.of(context).disabledColor),
                      ),
                      Text(
                        "Bus: ${item['bus']}",
                        style: TextStyle(color: Theme.of(context).disabledColor),
                      ),
                      Text(
                        "Driver: ${item['driver']['name']}",
                        style: TextStyle(color: Theme.of(context).disabledColor),
                      ),
                    ],
                  ),
                  leading: Icon(
                    FontAwesome.bus_solid,
                    color: Theme.of(context).primaryColor,
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.info_outline_rounded,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: Colors.grey[900],
                          title: const Text("Bus Details"),
                          content: Text(
                            "Bus: ${item['bus']}\nDriver: ${item['driver']['name']}\nTime: ${item['startTime']}\nRoute: ${item['startPoint']} to ${item['endPoint']}\nStart Point: ${item['startPoint']}",
                            style: const TextStyle(color: Colors.white),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "Close",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
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
