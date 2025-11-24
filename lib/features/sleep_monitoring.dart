import 'package:flutter/material.dart';

class SleepMonitoring extends StatefulWidget {
  const SleepMonitoring({Key? key}) : super(key: key);

  @override
  _SleepMonitoringState createState() => _SleepMonitoringState();
}
class _SleepMonitoringState extends State<SleepMonitoring> {
  int _hoursSlept = 0;

  void _addSleepHours() {
    setState(() {
      _hoursSlept += 1; // Simulate adding an hour of sleep
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Monitoring'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hours Slept:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              '$_hoursSlept',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _addSleepHours,
              child: Text('Add 1 Hour of Sleep'),
            ),
          ],
        ),
      ),
    );
  }
}