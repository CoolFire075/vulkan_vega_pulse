import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vulkan_vega_pulse/exercises/workout_result.dart';

import '../choosing_workout/training_session_screen.dart';
import '../choosing_workout/workout_screen.dart';
import '../exercises/exercises.dart';

class CustomFreeWorkoutScreen extends StatefulWidget {
  const CustomFreeWorkoutScreen({Key? key}) : super(key: key);

  @override
  State<CustomFreeWorkoutScreen> createState() =>
      _CustomFreeWorkoutScreenState();
}

class _CustomFreeWorkoutScreenState extends State<CustomFreeWorkoutScreen> {
  final _formKey = GlobalKey<FormState>();

  final List<String> exercises = ['Cardio', 'Extreme HIIT'];
  String selectedExercise = 'Cardio';

  final durationController = TextEditingController();
  final loadTypeController = TextEditingController();
  final pulseZoneController = TextEditingController();
  final repetitionsController = TextEditingController();
  final timerController = TextEditingController();

  List<IndividualCardioExercisesList> cardioList = [];
  List<IndividualHIITExercisesList> hIITList = [];

  @override
  void dispose() {
    durationController.dispose();
    loadTypeController.dispose();
    pulseZoneController.dispose();
    repetitionsController.dispose();
    timerController.dispose();
    super.dispose();
  }

  void addCardio() {
    setState(() {
      cardioList.add(
        IndividualCardioExercisesList(
          breakTime: int.tryParse(durationController.text) ?? 0,
          repetitions: int.tryParse(repetitionsController.text) ?? 0,
        ),
      );
    });
  }

  void addHIIT() {
    setState(() {
      hIITList.add(
        IndividualHIITExercisesList(
          breakTime: int.tryParse(durationController.text) ?? 0,
          repetitions: int.tryParse(repetitionsController.text) ?? 0,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/im_individual_training.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Custom Free Workout Screen',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Adding exercises:',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: selectedExercise,
                        dropdownColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        items:
                            exercises.map((exercise) {
                              return DropdownMenuItem<String>(
                                value: exercise,
                                child: Text(exercise),
                              );
                            }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedExercise = value;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      _buildDoubleRow(
                        'Break Duration (sec.)',
                        durationController,
                        true,
                        'Load type',
                        loadTypeController,
                        false,
                      ),
                      const SizedBox(height: 20),
                      _buildDoubleRow(
                        'Pulse zone',
                        pulseZoneController,
                        true,
                        'Repetitions',
                        repetitionsController,
                        true,
                      ),
                      const SizedBox(height: 20),
                      _buildInput('Timer (sec.)', timerController, true),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF6232),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              int time =
                                  int.tryParse(repetitionsController.text) ?? 0;
                              // Все поля заполнены корректно
                              selectedExercise == 'Cardio'
                                  ? addCardio()
                                  : addHIIT();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (_) => TrainingSessionScreen(
                                        time: "${6 * time} min",
                                        intensity: loadTypeController.text,
                                        level: "1",
                                        exercises:
                                            selectedExercise == 'Cardio'
                                                ? IndividualCardioExercisesList(
                                                  breakTime:
                                                      int.tryParse(
                                                        durationController.text,
                                                      ) ??
                                                      0,
                                                  repetitions:
                                                      int.tryParse(
                                                        repetitionsController
                                                            .text,
                                                      ) ??
                                                      0,
                                                ).exercises
                                                : IndividualHIITExercisesList(
                                                  breakTime:
                                                      int.tryParse(
                                                        durationController.text,
                                                      ) ??
                                                      0,
                                                  repetitions:
                                                      int.tryParse(
                                                        repetitionsController
                                                            .text,
                                                      ) ??
                                                      0,
                                                ).exercises,
                                        title: selectedExercise,
                                        goal: "goal",
                                        breakTime:
                                            int.tryParse(
                                              durationController.text,
                                            ) ??
                                            0,
                                        repetitions:
                                            int.tryParse(
                                              repetitionsController.text,
                                            ) ??
                                            0,
                                      ),
                                ),
                              );
                            }
                          },
                          child: const Text(
                            'Save & Start',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 200),
                        child: ListView.builder(
                          itemCount: cardioList.length,
                          itemBuilder: (context, index) {
                            return _IndividualTrainingListWidget(
                              repetitions: cardioList[index].repetitions,
                              breakTime: cardioList[index].breakTime,
                              title: cardioList[index].exercises.toString(),
                            );
                          },
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 200),
                        child: ListView.builder(
                          itemCount: hIITList.length,
                          itemBuilder: (context, index) {
                            return _IndividualTrainingListWidget(
                              repetitions: hIITList[index].repetitions,
                              breakTime: hIITList[index].breakTime,
                              title: hIITList[index].exercises.toString(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoubleRow(
    String label1,
    TextEditingController controller1,
    bool isNumber1,
    String label2,
    TextEditingController controller2,
    bool isNumber2,
  ) {
    return Row(
      children: [
        Expanded(child: _buildInput(label1, controller1, isNumber1)),
        const SizedBox(width: 12),
        Expanded(child: _buildInput(label2, controller2, isNumber2)),
      ],
    );
  }

  Widget _buildInput(
    String label,
    TextEditingController controller,
    bool isNumber,
  ) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      inputFormatters: isNumber ? [FilteringTextInputFormatter.digitsOnly] : [],
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white30),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.orangeAccent),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Поле не может быть пустым';
        }
        return null;
      },
    );
  }
}

