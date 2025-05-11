import 'package:flutter/material.dart';
import 'package:vulkan_vega_pulse/choosing_workout/choosing_workout_screen.dart';
import 'package:vulkan_vega_pulse/choosing_workout/training_session_screen.dart';
import 'package:vulkan_vega_pulse/my_progress/workout_calendar_screen.dart';
import 'package:vulkan_vega_pulse/home_screen.dart';
import 'package:vulkan_vega_pulse/choosing_workout/workout_screen.dart';

import '../exercises/exercises.dart';
import '../individual_training/custom_free_workout_screen.dart';
import '../my_progress/my_progress_screen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ChoosingWorkoutScreen(isCardioChosen: true, isHIITChosen: true),
    CustomFreeWorkoutScreen(),
    MyProgressScreen(),
    // WorkoutCalendarScreen(),
    // TimerScalePage(),
  ];

  void _onTapBarTapped(int index) {
    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: _pages,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [_buildNavIcon(Icons.home_outlined, 0, "Home")],
                    ),
                  ),
                  Container(
                    height: 85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildNavIcon(
                          Icons.fitness_center,
                          1,
                          "Choosing\na workout",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildNavIcon(
                          Icons.event_note_outlined,
                          2,
                          "Individual\n  training",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildNavIcon(
                          Icons.emoji_events,
                          3,
                          "     My\nprogress",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index, String text) {
    return GestureDetector(
      child: Container(
        child: Column(
          children: [
            Icon(
              icon,
              color:
                  _currentIndex == index
                      ? Color.fromRGBO(235, 89, 53, 1)
                      : Colors.black38,
            ),
            Text(
              text,
              style: TextStyle(
                color:
                    _currentIndex == index
                        ? Color.fromRGBO(235, 89, 53, 1)
                        : Colors.black38,
              ),
            ),
          ],
        ),
      ),
      onTap: () => _onTapBarTapped(index),
    );
  }
}
