import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/widgets/customappbar.dart';

class RequestRidePage extends StatefulWidget {
  const RequestRidePage({super.key});

  @override
  State<RequestRidePage> createState() => _RequestRidePageState();
}

class _RequestRidePageState extends State<RequestRidePage> {
  String? selectedPickup;
  String? selectedDropoff;
  bool isRequested = false;

  final List<String> locations = [
    "DSC",
    "Rajlokkhi",
    "Dhanmondi",
    "Mirpur",
    "Narayanganj",
    "Tongi",
    "Rampura"
  ];

  final List<Map<String, String>> busSchedules = [
    {
      "time": "06:30 AM",
      "route": "DSC to Tongi",
      "bus": "Surjomukhi 100",
      "driver": "Abdul Karim"
    },
    {
      "time": "08:00 AM",
      "route": "DSC to Rajlokkhi",
      "bus": "Surjomukhi 101",
      "driver": "Rahim Uddin"
    },
    {
      "time": "09:00 AM",
      "route": "Tongi to DSC",
      "bus": "Oporajita 102",
      "driver": "Sohail Rana"
    },
    {
      "time": "10:30 AM",
      "route": "Rajlokkhi to DSC",
      "bus": "Oporajita 103",
      "driver": "Hasan Mahmud"
    },
    {
      "time": "12:00 PM",
      "route": "DSC to Dhanmondi",
      "bus": "Surjomukhi 104",
      "driver": "Shafiqul Islam"
    },
  ];

  List<Map<String, String>> filteredBuses = [];

  void _resetPage() {
    setState(() {
      selectedPickup = null;
      selectedDropoff = null;
      isRequested = false;
      filteredBuses = [];
    });
  }

  void _showInvalidSelectionPopup() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Row(
          children: [
            Icon(
              FontAwesome.triangle_exclamation_solid,
              color: Colors.redAccent,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Invalid Selection",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: Text("No Route Found!Try again....."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _resetPage();
            },
            child: Text(
              "OK",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  void _filterBuses() {
    setState(() {
      isRequested = true;
      filteredBuses = busSchedules.where((bus) {
        return (selectedPickup != null && selectedDropoff != null) &&
            (bus["route"] == "$selectedPickup to $selectedDropoff");
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Request a Ride",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Pickup Location",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              value: selectedPickup,
              hint: Text("Select Pickup Location",
                  style: TextStyle(
                      color: isRequested
                          ? Theme.of(context).primaryColor
                          : Colors.white)),
              items: locations
                  .map((location) => DropdownMenuItem(
                        value: location,
                        child: Text(location,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => selectedPickup = value),
            ),
            const SizedBox(height: 20),
            const Text("Drop-off Location",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              value: selectedDropoff,
              hint: Text("Select Drop-off Location",
                  style: TextStyle(
                      color: isRequested
                          ? Theme.of(context).primaryColor
                          : Colors.white)),
              items: locations
                  .map((location) => DropdownMenuItem(
                        value: location,
                        child: Text(location,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)),
                      ))
                  .toList(),
              onChanged: (value) => setState(() => selectedDropoff = value),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                icon: const Icon(Icons.local_taxi),
                label: const Text("Request Ride"),
                onPressed: () {
                  if (selectedPickup == "DSC" && selectedDropoff == "DSC") {
                    _showInvalidSelectionPopup();
                  } else if ((selectedPickup == "DSC" ||
                          selectedDropoff == "DSC") &&
                      selectedPickup != null &&
                      selectedDropoff != null) {
                    _filterBuses();
                  } else {
                    _showInvalidSelectionPopup();
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            if (filteredBuses.isNotEmpty) ...[
              const Text("Available Buses:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredBuses.length,
                  itemBuilder: (context, index) {
                    final bus = filteredBuses[index];
                    return Card(
                      child: ListTile(
                        title: Text("Bus: ${bus['bus']}"),
                        subtitle: Text(
                            "Time: ${bus['time']} | Driver: ${bus['driver']}"),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
