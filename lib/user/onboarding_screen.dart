import 'package:flutter/material.dart';
import 'package:vulkan_vega_pulse/home/my_home_page.dart';
import 'package:vulkan_vega_pulse/user/user_data.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int age = 18;
  double height = 170;
  double weight = 60;
  String gender = "male";

  void _saveDataAndContinue() async {
    final userData = UserData();
    userData.age = age;
    userData.height = height;
    userData.weight = weight;
    userData.gender = gender;
    userData.isFirstLaunch = false;
    await userData.saveToPrefs();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => MyHomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Select Gender"),
            DropdownButton<String>(
              value: gender,
              onChanged: (val) => setState(() => gender = val!),
              items:
                  ["male", "female"]
                      .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                      .toList(),
            ),
            Text("Age: $age"),
            Slider(
              value: age.toDouble(),
              min: 10,
              max: 100,
              divisions: 90,
              label: "$age",
              onChanged: (val) => setState(() => age = val.round()),
            ),
            Text("Height: ${height.toStringAsFixed(1)} cm"),
            Slider(
              value: height,
              min: 100,
              max: 220,
              divisions: 120,
              label: "${height.toStringAsFixed(1)}",
              onChanged: (val) => setState(() => height = val),
            ),
            Text("Weight: ${weight.toStringAsFixed(1)} kg"),
            Slider(
              value: weight,
              min: 30,
              max: 150,
              divisions: 120,
              label: "${weight.toStringAsFixed(1)}",
              onChanged: (val) => setState(() => weight = val),
            ),
            ElevatedButton(
              onPressed: _saveDataAndContinue,
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
