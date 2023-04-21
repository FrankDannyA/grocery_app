import 'package:flutter/material.dart';
import 'package:grocery_app/services/dark_theme_prefs.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePrefs darkThemePrefs = DarkThemePrefs();

  bool _isDarkTheme = false;
  bool get getDarkTheme => _isDarkTheme;

  set setDarkTheme(bool value) {
    _isDarkTheme = value;
    darkThemePrefs.setDarkTheme(value);
    notifyListeners();
  }
}
