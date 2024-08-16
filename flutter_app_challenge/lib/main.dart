import 'package:flutter/material.dart';
import 'package:flutter_app_challenge/UI/screens/homeScreen.dart';
import 'package:flutter_app_challenge/domain/buisnessLogic/providers/themeProvider.dart';
import 'package:flutter_app_challenge/routes/constRoutes.dart';
import 'package:provider/provider.dart';
import 'routes/routes.dart' as routes;

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My challenge App',
      theme: Provider.of<ThemeProvider>(context).themeData,
      onGenerateRoute: routes.Router.generateRoutes,
      initialRoute: homeRoute,
      home: HomeScreen(),
    );
  }
}
