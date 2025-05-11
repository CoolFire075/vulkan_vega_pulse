import 'package:flutter/material.dart';
import 'package:vulkan_vega_pulse/home/my_home_page.dart';

import '../user/onboarding_screen.dart';
import '../user/user_data.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1B2D),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/im_welcome.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            opacity: const AlwaysStoppedAnimation<double>(0.2),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  const SizedBox(), // для балансировки отступов
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/im_logo.png',
                        width: 66,
                        height: 66,
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Welcome\n to Vulkan\n VegaPulse!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Gilroy",
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Boost your cardio and HIIT\n workouts with personalized heart\n rate zone guidance. Track your\n progress, build your endurance,\n and burn fat efficiently.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF5E48),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => MyHomePage()),
                        );
                      },
                      child: const Text(
                        'Get started →',
                        style: TextStyle(fontSize: 18),
                      ),
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
}
