import 'package:flutter/material.dart';
import 'package:health_tracker_app/screen.dart';


void main() {
  runApp(const HealthTracker ());
}
class HealthTracker extends StatelessWidget {
  const HealthTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: screen(),
    );
  }

  
}







  

