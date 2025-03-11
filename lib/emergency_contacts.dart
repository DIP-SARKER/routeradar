import 'package:flutter/material.dart';

class EmergencyContactsPage extends StatefulWidget {
  const EmergencyContactsPage({super.key});

  @override
  State<EmergencyContactsPage> createState() => _EmergencyContactsPage();
}

class _EmergencyContactsPage extends State<EmergencyContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          'Emergency Contacts',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ContactCard(
              name: 'Fire Department',
              contactNumber: '101',
              icon: Icons.local_fire_department,
            ),
            ContactCard(
              name: 'Police',
              contactNumber: '100',
              icon: Icons.local_police,
            ),
            ContactCard(
              name: 'Ambulance',
              contactNumber: '102',
              icon: Icons.local_hospital,
            ),
            ContactCard(
              name: 'Emergency Services',
              contactNumber: '999',
              icon: Icons.warning,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add functionality for adding custom contacts
        },
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final String contactNumber;
  final IconData icon;

  const ContactCard({
    super.key,
    required this.name,
    required this.contactNumber,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.redAccent,
          size: 40,
        ),
        title: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          contactNumber,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.phone),
          color: Colors.blueAccent,
          onPressed: () {},
        ),
      ),
    );
  }
}
