import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import 'package:hive_flutter/hive_flutter.dart';

import '../exercises/workout_result.dart';

class WorkoutCalendarScreen extends StatefulWidget {
  const WorkoutCalendarScreen({super.key});

  @override
  State<WorkoutCalendarScreen> createState() => _WorkoutCalendarScreenState();
}

class _WorkoutCalendarScreenState extends State<WorkoutCalendarScreen> {
  late Map<DateTime, List<WorkoutResult>> _groupedResults;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _groupedResults = {};
    _loadResults();
  }

  Future<void> _loadResults() async {
    try {
      final results =
          await Hive.box<WorkoutResult>('workout_results').values.toList();
      _groupedResults.clear();
      for (final result in results) {
        final day = DateTime.utc(
          result.dateTime.year,
          result.dateTime.month,
          result.dateTime.day,
        );
        if (_groupedResults[day] == null) {
          _groupedResults[day] = [];
        }
        _groupedResults[day]!.add(result);
      }
      // Ensure we update the UI only if the widget is still mounted.
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      // Handle errors here if necessary
      print('Error loading results: $e');
    }
  }

  List<WorkoutResult> _getResultsForDay(DateTime day) {
    return _groupedResults[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  onFormatChanged(CalendarFormat format) {
    setState(() {
      _calendarFormat = format;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Workout Progress Calendar")),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Text(
              "Workout Progress Calendar",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2100, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month',
                CalendarFormat.week: 'Week',
              },
              eventLoader: _getResultsForDay,
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                markerDecoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children:
                    _getResultsForDay(_selectedDay!).map((result) {
                      return ExpansionTile(
                        leading: const Icon(Icons.fitness_center),
                        title: Text(result.title),
                        subtitle: Text(
                          "Date: ${DateFormat('hh:mm dd.MM.yyyy').format(result.dateTime)}",
                        ),
                        children:
                            result.exercises
                                .map(
                                  (ex) => ListTile(
                                    title: Text(ex.title),
                                    subtitle: Text(
                                      "${ex.duration} • ${result.exercises[result.exercises.indexOf(ex)]}",
                                    ),
                                  ),
                                )
                                .toList(),
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
