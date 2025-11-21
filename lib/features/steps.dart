import 'package:flutter/material.dart';

class steps extends StatefulWidget {
  const steps({Key? key}) : super(key: key);

  @override
  _stepsState createState() => _stepsState();
}

class _stepsState extends State<steps> {
  int _stepCount = 0;

  void _incrementSteps() {
    setState(() {
      _stepCount += 1000; // Simulate step increment
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Steps Taken:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              '$_stepCount',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _incrementSteps,
              child: Text('Add 1000 Steps'),
            ),
          ],
        ),
      ),
    );
  }
}