import 'package:flutter/material.dart';

class insights extends StatefulWidget {
  const insights({Key? key}) : super(key: key);

  @override
  _insightsState createState() => _insightsState();
}
class _insightsState extends State<insights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insights Feature'),
      ),
      body: Center(
        child: Text(
          'Insights Feature Coming Soon!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}