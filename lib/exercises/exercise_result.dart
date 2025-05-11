import 'package:hive/hive.dart';

part 'exercise_result.g.dart';

@HiveType(typeId: 1)
class ExerciseResult {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final int duration;
  @HiveField(2)
  final bool completed;

  ExerciseResult({
    required this.title,
    required this.duration,
    required this.completed,
  });
}