
import 'package:flutter/material.dart';
import 'package:flutter_app_challenge/themes/app_theme%20.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData = lightTheme;

  ThemeData get themeData => _themeData;

  setThemeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  } 

  toggleTheme() {
    if (_themeData == lightTheme) {
      setThemeData(darkTheme);
    } else {
            setThemeData(lightTheme);
    }
  }
}