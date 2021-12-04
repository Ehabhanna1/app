import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
class HomeScreen extends StatelessWidget {
  var count = 0.obs;
  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(title: Text("Speed Motor")),
      body: Center(
        child: Obx(() => Text("$count")),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => count ++,
      ));
}
class Controller extends GetxController {
  var count = 0;
  void increment() {
    count++;
    update();
  }
}