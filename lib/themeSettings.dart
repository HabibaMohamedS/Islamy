import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettings with ChangeNotifier {
  String localCode = '';
  bool get isDark => appTheme == ThemeMode.dark;
  ThemeMode? appTheme;
  String language = 'en';
  String theme = '';
  ThemeSettings(String language, this.theme) {
    localCode = language;
    appTheme = (theme == 'light') ? ThemeMode.light : ThemeMode.dark;
  }

  saveChangedTheme(String themeMode) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    appTheme = (themeMode == 'light') ? ThemeMode.light : ThemeMode.dark;
    theme = themeMode;
    await preferences.setString('theme', themeMode);
    notifyListeners();
  }

  void changeLanguage(String locale) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    localCode = locale;
    await preferences.setString('language', locale);
    notifyListeners();
  }
}
