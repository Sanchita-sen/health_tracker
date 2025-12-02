import 'package:flutter/material.dart';
import 'package:health_tracker_app/features/food.dart';
import 'package:health_tracker_app/features/insights.dart';
import 'package:health_tracker_app/features/profile.dart';
import 'package:health_tracker_app/features/reminders.dart';
import 'package:health_tracker_app/features/settings.dart';
import 'package:health_tracker_app/features/sleep_monitoring.dart';
import 'package:health_tracker_app/features/steps.dart';
import 'package:health_tracker_app/features/water.dart';
import 'package:health_tracker_app/features/weight.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Your dashboard UI here
      child: Center(
        child: GridView.count(
          padding: EdgeInsets.all(12.0),
          crossAxisCount: 1,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to step tracking feature
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const steps()),
                );
              },
              child: Text('Step Tracking'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to calorie counting feature
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Food()),
                );
              },
              child: Text('Food Monitoring'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to sleep monitoring feature
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SleepMonitoring()),
                );
              },
              child: Text('Sleep Monitoring'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to hydration reminders feature
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Water()),
                );
              },
              child: Text('Hydration Reminders'),
            ),
            ElevatedButton(
              onPressed: () {
                // Additional Weight button
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const weight()),
                );
              },
              child: Text('Additional Weight'),
            ),
            ElevatedButton(
              onPressed: () {
                // Additional button for insight feature
                Navigator.push(context,
                 MaterialPageRoute(builder: (_) => const insights()));
              },
              child: Text('Future Feature'),
            ),
            ElevatedButton(
              onPressed: () {
                // Placeholder for reminders feature
                Navigator.push(context,
                 MaterialPageRoute(builder: (_) => const reminders()));
              },
              child: Text('Future Feature'),
            ),
            ElevatedButton(
              onPressed: () {
                // Placeholder for goals feature
                Navigator.push(context,
                 MaterialPageRoute(builder: (_) => const settings()));
              },
              child: Text('Future Feature'),
            ),
            ElevatedButton(
              onPressed: () {
                // Placeholder for settings feature
                Navigator.push(context,
                 MaterialPageRoute(builder: (_) => const profile()));
              },
              child: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}