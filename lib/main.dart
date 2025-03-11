import 'package:flutter/material.dart';
import 'package:routeradar/schedule.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueAccent,
        disabledColor:  Colors.grey[600],
      ),
      home: Schedule(),
    );
  }
}//Hi My self DSNILOY