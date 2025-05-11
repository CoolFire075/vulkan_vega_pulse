import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vulkan_vega_pulse/choosing_workout/choosing_workout_screen.dart';
import 'package:vulkan_vega_pulse/individual_training/custom_free_workout_screen.dart';
import 'choosing_workout/workout_screen.dart';
import 'exercises/exercises.dart';
import 'exercises/workout_result.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Image.asset("assets/images/im_second_logo.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 29.7, top: 14.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 352,
                      height: 39,
                      child: Center(
                        child: Text(
                          "Select training type:",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 30,
                            color: Colors.black,
                            fontFamily: "Gilroy",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    WorkoutMode(),
                    _WorkoutImages(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 30.0),
                child: Container(
                  color: Colors.black38,
                  width: MediaQuery.of(context).size.width - 60,
                  height: 1,
                ),
              ),
              // SimpleChartScreen(),
              WorkoutChartScreen(),
              // WorkoutChartScreen2(),
              // SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Heart rate zone chart for the last week",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

class _WorkoutImages extends StatelessWidget {
  const _WorkoutImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/im_cardio_workouts.png",
                    fit: BoxFit.cover,
                    width: 352,
                    height: 127,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 64.0, left: 15),
                    child: Text(
                      "Cardio\nWorkouts",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Gilroy",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/im_hiit_session.jpg",
                      width: 260,
                      height: 127,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 64.0, left: 15),
                      child: Text(
                        "HIIT\nSessions",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/im_free_training_mode2.jpg",
                      fit: BoxFit.cover,
                      width: 240,
                      height: 127,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 64.0, left: 15),
                      child: Text(
                        "Free \nTraining Mode",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/im_easy_start.jpg",
                      fit: BoxFit.cover,
                      width: 240,
                      height: 127,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 64.0, left: 15),
                      child: Text(
                        "Easy \nStart Mode",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}

class WorkoutMode extends StatefulWidget {
  const WorkoutMode({super.key});

  @override
  State<WorkoutMode> createState() => _WorkoutModeState();
}

class _WorkoutModeState extends State<WorkoutMode> {
  final String title1 = "Cardio Workouts";
  final String title2 = "HIIT Sessions";
  final String title3 = "Free Training Mode";

  Color color1 = Color.fromRGBO(255, 104, 66, 1);
  Color textColor1 = Color.fromRGBO(255, 255, 255, 1);
  bool isButton1Chosen = true;
  Color color2 = Color.fromRGBO(255, 255, 255, 1);
  Color textColor2 = Colors.blueGrey;
  bool isButton2Chosen = false;
  Color color3 = Color.fromRGBO(255, 255, 255, 1);
  Color textColor3 = Colors.blueGrey;
  bool isButton3Chosen = false;

  void changeColor1() {
    setState(() {
      isButton1Chosen = true;
      isButton2Chosen = false;
      isButton3Chosen = false;
      color1 =
          (color1 == Color.fromRGBO(255, 104, 66, 1))
              ? Color.fromRGBO(255, 255, 255, 1)
              : Color.fromRGBO(255, 104, 66, 1);

      textColor1 =
          (textColor1 == Color.fromRGBO(255, 255, 255, 1))
              ? Colors.blueGrey
              : Color.fromRGBO(255, 255, 255, 1);
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => ChoosingWorkoutScreen(
              isCardioChosen: true,
              isHIITChosen: false,
            ),
      ),
    );
  }

  void changeColor2() {
    setState(() {
      isButton1Chosen = false;
      isButton2Chosen = true;
      isButton3Chosen = false;
      color2 =
          (color2 == Color.fromRGBO(255, 104, 66, 1))
              ? Color.fromRGBO(255, 255, 255, 1)
              : Color.fromRGBO(255, 104, 66, 1);

      textColor2 =
          (textColor2 == Color.fromRGBO(255, 255, 255, 1))
              ? Colors.blueGrey
              : Color.fromRGBO(255, 255, 255, 1);
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => ChoosingWorkoutScreen(
              isCardioChosen: false,
              isHIITChosen: true,
            ),
      ),
    );
  }

  void changeColor3() {
    setState(() {
      isButton1Chosen = false;
      isButton2Chosen = false;
      isButton3Chosen = true;
      color3 =
          (color3 == Color.fromRGBO(255, 104, 66, 1))
              ? Color.fromRGBO(255, 255, 255, 1)
              : Color.fromRGBO(255, 104, 66, 1);

      textColor3 =
          (textColor3 == Color.fromRGBO(255, 255, 255, 1))
              ? Colors.blueGrey
              : Color.fromRGBO(255, 255, 255, 1);
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CustomFreeWorkoutScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildModeButton(title1, isButton1Chosen, changeColor1),
          SizedBox(width: 18),
          _buildModeButton(title2, isButton2Chosen, changeColor2),
          SizedBox(width: 18),
          _buildModeButton(title3, isButton3Chosen, changeColor3),
        ],
      ),
    );
  }

  Widget _buildModeButton(String title, bool isChosen, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color:
              isChosen
                  ? Color.fromRGBO(255, 104, 66, 1)
                  : Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(500),
        ),
        child: Text(
          title,
          style: TextStyle(
            color:
                isChosen ? Color.fromRGBO(255, 255, 255, 1) : Colors.blueGrey,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class ToggleButtonsRow extends StatelessWidget {
  final bool isWeekView;
  final Function(bool) onToggle;

  const ToggleButtonsRow({required this.isWeekView, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton('Неделя', isWeekView, () => onToggle(true)),
        SizedBox(width: 10),
        _buildButton('Месяц', !isWeekView, () => onToggle(false)),
      ],
    );
  }

  Widget _buildButton(String text, bool isSelected, VoidCallback onPressed) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 100),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.grey,
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Text(text),
      ),
    );
  }
}

