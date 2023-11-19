import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/home_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kBackground,
      ),
      home: const HomeScreen(),
    );
  }
}
