import 'package:flutter/material.dart';

class Food extends StatefulWidget {
  const Food({Key? key}) : super(key: key);

  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  int _caloriesConsumed = 0;
  void _addCalories(int calories) {
    setState(() {
      _caloriesConsumed += calories; // Simulate adding calories
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      // Your food monitoring UI here
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Calories Consumed:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              '$_caloriesConsumed',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => _addCalories(100), // Simulate adding 100 calories
              child: Text('Add 100 Calories'),
            ),
          ],
        ),
      ),
    );
  }
}