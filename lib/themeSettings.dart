import 'package:flutter/material.dart';

class ThemeSettings with ChangeNotifier {
  changeTheme(ThemeMode themeMode) {
    appTheme = themeMode;
    notifyListeners();
  }

  bool get isDark => appTheme == ThemeMode.dark;
  ThemeMode appTheme = ThemeMode.light;
}
