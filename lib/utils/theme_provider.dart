import 'package:flutter/material.dart';
import 'package:mercury/managers/shared_preference_manager_impl.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeMode themeMode = sharedPreferenceManager.getTheme();
  SharedPreferenceManager sharedPreferenceManager;
  ThemeProvider({
    required this.sharedPreferenceManager,
  });
  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    sharedPreferenceManager.setTheme(themeMode);
    notifyListeners();
  }
}
