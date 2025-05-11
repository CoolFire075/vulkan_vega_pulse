import 'package:hive/hive.dart';

class Exercise {
  final String title;
  final String duration;
  final String exercise;
  final String breathing;
  final String technique;
  final int time;
  final int? breakTime;
  final int? repetitions;

  Exercise({
    this.repetitions,
    this.breakTime,
    required this.title,
    required this.duration,
    required this.exercise,
    required this.breathing,
    required this.technique,
    required this.time,
  });
}
