import 'dart:async';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:routeradar/widgets/bnavbar.dart';
import 'package:routeradar/widgets/customappbar.dart';

class BookTicketPage extends StatefulWidget {
  @override
  _BookTicketPageState createState() => _BookTicketPageState();
}

class _BookTicketPageState extends State<BookTicketPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _busCodeController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  double _progress = 0.0;
  Timer? _timer;
  final double _holdDuration = 2.0; // seconds

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

  void _confirmTicket() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Ticket Confirmed"),
        content: Text("Your ticket has been successfully booked!"),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _busCodeController.clear();
                _selectedDate = null;
                _selectedTime = null;
                _progress = 0.0;
              });
            },
          )
        ],
      ),
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

  Future<void> _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (time != null) setState(() => _selectedTime = time);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _busCodeController.dispose();
    super.dispose();
  }

  String _formatDate(DateTime? date) =>
      date == null ? "Pick Date" : "${date.year}-${date.month}-${date.day}";
  String _formatTime(TimeOfDay? time) =>
      time == null ? "Pick Time" : time.format(context);

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
              TextField(
                cursorColor: Theme.of(context).primaryColor,
                controller: _busCodeController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Bus Code",
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  hintText: "Enter Bus Code",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                    FontAwesome.bus_solid,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
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
              ListTile(
                title: Text(
                  _formatTime(_selectedTime),
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                leading: Icon(Icons.access_time,
                    color: Theme.of(context).primaryColor),
                onTap: _pickTime,
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
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
