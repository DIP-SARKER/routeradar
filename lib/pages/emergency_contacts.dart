import 'package:flutter/material.dart';
import 'package:routeradar/database/database.dart';
import 'package:routeradar/widgets/customappbar.dart';

class EmergencyContactsPage extends StatefulWidget {
  const EmergencyContactsPage({super.key});

  @override
  State<EmergencyContactsPage> createState() => _EmergencyContactsPage();
}

class _EmergencyContactsPage extends State<EmergencyContactsPage> {
  List<Map<String, String>> emergencyContacts = [];

  @override
  void initState() {
    super.initState();
    _fetchEmergencyContacts();
  }

  Future<void> _fetchEmergencyContacts() async {
    final data = await database.value.getEmergencyContact();
    if (mounted) {
      setState(() {
        emergencyContacts = List<Map<String, dynamic>>.from(data)
            .map((e) => {
                  'operator': e['operator'].toString(),
                  'number': e['number'].toString(),
                })
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Emergency Contacts",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: emergencyContacts.length,
          itemBuilder: (context, index) {
            final contact = emergencyContacts[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 0,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.grey[900],
              child: ListTile(
                leading: Icon(
                  _getIcon(contact['operator']),
                  color: Colors.amber,
                  size: 35,
                ),
                title: Text(
                  contact['operator'] ?? 'Unknown',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  contact['number'] ?? 'Unknown',
                  style: TextStyle(color: Theme.of(context).disabledColor),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.call, color: Theme.of(context).primaryColor),
                  onPressed: () {
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  IconData _getIcon(String? name) {
    switch (name?.toLowerCase()) {
      case 'fire service':
        return Icons.local_fire_department;
      case 'police':
      case 'national emergency service':
      case 'rab hq':
        return Icons.local_police;
      case 'ambulance':
      case 'medical helpline (dghs)':
        return Icons.local_hospital;
      case 'traffic control (dhaka)':
        return Icons.traffic;
      case 'women and child helpline':
        return Icons.family_restroom;
      case 'railway inquiry':
        return Icons.train;
      case 'brta helpline':
        return Icons.directions_bus;
      default:
        return Icons.phone;
    }
  }
}