class SimpleChartScreen extends StatelessWidget {
  const SimpleChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> spots = [
      FlSpot(0, 120),
      FlSpot(1, 180),
      FlSpot(2, 160),
      FlSpot(3, 220),
      FlSpot(4, 167),
    ];

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 360,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Weekly Progress',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // 🔒 Безопасная обёртка с фиксированной высотой и шириной
            SizedBox(
              height: 220,
              width: double.infinity,
              child: LineChart(
                LineChartData(
                  minY: 50,
                  maxY: 250,
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                      dotData: FlDotData(show: true),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget:
                            (value, _) => Text('Day ${value.toInt() + 1}'),
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                        interval: 50,
                        getTitlesWidget: (value, _) => Text('${value.toInt()}'),
                      ),
                    ),
                  ),
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutChartScreen extends StatefulWidget {
  const WorkoutChartScreen({super.key});

  @override
  State<WorkoutChartScreen> createState() => _WorkoutChartScreenState();
}

class _WorkoutChartScreenState extends State<WorkoutChartScreen> {
  List<FlSpot> _pulseSpots = [];
  int totalWorkouts = 0;
  double totalPulse = 0;
  double averagePulseWeek = 0;
  double averagePulseMonth = 0;
  int totalHours = 0;
  int totalMinutes = 0;
  int totalSeconds = 0;

  DateTime? selectedDateRange; // Для переключения между неделей и месяцем

  @override
  void initState() {
    super.initState();
    selectedDateRange = DateTime.now().subtract(
      const Duration(days: 6),
    ); // Начинаем с недели
    _loadData();
  }

