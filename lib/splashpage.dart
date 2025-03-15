import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:routeradar/schedule.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 4), (timer) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Schedule()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.purple,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 50.0,
              fontFamily: 'LondrinaSketch',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'R o u t e R a d a r',
                  textStyle: const TextStyle(
                    fontSize: 50.0,
                    fontFamily: 'LondrinaSketch',
                    fontWeight: FontWeight.bold,
                  ),
                  colors: [
                    Colors.white,
                    Colors.blue,
                    Colors.yellow,
                    Colors.orange,
                    Colors.red,
                  ],
                  speed: const Duration(milliseconds: 500),
                ),
              ],
              totalRepeatCount: 1,
              isRepeatingAnimation: false,
            ),
          ),
        ),
      ),
    );
  }
}
