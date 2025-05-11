import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:vulkan_vega_pulse/home/my_home_page.dart';

import '../exercises/workout_result.dart';

class WorkoutSummaryScreen extends StatefulWidget {
  final WorkoutResult result;

  const WorkoutSummaryScreen({super.key, required this.result});

  @override
  State<WorkoutSummaryScreen> createState() => _WorkoutSummaryScreenState();
}

class _WorkoutSummaryScreenState extends State<WorkoutSummaryScreen> {

  void saveWorkoutResult(WorkoutResult result) {
    final box = Hive.box<WorkoutResult>('workout_results');
    box.add(result);
    debugPrint("Saved");
  }

  @override
  Widget build(BuildContext context) {
    final calories = 180 + Random().nextInt(60);
    final pulse = 120 + Random().nextInt(60);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Text(
                "Workout Complete",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Text(
              "Well done!",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Text("You completed: ${widget.result.title}"),
            Text(
              "Intensity: ${widget.result.intensity}, Duration: ${widget.result.time}",
            ),
            Text(
              "Date: ${DateFormat.yMMMd().add_Hm().format(widget.result.dateTime)}",
            ),
            const SizedBox(height: 20),
            // Вставь в children: [] списка
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF512F), Color(0xFFDD2476)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Training:',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.result.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          value: 1,
                          strokeWidth: 5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                          backgroundColor: Colors.white.withOpacity(0.3),
                        ),
                      ),
                      const Text(
                        '100%',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _InfoCard(title: 'Training time', value: widget.result.time),
                _InfoCard(title: 'Average rest', value: '00:00:30'),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatCard(
                  icon: Icons.local_fire_department,
                  value: '$calories',
                  label: 'Calories',
                ),
                _StatCard(
                  icon: Icons.signal_cellular_alt,
                  value: widget.result.level,
                  label: 'Level',
                ),
                _StatCard(
                  icon: Icons.favorite,
                  value: '$pulse',
                  label: 'Pulse',
                ),
              ],
            ),

            const SizedBox(height: 16),

            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 120,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Colors.redAccent),
                ),
              ),
              onPressed: () {
                saveWorkoutResult(
                  WorkoutResult(
                    dateTime: widget.result.dateTime,
                    title: widget.result.title,
                    goal: widget.result.goal,
                    time: widget.result.time,
                    intensity: widget.result.intensity,
                    level: widget.result.level,
                    exercises: widget.result.exercises,
                    calories: calories,
                    pulse: pulse,
                  ),
                );
                debugPrint("calories: ${calories}");
                debugPrint("pulse: ${pulse}");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => MyHomePage()),
                );
                // Navigator.pop(context);
                // Navigator.pop(context);
              },
              child: const Text(
                'Back',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.result.exercises.length,
                itemBuilder: (context, index) {
                  final ex = widget.result.exercises[index];
                  return ListTile(
                    title: Text(ex.title),
                    subtitle: Text("Duration: ${ex.duration}s"),
                    trailing: Icon(
                      ex.completed ? Icons.check_circle : Icons.cancel,
                      color: ex.completed ? Colors.green : Colors.red,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const _InfoCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.deepOrange, size: 32),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }
}
