import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uberapp/Screens/loginscreen.dart';

import 'Screens/camerascreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Uber App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: CameraScreen(),
    );
  }
}

