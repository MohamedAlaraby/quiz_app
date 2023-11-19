import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/firebase_service.dart';
import 'package:quiz_app/models/quiz_model.dart';
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

  var db = DBConnect();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<QuizModel>>(
        future: db.fetchGenQuestion(),

        
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
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
                    question: snapshot.data![questionIndex].title,
                    totalQuestion: snapshot.data!.length,
                  ),
                  const MyDivider(),
                  const SizedBox(height: 20),
                  for (var optionIndex = 0;
                      optionIndex <
                          snapshot.data![questionIndex].options.length;
                      optionIndex++)
                    OptionsWidget(
                      onPressed: () {
                        //When the sudent press on certain item.
                        checkOnAnswerAndUpdate(
                          snapshot.data![questionIndex].options.values
                                  .toList()[optionIndex] ==
                              true,
                        );
                      },
                      option: snapshot.data![questionIndex].options.keys
                          .toList()[optionIndex],
                      color:
                          getColorOfOptionWidget(optionIndex, snapshot.data!),
                    ),
                ],
              ),
              floatingActionButton: NextQuestionWidget(
                onPressed: () {
                  nextQuestionPressed(context, snapshot.data!);
                },
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error is ${snapshot.error.toString()} "),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
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

  void updateQuizModel(QuizModel quizModel) async {
    await db.updateGenQuestion(quizModel);
  }
}
