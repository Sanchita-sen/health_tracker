import 'package:flutter/material.dart';

class weight extends StatefulWidget {
  const weight({Key? key}) : super(key: key);

  @override
  _weightState createState() => _weightState();
}

class _weightState extends State<weight> {
  double _currentWeight = 70.0; // Initial weight in kg

  void _updateWeight(double newWeight) {
    setState(() {
      _currentWeight = newWeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Weight:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              '$_currentWeight kg',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            Slider(
              value: _currentWeight,
              min: 30.0,
              max: 200.0,
              divisions: 170,
              label: '$_currentWeight kg',
              onChanged: (double value) {
                _updateWeight(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
