

import 'package:flutter/material.dart';
import 'package:flutter_app_challenge/UI/screens/articleScreen.dart';
import 'package:flutter_app_challenge/UI/screens/homeScreen.dart';
import 'package:flutter_app_challenge/routes/constRoutes.dart';

class Router {
  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    dynamic arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      case homeRoute:
      return MaterialPageRoute(builder: (_) =>  HomeScreen());
      case articleRoute:
      return MaterialPageRoute(builder: (_) =>  Articlescreen(article: arguments));
      default:
      return MaterialPageRoute(builder: (_) => const Scaffold(
        body: Center(
          child: Text('No data'),
        ),
      ));
    }
  }
}