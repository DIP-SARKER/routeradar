import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/database/database.dart';
import 'package:routeradar/widgets/customappbar.dart';

class LostAndFound extends StatefulWidget {
  const LostAndFound({super.key});

  @override
  State<LostAndFound> createState() => _LostAndFoundState();
}

class _LostAndFoundState extends State<LostAndFound> {
  List<Map<String, String>> items = [];

  @override
  void initState() {
    super.initState();
    _fetchEmergencyContacts();
  }

  Future<void> _fetchEmergencyContacts() async {
    final data = await database.value.getLostFound();
    if (mounted) {
      setState(() {
        items = List<Map<String, dynamic>>.from(data)
            .map((e) => {
                  'item': e['item'].toString(),
                  'location': e['location'].toString(),
                  'status': e['status'].toString(),
                })
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Lost & Found",
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 20, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              items[index]["status"] == "lost"
                                  ? FontAwesome.triangle_exclamation_solid
                                  : FontAwesome.check_solid,
                              color: items[index]["status"] == "lost"
                                  ? Colors.redAccent
                                  : const Color.fromARGB(255, 9, 141, 13),
                              size: 30,
                            ),
                            SizedBox(height: 3),
                            Text(
                              items[index]["status"]!,
                              style: TextStyle(
                                color: items[index]["status"] == "lost"
                                    ? Colors.redAccent
                                    : const Color.fromARGB(255, 9, 141, 13),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index]["item"]!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.place,
                                      size: 16,
                                      color: Theme.of(context).disabledColor),
                                  SizedBox(width: 5),
                                  Text(
                                    items[index]["location"]!,
                                    style: TextStyle(
                                        color: Theme.of(context).disabledColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        if (items[index]["status"] != "lost")
                          TextButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      "Claim request sent for ${items[index]["item"]}"),
                                  duration: const Duration(seconds: 5),
                                ),
                              );
                            },
                            child: const Text("Claim",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 9, 141, 13))),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: 0.6 * MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.report_problem, color: Colors.white),
                label: const Text("Report Lost Item",
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
