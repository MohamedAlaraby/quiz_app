import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/core/bloc_observer.dart';
import 'package:quiz_app/core/service_locator.dart';
import 'package:quiz_app/manage/add_gen_questions_cubit/add_gen_questions_cubit.dart';
import 'package:quiz_app/manage/get_gen_questions_cubit/get_gen_questions_cubit.dart';

import 'package:quiz_app/screens/home_screen.dart';

void main() {
  setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  runApp(
    const QuizApp(),
  );
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetGenQuestionsCubit(),
        ),
        BlocProvider(
          create: (context) => AddGenQuestionsCubit(),
        ),
      ],
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
