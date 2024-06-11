import 'package:flutter/material.dart';
import 'package:moc_2024_3/api_calls/api_calls_screen.dart';
import 'package:moc_2024_3/home/home.dart';
import 'package:moc_2024_3/layouts/layouts_screen.dart';
import 'package:moc_2024_3/lists_and_scrollables/lists_and_scrollables.dart';
import 'package:moc_2024_3/stateful_exercises/exercise_one.dart';
import 'package:moc_2024_3/stateful_exercises/exercise_three.dart';
import 'package:moc_2024_3/stateful_exercises/exercise_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 30,
            color: Colors.orange,
          ),
          displayMedium: TextStyle(
            fontSize: 25,
            color: Colors.orange,
          ),
        ),
      ),
      home: ApiCallsScreen(),
    );
  }
}
