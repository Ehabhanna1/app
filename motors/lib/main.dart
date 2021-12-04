import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'Homescreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final int number = 1 ;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motors',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(


        duration: 5000,
        splash: Image.asset("images/motor.webp"),

    nextScreen:HomeScreen(),
    splashTransition: SplashTransition.fadeTransition,
    pageTransitionType: PageTransitionType.bottomToTop,
    backgroundColor: Colors.blue

        ),

    );
  }
}

