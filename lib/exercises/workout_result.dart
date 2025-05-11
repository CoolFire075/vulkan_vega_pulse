import 'package:hive/hive.dart';

import 'exercise_result.dart';

part 'workout_result.g.dart';
@HiveType(typeId: 0)
class WorkoutResult extends HiveObject {
  @HiveField(0)
  final DateTime dateTime;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String goal;
  @HiveField(3)
  final String time;
  @HiveField(4)
  final String intensity;
  @HiveField(5)
  final String level;
  @HiveField(6)
  final List<ExerciseResult> exercises;
  @HiveField(7)
  final int? calories; // сделать nullable
  @HiveField(8)
  final int? pulse;    // сделать nullable

  WorkoutResult({
    required this.dateTime,
    required this.title,
    required this.goal,
    required this.time,
    required this.intensity,
    required this.level,
    required this.exercises,
    this.calories,   // не required
    this.pulse,      // не required
  });
}
