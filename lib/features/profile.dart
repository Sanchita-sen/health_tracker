import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}
class _profileState extends State<profile> {
  String _name = 'John Doe';
  int _age = 30;
  double _height = 175.0; // in cm
  double _weight = 70.0; // in kg

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $_name', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Age: $_age', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Height: $_height cm', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Weight: $_weight kg', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}