import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:health_tracker_app/services/steps_database.dart';
import 'package:health_tracker_app/models/step_entry.dart';

class steps extends StatefulWidget {
  const steps({Key? key}) : super(key: key);

  @override
  _stepsState createState() => _stepsState();
}

class _stepsState extends State<steps> {
  int _stepCount = 0;

  // History for the last 7 days (loaded from DB)
  List<int> _stepHistory = List.filled(7, 0);

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final entries = await StepsDatabase.instance.getLastNDays(7);
    setState(() {
      _stepHistory = entries.map((e) => e.steps).toList();
      // Set today's step count to the last element
      _stepCount = _stepHistory.isNotEmpty ? _stepHistory.last : 0;
    });
  }

  void _incrementSteps() async {
    setState(() {
      _stepCount += 1000; // Simulate step increment
    });

    // Update history and DB: write today's entry
    final today = DateTime.now();
    final entry = StepEntry(
      day: DateTime(today.year, today.month, today.day),
      steps: _stepCount,
      calories: (_stepCount * 0.04), // simple estimate
      goal: 10000, // default goal; adjust as needed
    );

    await StepsDatabase.instance.insertOrUpdate(entry);

    // Refresh history displayed
    final entries = await StepsDatabase.instance.getLastNDays(7);
    setState(() {
      _stepHistory = entries.map((e) => e.steps).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step Tracker'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Steps Taken:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 8),
            Text(
              '$_stepCount',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _incrementSteps,
              child: Text('Add 1000 Steps'),
            ),
            SizedBox(height: 32),

            // Chart
            Text(
              'Last 7 Days',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            Container(
              height: 240,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: StepsChart(data: _stepHistory),
            ),
          ],
        ),
      ),
    );
  }
}

class StepsChart extends StatelessWidget {
  final List<int> data;

  const StepsChart({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spots = List<FlSpot>.generate(
      data.length,
      (i) => FlSpot(i.toDouble(), data[i].toDouble()),
    );

    final maxY = (data.isNotEmpty ? data.reduce((a, b) => a > b ? a : b) : 1000) + 1000;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: (maxY / 4).roundToDouble(),
            getDrawingHorizontalLine: (value) => FlLine(
              color: Colors.grey.withOpacity(0.2),
              strokeWidth: 1,
            ),
          ),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  final idx = value.toInt();
                  const labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                  final text = (idx >= 0 && idx < labels.length) ? labels[idx] : '';
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(text, style: TextStyle(fontSize: 12)),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: (maxY / 4).roundToDouble(),
                getTitlesWidget: (value, meta) => Text(value.toInt().toString(), style: TextStyle(fontSize: 10)),
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          minX: 0,
          maxX: (data.length - 1).toDouble(),
          minY: 0,
          maxY: maxY.toDouble(),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: Theme.of(context).primaryColor,
              barWidth: 3,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: Theme.of(context).primaryColor.withOpacity(0.15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}