class _IndividualTrainingListWidget extends StatelessWidget {
  const _IndividualTrainingListWidget({
    super.key,
    required this.repetitions,
    required this.breakTime,
    required this.title,
  });

  final int repetitions;
  final int breakTime;
  final String title;

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
                child: Container(
                  width: 352,
                  height: 127,
                  color: Colors.blueGrey,
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
                      'title',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: "GilRoy",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:vulkan_vega_pulse/choosing_workout/workout_screen.dart';
//
// import '../exercises/exercises.dart';
//
// class CustomFreeWorkoutScreen extends StatefulWidget {
//   const CustomFreeWorkoutScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CustomFreeWorkoutScreen> createState() =>
//       _CustomFreeWorkoutScreenState();
// }
//
// class _CustomFreeWorkoutScreenState extends State<CustomFreeWorkoutScreen> {
//   final List<String> exercises = [
//     'Fat Burn',
//     'Extreme HIIT',
//     'Endurance Boost',
//   ];
//   String selectedExercise = 'Fat Burn';
//   final TextEditingController _controller = TextEditingController();
//   bool _isInputValid = false;
//
//   final TextEditingController durationController = TextEditingController();
//   final TextEditingController loadTypeController = TextEditingController();
//   final TextEditingController pulseZoneController = TextEditingController();
//   final TextEditingController repetitionsController = TextEditingController();
//   final TextEditingController timerController = TextEditingController();
//
//   @override
//   void dispose() {
//     durationController.dispose();
//     loadTypeController.dispose();
//     pulseZoneController.dispose();
//     repetitionsController.dispose();
//     timerController.dispose();
//     super.dispose();
//   }
//   void _validateInput() {
//     setState(() {
//       _isInputValid = _controller.text.trim().isNotEmpty;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/im_individual_training.png'),
//                 fit: BoxFit.cover,
//                 colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
//               ),
//             ),
//           ),
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Custom Free Workout Screen',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     const Text(
//                       'Adding exercises:',
//                       style: TextStyle(fontSize: 16, color: Colors.white70),
//                     ),
//                     const SizedBox(height: 12),
//                     DropdownButtonFormField<String>(
//                       value: selectedExercise,
//                       dropdownColor: Colors.white,
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       items:
//                           [
//                             selectedExercise,
//                             ...exercises.where((e) => e != selectedExercise),
//                           ].map((exercise) {
//                             return DropdownMenuItem<String>(
//                               value: exercise,
//                               child: Text(
//                                 exercise,
//                                 style: TextStyle(
//                                   fontWeight:
//                                       exercise == selectedExercise
//                                           ? FontWeight.bold
//                                           : FontWeight.normal,
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                       onChanged: (value) {
//                         if (value != null) {
//                           setState(() {
//                             selectedExercise = value;
//                           });
//                         }
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     _buildDoubleRow(
//                       'Duration (min.)',
//                       durationController,
//                       'Load type',
//                       loadTypeController,
//                     ),
//                     const SizedBox(height: 20),
//                     _buildDoubleRow(
//                       'Pulse zone',
//                       pulseZoneController,
//                       'Repetitions',
//                       repetitionsController,
//                     ),
//                     const SizedBox(height: 20),
//                     _buildInput('Timer (sec.)', timerController),
//                     const SizedBox(height: 30),
//                     SizedBox(
//                       width: double.infinity,
//                       height: 55,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFFFF6232),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder:
//                                   (_) => WorkoutScreen(
//                                     time:
//                                         "${durationController.text.toString()} min",
//                                     intensity:
//                                         loadTypeController.text.toString(),
//                                     level: "1",
//                                     exercises:
//                                         selectedExercise == 'Fat Burn'
//                                             ? FatBurnExercisesList().exercises
//                                             : selectedExercise ==
//                                                 'Endurance Boost'
//                                             ? EnduranceBoostExercisesList()
//                                                 .exercises
//                                             : ExtremeHIITExercisesList()
//                                                 .exercises,
//                                     title: selectedExercise,
//                                     goal: "goal",
//                                     image: "",
//                                   ),
//                             ),
//                           );
//                           // Обработка сохранения и старта
//                         },
//                         child: const Text(
//                           'Save & Start',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDoubleRow(
//     String label1,
//     TextEditingController controller1,
//     String label2,
//     TextEditingController controller2,
//   ) {
//     return Row(
//       children: [
//         Expanded(child: _buildInput(label1, controller1)),
//         const SizedBox(width: 12),
//         Expanded(child: _buildInput(label2, controller2)),
//       ],
//     );
//   }
//
//   Widget _buildInput(String label, TextEditingController controller) {
//     return TextField(
//       controller: controller,
//       style: const TextStyle(color: Colors.white),
//       keyboardType: TextInputType.text,
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Colors.white70),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.white30),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.orangeAccent),
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     );
//   }
// }
