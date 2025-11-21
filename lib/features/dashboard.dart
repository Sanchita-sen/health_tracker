import 'package:flutter/material.dart';
import 'package:health_tracker_app/features/steps.dart';

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
          padding: EdgeInsets.all(16.0),
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
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
              },
              child: Text('Calorie Counting'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to sleep monitoring feature
              },
              child: Text('Sleep Monitoring'),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to hydration reminders feature
              },
              child: Text('Hydration Reminders'),
            ),
          ],
        ),
      ),
    );
  }
}