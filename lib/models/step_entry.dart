class StepEntry {
  final DateTime day; // date only (use UTC or yyyy-MM-dd string for PK)
  final int steps;
  final double calories;
  final int goal;

  StepEntry({required this.day, required this.steps, required this.calories, required this.goal});

  Map<String, dynamic> toMap() {
    return {
      'day': day.toIso8601String().split('T').first, // store as yyyy-MM-dd
      'steps': steps,
      'calories': calories,
      'goal': goal,
    };
  }

  factory StepEntry.fromMap(Map<String, dynamic> map) {
    final dayStr = map['day'] as String;
    return StepEntry(
      day: DateTime.parse(dayStr),
      steps: map['steps'] as int,
      calories: (map['calories'] as num).toDouble(),
      goal: map['goal'] as int,
    );
  }
}
