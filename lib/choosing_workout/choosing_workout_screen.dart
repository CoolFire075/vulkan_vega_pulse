import 'package:flutter/material.dart';
import 'package:vulkan_vega_pulse/start/welcome_screen.dart';
import 'package:vulkan_vega_pulse/choosing_workout/workout_screen.dart';

import '../exercises/exercises.dart';
import '../home/my_home_page.dart';

class ChoosingWorkoutScreen extends StatefulWidget {
  bool isCardioChosen;
  bool isHIITChosen;

  ChoosingWorkoutScreen({
    super.key,
    required this.isCardioChosen,
    required this.isHIITChosen,
  });

  @override
  State<ChoosingWorkoutScreen> createState() => _ChoosingWorkoutScreenState();
}

class _ChoosingWorkoutScreenState extends State<ChoosingWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Image(
                  image: AssetImage("assets/images/im_second_logo.png"),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 29.7, top: 14.0),
                child: SizedBox(
                  width: 352,
                  height: 39,
                  child: Text(
                    "Choosing a workout",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Colors.black,
                      fontFamily: "Gilroy",
                    ),
                  ),
                ),
              ),
              widget.isCardioChosen
                  ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => WorkoutScreen(
                                time: "15 min",
                                intensity: "Moderate",
                                level: "2",
                                title: 'Fat Burn',
                                goal:
                                    'Burn fat efficiently with\ncontrolled intensity.',
                                exercises: FatBurnExercisesList().exercises,
                                image: "assets/images/im_fat_burn2.png",
                              ),
                        ),
                      );
                    },
                    child: _ImageButtonWidget(
                      image: 'assets/images/im_fat_burn1.png',
                      title: 'Fat Burn',
                      delaying: '15 min',
                      difficulty: 'difficulty 2',
                      intensity: 'medium intensity',
                    ),
                  )
                  : SizedBox(),
              widget.isCardioChosen
                  ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => WorkoutScreen(
                                time: "30 min",
                                intensity: "Medium",
                                level: "2",
                                exercises:
                                    EnduranceBoostExercisesList().exercises,
                                title: 'Endurance Boost',
                                goal:
                                    'Enhance stamina and cardiovascular endurance.',
                                image: 'assets/images/im_endurance_boost.png',
                              ),
                        ),
                      );
                    },
                    child: _ImageButtonWidget(
                      image: 'assets/images/im_endurance_boost.png',
                      title: 'Endurance Boost',
                      delaying: '30 min',
                      difficulty: 'difficulty 1',
                      intensity: 'moderate intensity',
                    ),
                  )
                  : SizedBox(),
              widget.isCardioChosen
                  ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => WorkoutScreen(
                                time: "7 min",
                                intensity: "Light",
                                level: "2",
                                exercises: EasyStartExercisesList().exercises,
                                title: 'Easy Start',
                                goal: 'Gentle warm-up or recovery session.',
                                image: 'assets/images/im_easy_start.jpg',
                              ),
                        ),
                      );
                    },
                    child: _ImageButtonWidget(
                      image: 'assets/images/im_easy_start.jpg',
                      title: 'Easy Start',
                      delaying: '7 min',
                      difficulty: 'difficulty 1',
                      intensity: 'Light',
                    ),
                  )
                  : SizedBox(),
              widget.isHIITChosen
                  ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => WorkoutScreen(
                                time: "20 min",
                                intensity: "High",
                                level: "2",
                                exercises: ExtremeHIITExercisesList().exercises,
                                title: 'Extreme HIIT',
                                goal:
                                    'Maximize calorie burning and build explosive power.',
                                image: 'assets/images/im_extreme_hiit.png',
                              ),
                        ),
                      );
                    },
                    child: _ImageButtonWidget(
                      image: 'assets/images/im_extreme_hiit.png',
                      title: 'Extreme HIIT',
                      delaying: '20 min',
                      difficulty: 'difficulty 3',
                      intensity: 'high intensity',
                    ),
                  )
                  : SizedBox(),
              widget.isHIITChosen
                  ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => WorkoutScreen(
                                time: "25 min",
                                intensity: "High",
                                level: "2",
                                exercises: PowerIntervalsExercisesList().exercises,
                                title: 'Power Intervals',
                                goal:
                                    'Improve cardiovascular performance with short, intense intervals.',
                                image: 'assets/images/im_extreme_hiit.png',
                              ),
                        ),
                      );
                    },
                    child: _ImageButtonWidget(
                      image: 'assets/images/im_extreme_hiit.png',
                      title: 'Power Intervals',
                      delaying: '25 min',
                      difficulty: 'difficulty 2',
                      intensity: 'High',
                    ),
                  )
                  : SizedBox(),
              widget.isHIITChosen
                  ? GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => WorkoutScreen(
                                time: "8 min",
                                intensity: "Very High",
                                level: "3",
                                exercises: TabataBlastExercisesList().exercises,
                                title: 'Tabata Blast',
                                goal:
                                    'Short, extremely intense session for rapid results.',
                                image: 'assets/images/im_extreme_hiit.png',
                              ),
                        ),
                      );
                    },
                    child: _ImageButtonWidget(
                      image: 'assets/images/im_extreme_hiit.png',
                      title: 'Tabata Blast',
                      delaying: '8 min',
                      difficulty: 'difficulty 3',
                      intensity: 'Very High',
                    ),
                  )
                  : SizedBox(),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImageButtonWidget extends StatelessWidget {
  const _ImageButtonWidget({
    super.key,
    required this.image,
    required this.title,
    required this.delaying,
    required this.difficulty,
    required this.intensity,
  });

  final String image;
  final String title;
  final String delaying;
  final String difficulty;
  final String intensity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 13.0, left: 29.7),
      child: Container(
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Container(
                height: 127,
                width: 312,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child:
                    image.isEmpty
                        ? Container(
                          width: 352,
                          height: 127,
                          color: Colors.blueGrey,
                        )
                        : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(image, fit: BoxFit.cover),
                          ),
                        ),
              ),
            ),
            Container(
              width: 300,
              height: 127,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                gradient: LinearGradient(
                  colors: [Colors.blueGrey, Colors.transparent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, left: 15.0),
                  child: Container(
                    height: 29,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: "GilRoy",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                _TinyWidget(title: delaying, icon: Icons.av_timer_outlined),
                _TinyWidget(
                  title: difficulty,
                  icon: Icons.fitness_center_outlined,
                ),
                _TinyWidget(title: intensity, icon: Icons.flash_on_outlined),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TinyWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const _TinyWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 3.0),
      child: Container(
        height: 19,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 19,
              height: 19,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500),
                color: Color.fromRGBO(253, 92, 52, 1),
              ),
              child: Center(child: Icon(icon, color: Colors.white, size: 18)),
            ),
            SizedBox(width: 5),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DarkOverlayScreen extends StatelessWidget {
  DarkOverlayScreen({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        image.isEmpty
            ? Container(width: 352, height: 127, color: Colors.blueGrey)
            : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
        // Dark Gradient Overlay (left side)
        Container(
          width: 352,
          height: 30,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black87, Colors.transparent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        // Content
      ],
    );
  }
}
