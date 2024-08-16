import 'package:flutter/material.dart';
import 'package:flutter_app_challenge/themes/colors_theme.dart';


   ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blueGrey,
      primaryColorLight: Colors.white,
      primaryColor: ColorsTheme.primaryLight,
      fontFamily: 'Montserrat',
      useMaterial3: false);

   ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.grey,
      primaryColorLight: Colors.black,
      primaryColor: ColorsTheme.primaryDark,
      fontFamily: 'Montserrat',
      scaffoldBackgroundColor: Colors.black,
      useMaterial3: false);

