import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:vulkan_vega_pulse/choosing_workout/workout_summary_screen.dart';

import '../exercises/exercise.dart';
import '../exercises/exercise_result.dart';
import '../exercises/workout_result.dart';

class TrainingSessionScreen extends StatefulWidget {
  const TrainingSessionScreen({
    super.key,
    required this.time,
    required this.intensity,
    required this.level,
    required this.exercises,
    required this.title,
    required this.goal,
    this.breakTime,
    this.repetitions,
  });

  final String time;
  final String intensity;
  final String level;
  final List<Exercise> exercises;
  final String title;
  final String goal;
  final int? breakTime;
  final int? repetitions;

  @override
  State<TrainingSessionScreen> createState() => _TrainingSessionScreenState();
}

class _TrainingSessionScreenState extends State<TrainingSessionScreen> {
  Duration duration = Duration();

  String twoDigits(int n) => n.toString().padLeft(2, '0');
  Timer? timer;
  int currentExerciseIndex = 0;
  bool isBreak = false;
  bool isPaused = false;
  List<double> progressValues = [];
  List<Exercise> exercises = [];

  Duration breakDuration = Duration(seconds: 30);

  String get twoDigitMinutes =>
      duration.inMinutes.remainder(60).toString().padLeft(2, '0');

  String get twoDigitSeconds =>
      duration.inSeconds.remainder(60).toString().padLeft(2, '0');

  @override
  void initState() {
    super.initState();
    if (widget.repetitions != null) {
      for (int i = 0; i < widget.exercises.length; i++) {
        exercises.addAll(List.filled(widget.repetitions!, widget.exercises[i]));
      }
      setState(() {});
    }else{
      exercises = widget.exercises;
    }
    progressValues = List.filled(exercises.length, 0.0);
    _setDurationForExercise();

    _startTimer();
  }

  void _setDurationForExercise() {
    final current = exercises[currentExerciseIndex];
    duration = Duration(seconds: current.time);
    isBreak = false;
  }

  void _startBreak() {
    if (exercises[currentExerciseIndex].breakTime == null) {
      setState(() {
        isBreak = true;
        breakDuration = Duration(seconds: 30);
        duration = breakDuration;
      });
    } else if (exercises[currentExerciseIndex].breakTime == 0) {
      setState(() {
        isBreak = false;
      });
    } else {
      setState(() {
        isBreak = true;
        breakDuration = Duration(
          seconds: exercises[currentExerciseIndex].breakTime!,
        );
        duration = breakDuration;
      });
    }

    _startTimer();
  }

  void _startTimer() {
    timer?.cancel();
    isPaused = false;
    final totalSeconds = duration.inSeconds;

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!isPaused) {
        setState(() {
          final seconds = duration.inSeconds - 1;
          duration = Duration(seconds: seconds);

          if (!isBreak && totalSeconds > 0) {
            final progress = (totalSeconds - seconds) / totalSeconds;
            progressValues[currentExerciseIndex] = progress.clamp(0.0, 1.0);
          }

          if (seconds <= 0) {
            timer?.cancel();
            if (isBreak) {
              _nextExercise();
            } else {
              _startBreak();
            }
          }
        });
      }
    });
  }

  void _pauseOrResume() {
    setState(() => isPaused = !isPaused);
  }

  void _skipBreak() {
    if (isBreak) {
      timer?.cancel();
      _nextExercise();
    }
  }

  void _skipExercise() {
    timer?.cancel();
    if (!isBreak) {
      progressValues[currentExerciseIndex] = 1.0;
      _startBreak();
    } else {
      _nextExercise();
    }
  }

  void _prevExercise() {
    timer?.cancel();
    if (currentExerciseIndex > 0) {
      currentExerciseIndex--;
      _setDurationForExercise();
      _startTimer();
    }
  }

  void _nextExercise() {
    if (currentExerciseIndex < exercises.length - 1) {
      setState(() {
        currentExerciseIndex++;
      });
      _setDurationForExercise();
      _startTimer();
    } else {
      _endSession();
    }
  }

  void _endSession() {
    final exercise =
        exercises
            .map(
              (e) => ExerciseResult(
                title: e.title,
                duration: e.time,
                completed: true,
              ),
            )
            .toList();
    final result = WorkoutResult(
      dateTime: DateTime.now(),
      intensity: widget.intensity,
      time: widget.time,
      level: widget.level,
      exercises: exercise,
      title: widget.title,
      goal: widget.goal,
    );
    // saveWorkoutResult(result);
    stopTimer();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => WorkoutSummaryScreen(result: result)),
    );
  }

  void stopTimer() {
    timer?.cancel();
    setState(() {
      isPaused = false;
      if (!isBreak) {
        progressValues[currentExerciseIndex] =
            (duration.inSeconds == 0)
                ? 1.0
                : progressValues[currentExerciseIndex];
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final current = exercises[currentExerciseIndex];
    Exercise next = exercises[currentExerciseIndex];
    if (currentExerciseIndex < exercises.length - 1) {
      next = exercises[currentExerciseIndex + 1];
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 42.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Training Session Screen',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Gilroy',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 27.0),
                    child: SizedBox(
                      width: 352,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 120,
                                height: 73,
                                child: Text(
                                  '$twoDigitMinutes:$twoDigitSeconds',
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Gilroy',
                                    color: Color.fromRGBO(255, 103, 66, 1),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    isBreak ? "Break" : current.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Gilroy',
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "Next: ${next.title}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Gilroy',
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "Exercise: ${current.exercise}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gilroy',
                              color: Colors.black,
                            ),
                          ),
                          Divider(color: Colors.black),
                          Text(
                            "Breathing: ${current.breathing}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gilroy',
                              color: Colors.black,
                            ),
                          ),
                          Divider(color: Colors.black),
                          Text(
                            "Technique: ${current.technique}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Gilroy',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(exercises.length, (index) {
                        final isCurrent =
                            index == currentExerciseIndex && !isBreak;
                        final isCompleted = progressValues[index] >= 1.0;

                        return Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(500),
                              color: Colors.grey.shade300,
                            ),
                            child: Stack(
                              children: [
                                FractionallySizedBox(
                                  alignment: Alignment.centerLeft,
                                  widthFactor: progressValues[index],
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(500),
                                      color:
                                          isCurrent
                                              ? Color.fromRGBO(255, 99, 61, 1)
                                              : (isCompleted
                                                  ? Colors.green
                                                  : Colors.orange),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Wrap(
              // spacing: 16,
              // runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _prevExercise,
                  icon: const Icon(Icons.skip_previous),
                  label: const Text('back'),
                ),
                ElevatedButton.icon(
                  onPressed: _pauseOrResume,
                  icon: Icon(isPaused ? Icons.play_arrow : Icons.pause),
                  label: Text(isPaused ? 'Resume' : 'Pause'),
                ),
                ElevatedButton.icon(
                  onPressed: _skipExercise,
                  label: Text(isBreak ? 'Skip' : 'Skip'),
                  icon: const Icon(Icons.skip_next),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
