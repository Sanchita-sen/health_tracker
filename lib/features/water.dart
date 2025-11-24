import 'package:flutter/material.dart';

class Water extends StatefulWidget {
  const Water({Key? key}) : super(key: key);

  @override
  _WaterState createState() => _WaterState();
}
class _WaterState extends State<Water> {
  int _glassesDrunk = 0;

  void _addGlass() {
    setState(() {
      _glassesDrunk += 1; // Simulate adding a glass of water
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hydration Reminders'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Glasses of Water Drunk:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              '$_glassesDrunk',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _addGlass,
              child: Text('Add 1 Glass of Water'),
            ),
          ],
        ),
      ),
    );
  }
}