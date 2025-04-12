import 'dart:async';
import 'package:flutter/material.dart';
import 'package:routeradar/database/database.dart';
import 'package:routeradar/widgets/customappbar.dart';

class BookTicketPage extends StatefulWidget {
  @override
  _BookTicketPageState createState() => _BookTicketPageState();
}

class _BookTicketPageState extends State<BookTicketPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _busCodeController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedBus;

  double _progress = 0.0;
  Timer? _timer;
  final double _holdDuration = 2.0;

  late Future<List<Map<String, dynamic>>> _busInfoFuture;

  @override
  void initState() {
    super.initState();
    _busInfoFuture = database.value.getBusInfo();
  }

  void _startHoldProgress() {
    _timer?.cancel();
    const duration = Duration(milliseconds: 20);
    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        _progress += 0.02 / _holdDuration;
        if (_progress >= 1.0) {
          _progress = 1.0;
          _timer?.cancel();
          _confirmTicket();
        }
      });
    });
  }

  void _cancelHoldProgress() {
    _timer?.cancel();
    setState(() {
      _progress = 0.0;
    });
  }

  Future<void> confirmPurchase() async {
    final buses = await _busInfoFuture;
    final selectedBusInfo = _getSelectedBusInfo(buses);
    final fare = selectedBusInfo?['fare'] ?? 0;

    database.value.UpdateBalance(-fare);
  }

  void _confirmTicket() async {
    await confirmPurchase();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Ticket Confirmed",
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
              )),
          content: Text("Your ticket has been successfully booked!",
              style: TextStyle(color: Colors.white, fontSize: 15)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  _busCodeController.clear();
                  _selectedDate = null;
                  _selectedBus = null;
                  _progress = 0.0;
                });
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date != null) setState(() => _selectedDate = date);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _busCodeController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime? date) =>
      date == null ? "Pick Date" : "${date.year}-${date.month}-${date.day}";

  Map<String, dynamic>? _getSelectedBusInfo(List<Map<String, dynamic>> buses) {
    return buses.firstWhere(
      (bus) => bus['bus'] == _selectedBus,
      orElse: () => {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Book Ticket"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 50),
              FutureBuilder<List<Map<String, dynamic>>>(
                future: _busInfoFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("Error loading bus info");
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text("No buses available");
                  }

                  final buses = snapshot.data!;
                  final selectedBusInfo = _getSelectedBusInfo(buses);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Select Bus",
                          helperStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        value: _selectedBus,
                        items: buses.map((bus) {
                          final busName = bus['bus'];
                          return DropdownMenuItem<String>(
                            value: busName,
                            child: Text(busName,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedBus = value;
                          });
                        },
                      ),
                      if (_selectedBus != null && selectedBusInfo != null) ...[
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                "Route: ${selectedBusInfo['startPoint']} to ${selectedBusInfo['endPoint']}",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Fare: ৳ ${selectedBusInfo['fare']?.toStringAsFixed(2) ?? 'N/A'}",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  );
                },
              ),
              SizedBox(height: 15),
              ListTile(
                title: Text(
                  _formatDate(_selectedDate),
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                leading: Icon(Icons.calendar_today,
                    color: Theme.of(context).primaryColor),
                onTap: _pickDate,
              ),
              SizedBox(height: 300),
              GestureDetector(
                onLongPressStart: (_) => _startHoldProgress(),
                onLongPressEnd: (_) => _cancelHoldProgress(),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: CircularProgressIndicator(
                        value: _progress,
                        strokeWidth: 10,
                        backgroundColor: Colors.white,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor),
                      ),
                    ),
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
