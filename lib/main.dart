import 'package:bloc_demo/services/counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/home/ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final CounterService counterService = Get.put(CounterService());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.teal),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
