import 'package:flutter/material.dart';
import 'package:vulkan_vega_pulse/choosing_workout/training_session_screen.dart';

import '../exercises/exercise.dart';

class WorkoutScreen extends StatelessWidget {
  final String? time;
  final String? intensity;
  final String? level;
  final List<Exercise> exercises;
  final String title;
  final String? goal;
  final String? image;

  const WorkoutScreen({
    super.key,
    this.time,
    this.intensity,
    this.level,
    required this.exercises,
    required this.title,
    this.goal,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   title,
                  //   style: TextStyle(
                  //     fontFamily: 'Gilroy',
                  //     fontWeight: FontWeight.w600,
                  //     fontSize: 24,
                  //   ),
                  // ),
                  // const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      text: 'Goal: ',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: goal,
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                 image != null ? image!.isEmpty
                      ? SizedBox()
                      : SizedBox(
                        width: 352,
                        height: 204,
                        child: Image.asset(image!, fit: BoxFit.cover),
                      ) : SizedBox(),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFF857A6), Color(0xFFFF5858)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _InfoItem(title: 'Time', value: time?? '0'),
                        _InfoItem(title: 'Intensity', value: intensity?? 'easy'),
                        _InfoItem(title: 'Level', value: level?? 'beginner'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'List of exercises',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: exercises.length,
                    itemBuilder:
                        (context, index) => ExerciseTile(
                          title: exercises[index].title,
                          duration: exercises[index].duration,
                          exercise: exercises[index].exercise,
                          breathing: exercises[index].breathing,
                          technique: exercises[index].technique,
                          time: exercises[index].time,
                        ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF5858),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => TrainingSessionScreen(
                                  goal: goal ?? '',
                                  title: title,
                                  time: time ?? '0',
                                  intensity: intensity ?? 'easy',
                                  level: level ?? 'beginner',
                                  exercises: exercises,
                                ),
                          ),
                        );
                      },
                      child: const Text(
                        'Start Workout',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String title;
  final String value;

  const _InfoItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Gilroy',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class ExerciseTile extends StatefulWidget {
  final String title;
  final String duration;
  final String exercise;
  final String breathing;
  final String technique;
  final int time;

  const ExerciseTile({
    super.key,
    required this.title,
    required this.duration,
    required this.exercise,
    required this.breathing,
    required this.technique,
    required this.time,
  });

  @override
  State<ExerciseTile> createState() => _ExerciseTileState();
}

class _ExerciseTileState extends State<ExerciseTile> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => setState(() => expanded = !expanded),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.duration,
                        style: const TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        expanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Color.fromRGBO(255, 96, 57, 1),
                      ),
                    ],
                  ),
                ],
              ),
              if (expanded) ...[
                const SizedBox(height: 8),
                Text(
                  widget.exercise,
                  style: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                Divider(),
                Text(
                  widget.breathing,
                  style: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                Divider(),
                Text(
                  widget.technique,
                  style: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