  void _loadData() {
    final box = Hive.box<WorkoutResult>('workout_results');
    final now = DateTime.now();

    final dateRangeStart = selectedDateRange!;
    final dateRangeEnd = selectedDateRange!.add(
      Duration(days: 7),
    ); // Для недели

    Map<int, double> dayToPulses = {}; // Для хранения пульса
    Map<int, int> dayToPulseCount =
        {}; // Для подсчета числа тренировок с пульсом

    totalWorkouts = 0;
    totalSeconds = 0;
    totalMinutes = 0;
    totalHours = 0;

    for (var result in box.values) {
      if (result is WorkoutResult) {
        final date = DateTime(
          result.dateTime.year,
          result.dateTime.month,
          result.dateTime.day,
        );
        if (date.isBefore(dateRangeStart)) continue;
        if (date.isAfter(dateRangeEnd)) continue;

        totalWorkouts++;

        // Подсчёт общей длительности тренировки
        int durationForWorkout = result.exercises.fold(
          0,
          (sum, ex) => sum + ex.duration,
        );
        totalSeconds += durationForWorkout;
      }
    }

    for (var result in box.values) {
      if (result is WorkoutResult) {
        final date = DateTime(
          result.dateTime.year,
          result.dateTime.month,
          result.dateTime.day,
        );
        if (date.isBefore(dateRangeStart)) continue;
        if (date.isAfter(dateRangeEnd)) continue;

        final index = date.difference(dateRangeStart).inDays;
        int seconds = 0;
        double? pulseForDay;

        // Сохраняем пульс тренировки, если он существует
        if (result.pulse != null) {
          pulseForDay = result.pulse!.toDouble();
        }

        // Если пульс существует для тренировки, добавляем его для вычисления среднего пульса
        if (pulseForDay != null) {
          dayToPulses[index] = (dayToPulses[index] ?? 0) + pulseForDay;
          dayToPulseCount[index] = (dayToPulseCount[index] ?? 0) + 1;
        }
      }
    }

    totalMinutes = totalSeconds ~/ 60;
    totalHours = totalMinutes ~/ 60;
    totalMinutes = totalMinutes % 60;

    totalWorkouts = 0;
    totalPulse = 0;

    for (var result in box.values) {
      if (result is WorkoutResult) {
        final date = DateTime(
          result.dateTime.year,
          result.dateTime.month,
          result.dateTime.day,
        );
        if (date.isBefore(dateRangeStart)) continue;
        if (date.isAfter(dateRangeEnd)) continue;

        final index = date.difference(dateRangeStart).inDays;
        double? pulseForDay;

        // Сохраняем пульс тренировки, если он существует
        if (result.pulse != null) {
          pulseForDay = result.pulse!.toDouble();
        }

        if (pulseForDay != null) {
          dayToPulses[index] = (dayToPulses[index] ?? 0) + pulseForDay;
          dayToPulseCount[index] = (dayToPulseCount[index] ?? 0) + 1;
          totalPulse += pulseForDay;
          totalWorkouts++;
        }
      }
    }

    _pulseSpots =
        dayToPulses.entries
            .map(
              (e) => FlSpot(
                e.key.toDouble(),
                (e.value / (dayToPulseCount[e.key] ?? 1)).toDouble(),
              ),
            )
            .toList();
    _pulseSpots.sort((a, b) => a.x.compareTo(b.x));

    // Вычисляем средний пульс для недели и месяца
    if (totalWorkouts > 0) {
      averagePulseWeek = totalPulse / totalWorkouts;
      averagePulseMonth = averagePulseWeek; // Для месяца аналогично
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  void _toggleDateRange() {
    setState(() {
      if (selectedDateRange!.isBefore(
        DateTime.now().subtract(const Duration(days: 30)),
      )) {
        selectedDateRange = DateTime.now().subtract(
          const Duration(days: 30),
        ); // Переключаемся на месяц
      } else {
        selectedDateRange = DateTime.now().subtract(
          const Duration(days: 6),
        ); // Переключаемся на неделю
      }
      _loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 31.0),
            child: Row(
              children: [
                Text(
                  "Brief statistics:",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontFamily: "Gilroy",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '75%',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(53, 128, 202, 1),
                                    ),
                                  ),
                                ],
                              ),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(500),
                                border: Border.all(
                                  width: 2,
                                  color: Color.fromRGBO(53, 128, 202, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'All workouts',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Gilroy",
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Text(
                              '$totalWorkouts',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(53, 128, 202, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  width: 352,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '75%',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(20, 179, 201, 1),
                                  ),
                                ),
                              ],
                            ),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(500),
                              border: Border.all(
                                width: 2,
                                color: Color.fromRGBO(20, 179, 201, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total time',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Gilroy",
                              color: Colors.grey.shade500,
                            ),
                          ),
                          Text(
                            '$totalHours h. $totalMinutes min.',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(20, 179, 201, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                width: 352,
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),
          // const Text(
          //   'Pulse Chart',
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          // ),
          const SizedBox(height: 12),
          Container(
            width: MediaQuery.of(context).size.width - 32,
            height: 220,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child:
                _pulseSpots.isEmpty
                    ? const Center(child: Text('No data'))
                    : LineChart(
                      LineChartData(
                        maxY: 200,
                        minY: 100,
                        lineBarsData: [
                          LineChartBarData(
                            spots: _pulseSpots,
                            isCurved: true,
                            barWidth: 2,
                            color: Colors.blueGrey,
                            dotData: FlDotData(show: true),
                          ),
                        ],
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 1,
                              getTitlesWidget: (value, _) {
                                final date = DateTime.now()
                                    .subtract(const Duration(days: 6))
                                    .add(Duration(days: value.toInt()));
                                return Text(
                                  '${date.day}',
                                  style: const TextStyle(fontSize: 10),
                                );
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                              interval: 20,
                              getTitlesWidget:
                                  (value, _) => Text('${value.toInt()}'),
                            ),
                          ),
                        ),
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(show: true),
                      ),
                    ),
          ),
          // const SizedBox(height: 24),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     _statCard(
          //       'Avg Pulse (Week)',
          //       averagePulseWeek.toStringAsFixed(1),
          //     ),
          //     _statCard(
          //       'Avg Pulse (Month)',
          //       averagePulseMonth.toStringAsFixed(1),
          //     ),
          //   ],
          // ),
          // ElevatedButton(
          //   onPressed: _toggleDateRange,
          //   child: Text(
          //     selectedDateRange!.isBefore(
          //           DateTime.now().subtract(const Duration(days: 30)),
          //         )
          //         ? 'Show Month'
          //         : 'Show Week',
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _statCard(String label, String value) {
    return Container(
      width: 160,
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class WorkoutChartScreen2 extends StatefulWidget {
  const WorkoutChartScreen2({super.key});

  @override
  State<WorkoutChartScreen2> createState() => _WorkoutChartScreenState2();
}

class _WorkoutChartScreenState2 extends State<WorkoutChartScreen2> {
  List<FlSpot> _pulseSpots = [
    FlSpot(DateTime.now().day.toDouble(), 220),
    FlSpot(
      DateTime.now().subtract(const Duration(days: 1)).day.toDouble(),
      180,
    ),
    FlSpot(
      DateTime.now().subtract(const Duration(days: 2)).day.toDouble(),
      200,
    ),
    FlSpot(
      DateTime.now().subtract(const Duration(days: 3)).day.toDouble(),
      220,
    ),
    FlSpot(
      DateTime.now().subtract(const Duration(days: 4)).day.toDouble(),
      180,
    ),
    FlSpot(
      DateTime.now().subtract(const Duration(days: 5)).day.toDouble(),
      200,
    ),
    FlSpot(
      DateTime.now().subtract(const Duration(days: 6)).day.toDouble(),
      180,
    ),
    FlSpot(
      DateTime.now().subtract(const Duration(days: 7)).day.toDouble(),
      200,
    ),
    FlSpot(
      DateTime.now().subtract(const Duration(days: 8)).day.toDouble(),
      180,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Pulse Chart',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            width: MediaQuery.of(context).size.width - 32,
            height: 220,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child:
                _pulseSpots.isEmpty
                    ? const Center(child: Text('No data'))
                    : LineChart(
                      LineChartData(
                        maxY: 250,
                        minY: 50,
                        lineBarsData: [
                          LineChartBarData(
                            spots: _pulseSpots,
                            isCurved: true,
                            barWidth: 2,
                            color: Colors.red,
                            dotData: FlDotData(show: true),
                          ),
                        ],
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 1,
                              getTitlesWidget: (value, _) {
                                final date = DateTime.now()
                                    .subtract(const Duration(days: 6))
                                    .add(Duration(days: value.toInt()));
                                return Text(
                                  '${date.day}/${date.month}',
                                  style: const TextStyle(fontSize: 10),
                                );
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                              interval: 10,
                              getTitlesWidget:
                                  (value, _) => Text('${value.toInt()}'),
                            ),
                          ),
                        ),
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(show: true),
                      ),
                    ),
          ),
        ],
      ),
    );
  }

  Widget _statCard(String label, String value) {
    return Container(
      width: 160,
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
