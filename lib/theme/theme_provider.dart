import 'package:flutter/material.dart';
import 'package:todoapp/theme/dark_theme.dart';
import 'package:todoapp/theme/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  //initialize the theme to lightMode
  ThemeData _themeData = lightMode;

  // get the theme
  ThemeData get themeData => _themeData;

  //isDarkMode On
  bool get isDarkMode => themeData == darkMode;

  //set the theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;

    notifyListeners();
  }

  //toggle Theme
  void toggleTheme() {
    themeData = _themeData == lightMode ? darkMode : lightMode;
  }
}
