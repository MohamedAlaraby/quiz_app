import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/core/service_locator.dart';
import 'package:quiz_app/manage/get_gen_questions_cubit/get_gen_questions_cubit.dart';
import 'package:quiz_app/screens/home_screen.dart';

void main() {
  setupServiceLocator();
  runApp(
    const QuizApp(),
  );
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetGenQuestionsCubit>(
      create: (context) => GetGenQuestionsCubit()..getGenQuestions(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz App',
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: kBackground,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
