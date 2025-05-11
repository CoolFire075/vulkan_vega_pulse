import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:vulkan_vega_pulse/my_progress/workout_calendar_screen.dart';

import '../exercises/workout_result.dart';

class MyProgressScreen extends StatefulWidget {
  const MyProgressScreen({super.key});

  @override
  State<MyProgressScreen> createState() => _MyProgressScreenState();
}

class _MyProgressScreenState extends State<MyProgressScreen> {
  int amountOfResults = 0;
  double heartRate = 0;
  double averageTrainingTimePerWeek = 0;

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  Future<List<WorkoutResult>> _loadResults() async {
    final results =
        await Hive.box<WorkoutResult>('workout_results').values.toList();
    final amount = results.length;
    final averageHeartRate =
        results
            .map((e) => e.pulse)
            .reduce(
              (a, b) =>
                  a == null
                      ? 0
                      : b == null
                      ? 0
                      : a + b,
            )! /
        amount;
    final averageTimePerWeek = sumCountsThisWeek(results);
    setState(() {
      amountOfResults = amount;
      heartRate = averageHeartRate;
      averageTrainingTimePerWeek = averageTimePerWeek.toDouble();
    });
    return results;
  }

  double sumCountsThisWeek(List<WorkoutResult> list) {
    final now = DateTime.now();
    final startOfWeek = now.subtract(
      Duration(days: now.weekday - 1),
    ); // Понедельник
    final endOfWeek = startOfWeek.add(Duration(days: 6)); // Воскресенье

    int seconds = 0;

    for (var result in list) {
      if (!result.dateTime.isBefore(startOfWeek) &&
          !result.dateTime.isAfter(endOfWeek)) {
        for (var entry in result.exercises) {
          seconds += entry.duration;
        }
      }
    }

    final double minutes = seconds / 60;
    final double totalCount = minutes / 60;

    return totalCount;
  }

  // Future<void> _loadResults() async {
  //   try {
  //     final results =
  //     await Hive.box<WorkoutResult>('workout_results').values.toList();
  //     _groupedResults.clear();
  //     for (final result in results) {
  //       final day = DateTime.utc(
  //         result.dateTime.year,
  //         result.dateTime.month,
  //         result.dateTime.day,
  //       );
  //       if (_groupedResults[day] == null) {
  //         _groupedResults[day] = [];
  //       }
  //       _groupedResults[day]!.add(result);
  //     }
  //     // Ensure we update the UI only if the widget is still mounted.
  //     if (mounted) {
  //       setState(() {});
  //     }
  //   } catch (e) {
  //     // Handle errors here if necessary
  //     print('Error loading results: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 42.0, left: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              width: 307,
              height: 40,
              child: Text(
                "Progress",
                style: TextStyle(
                  fontFamily: "GilRoy",
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => WorkoutCalendarScreen(),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 352,
                          height: 75,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.blueGrey, Colors.lightGreen],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 75.0),
                                child: Text(
                                  "Completed\nworkouts",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Gilroy",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Text(
                                  "$amountOfResults",
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "DrukCyr",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset("assets/images/im_reward.png"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => WorkoutCalendarScreen(),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 75.0),
                                child: Text(
                                  "Heart rate\nzone analytics",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Gilroy",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Text(
                                  "${heartRate.toString().substring(0, heartRate.toString().indexOf(".") + 2)} bpm",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "DrukCyr",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          width: 352,
                          height: 75,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.orange, Colors.amber],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        Image.asset("assets/images/im_heart.png"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => WorkoutCalendarScreen(),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 75.0),
                                child: Text(
                                  "Average load\nrating",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Gilroy",
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Text(
                                  "0/5",
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "DrukCyr",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          width: 352,
                          height: 75,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.blueGrey, Colors.blueAccent],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 14),
                          child: Image.asset("assets/images/im_star.png"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => WorkoutCalendarScreen(),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 75.0),
                                child: Text(
                                  "Training time\nper week",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Gilroy",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 18.0),
                                child: Text(
                                  "${averageTrainingTimePerWeek.toString().substring(0, averageTrainingTimePerWeek.toString().indexOf(".") + 2)} h.",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "DrukCyr",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          width: 352,
                          height: 75,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFF857A6), Color(0xFFFF5858)],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        Image.asset("assets/images/im_clocks.png"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
