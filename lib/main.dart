import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vulkan_vega_pulse/home/my_home_page.dart';
import 'package:vulkan_vega_pulse/user/onboarding_screen.dart';
import 'package:vulkan_vega_pulse/user/user_data.dart';
import 'exercises/exercise_result.dart';
import 'exercises/workout_result.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Только вертикально вверх
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(WorkoutResultAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(ExerciseResultAdapter());
  }
  await Hive.openBox<WorkoutResult>('workout_results');
  await UserData().loadFromPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder:
                (_) =>
                    UserData().isFirstLaunch
                        ? OnboardingScreen()
                        : MyHomePage(),
          ),
        );
      });
    });

    return Scaffold(
      backgroundColor: const Color(0xFF1C1B2D),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/im_cycling.webp',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            opacity:  const AlwaysStoppedAnimation<double>(0.2),
          ),
          Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 64),
                  Image.asset(
                    'assets/images/im_logo.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 182),
                  const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'loading...',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
