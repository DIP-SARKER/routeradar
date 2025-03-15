import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
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
    Timer.periodic(Duration(seconds: 5), (timer) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Schedule()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 82, 223),
      body: Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 50.0,
            fontFamily: 'LondrinaSketch',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'R o u t e R a d a r',
                speed: const Duration(milliseconds: 100),
              ),
              WavyAnimatedText(
                'R o u t e R a d a r',
                speed: const Duration(milliseconds: 90),
              ),
            ],
            totalRepeatCount: 1,
          ),
        ),
      ),
    );
  }
}
          
          
        //   AnimatedTextKit(
        //     animatedTexts: [
        //       TyperAnimatedText(
        //         'R o u t e R a d a r',
        //         textStyle: const TextStyle(
        //             fontSize: 60.0,
        //             fontFamily: "LondrinaSketch",
        //             fontWeight: FontWeight.bold,
        //             ),
        //         // speed: const Duration(milliseconds: 100),
        //       ),
        //     ],
        //     // totalRepeatCount: 3,
        //     // pause: const Duration(milliseconds: 1500),
        //     // displayFullTextOnTap: false,
        //     //controller: myAnimatedTextController),
        //   ),
        // ));



// 'R o u t e R a d a r',
//       textStyle: TextStyle(
// fontFamily: 'LondrinaSketch',
//                 fontSize: 60,
//                 fontWeight: FontWeight.bold,
//                 color: Theme.of(context).primaryColor)