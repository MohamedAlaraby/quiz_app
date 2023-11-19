import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/constants.dart';

import 'package:quiz_app/manage/get_gen_questions_cubit/get_gen_questions_cubit.dart';

import 'package:quiz_app/widgets/my_divider.dart';
import 'package:quiz_app/widgets/next_question_button.dart';
import 'package:quiz_app/widgets/options_widget.dart';
import 'package:quiz_app/widgets/question_widget.dart';
import 'package:quiz_app/widgets/score_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int questionIndex = 0;
  bool isAnOptionPressed = false;
  int score = 0;
  bool isAnOptionAlreadySelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGenQuestionsCubit, GetGenQuestionsState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<GetGenQuestionsCubit>(context);
        if (state is GetGenQuestionsSuccessState) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.all(
                    18,
                  ),
                  child: Text(
                    "Score $score",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                "Quiz App",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            body: Column(
              children: [
                QuestionWidget(
                  indexAction: questionIndex,
                  question: state.questions[questionIndex].title,
                  totalQuestion: state.questions.length,
                ),
                const MyDivider(),
                const SizedBox(height: 20),
                for (var optionIndex = 0;
                    optionIndex < state.questions[questionIndex].options.length;
                    optionIndex++)
                  OptionsWidget(
                    onPressed: () {
                      //When the sudent press on certain item.
                      checkOnAnswerAndUpdate(
                        state.questions[questionIndex].options.values
                                .toList()[optionIndex] ==
                            true,
                      );
                    },
                    option: state.questions[questionIndex].options.keys
                        .toList()[optionIndex],
                    color: getColorOfOptionWidget(optionIndex, state.questions),
                  ),
              ],
            ),
            floatingActionButton: NextQuestionWidget(
              onPressed: () {
                nextQuestionPressed(context, state.questions);
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        
        } else if (state is GetGenQuestionsFailureState) {
            return Center(
              child: Text("Error is ${state.errMessage}"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      },
    );
  }

  void nextQuestionPressed(BuildContext context, list) {
    if (questionIndex < list.length - 1) {
      if (isAnOptionPressed == true) {
        setState(() {
          questionIndex++;
          isAnOptionPressed = false;
          isAnOptionAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "You have to choose miminum one answer to continue",
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => ScoreDialog(
          finalScore: score,
          questionsLength: list.length,
          onPressed: () {
            startOver();
          },
        ),
      );
    }
  }

  Color getColorOfOptionWidget(int optionIndex, list) {
    return isAnOptionPressed
        ? list[questionIndex].options.values.toList()[optionIndex] == true
            ? kCorrect
            : kIncorrect
        : kNeutral;
  }

  void checkOnAnswerAndUpdate(bool value) {
    if (isAnOptionAlreadySelected == false) {
      //The first time the student press on the option.
      if (value == true) {
        //The student answer is correct.
        score++;
      }
      setState(() {
        isAnOptionPressed = true;
        isAnOptionAlreadySelected = true;
      });
    } else {
      return;
    }
  }

  void startOver() {
    setState(() {
      questionIndex = 0;
      isAnOptionPressed = false;
      score = 0;
      isAnOptionAlreadySelected = false;
    });
    Navigator.pop(context);
  }



  }
