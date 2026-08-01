import 'package:flutter/material.dart';
import 'package:lessons_app/pages/home_page.dart';

void main(List<String> args) {
  runApp(VerveApp());
}

class VerveApp extends StatelessWidget {
  const VerveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        fontFamily: 'Cairo',
        colorScheme:  ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 169, 154, 212),
          brightness: Brightness.light,
        ),
        brightness: Brightness.light,
      ), // ThemeData
      darkTheme: ThemeData(
        fontFamily: 'Cairo',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 8, 9, 9),
          brightness: Brightness.dark,
        ),
        brightness: Brightness.dark,
      ), // ThemeData
      themeMode: ThemeMode.dark,
    ); // MaterialApp
  }
}