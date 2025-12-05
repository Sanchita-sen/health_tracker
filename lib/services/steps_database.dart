import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:health_tracker_app/models/step_entry.dart';

class StepsDatabase {
  static final StepsDatabase instance = StepsDatabase._init();

  static Database? _database;

  StepsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('steps.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE steps(
        day TEXT PRIMARY KEY,
        steps INTEGER NOT NULL,
        calories REAL NOT NULL,
        goal INTEGER NOT NULL
      )
    ''');
  }

  Future<void> insertOrUpdate(StepEntry entry) async {
    final db = await instance.database;
    await db.insert(
      'steps',
      entry.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<StepEntry?> getEntryByDay(DateTime day) async {
    final db = await instance.database;
    final dayStr = day.toIso8601String().split('T').first;
    final maps = await db.query(
      'steps',
      columns: ['day', 'steps', 'calories', 'goal'],
      where: 'day = ?',
      whereArgs: [dayStr],
    );
    if (maps.isNotEmpty) {
      return StepEntry.fromMap(maps.first);
    }
    return null;
  }

  Future<List<StepEntry>> getLastNDays(int n) async {
    // Get today and previous n-1 days
    final today = DateTime.now();
    final List<StepEntry> result = [];
    for (int i = n - 1; i >= 0; i--) {
      final d = DateTime(today.year, today.month, today.day).subtract(Duration(days: i));
      final entry = await getEntryByDay(d);
      if (entry != null) {
        result.add(entry);
      } else {
        // If missing, add an empty (0) entry keeping the same day
        result.add(StepEntry(day: d, steps: 0, calories: 0.0, goal: 0));
      }
    }
    return result;
  }

  Future<void> deleteByDay(DateTime day) async {
    final db = await instance.database;
    final dayStr = day.toIso8601String().split('T').first;
    await db.delete('steps', where: 'day = ?', whereArgs: [dayStr]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
