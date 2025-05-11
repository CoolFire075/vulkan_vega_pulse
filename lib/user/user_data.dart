import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static final UserData _instance = UserData._internal();
  factory UserData() => _instance;
  UserData._internal();

  int age = 0;
  double height = 0.0;
  double weight = 0.0;
  String gender = "male";
  bool isFirstLaunch = true;

  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    age = prefs.getInt('age') ?? 0;
    height = prefs.getDouble('height') ?? 0.0;
    weight = prefs.getDouble('weight') ?? 0.0;
    gender = prefs.getString('gender') ?? "male";
    isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
  }

  Future<void> saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('age', age);
    prefs.setDouble('height', height);
    prefs.setDouble('weight', weight);
    prefs.setString('gender', gender);
    prefs.setBool('isFirstLaunch', isFirstLaunch);
  }
}
