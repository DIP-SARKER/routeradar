import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routeradar/pages/schedule.dart';
// import 'package:routeradar/pages/splashpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color.fromARGB(255, 119, 82, 223),
        disabledColor: Colors.grey[600],
        hintColor: const Color.fromARGB(255, 42, 15, 117),
      ),
      home: Schedule(),
    );
  }
}//Hi My self DSNILOY