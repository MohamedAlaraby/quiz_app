import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/manage/edit_question_cubit/edit_question_cubit.dart';
import 'package:quiz_app/manage/get_gen_questions_cubit/get_gen_questions_cubit.dart';
import 'package:quiz_app/screens/add_question_screen.dart';
import 'package:quiz_app/screens/edit_question_screen.dart';
import 'package:quiz_app/widgets/add_new_question_button.dart';
import 'package:quiz_app/widgets/custom_appbar.dart';
import 'package:quiz_app/widgets/my_divider.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/get_ques_options_widget.dart';
import 'package:quiz_app/widgets/question_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<GetGenQuestionsCubit>(context).getGenQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetGenQuestionsCubit, GetGenQuestionsState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<GetGenQuestionsCubit>(context);
          if (state is GetGenQuestionsSuccessState ||
              state is UpdateUiStateSuccessState) {
            return Column(
              children: [
                CustomAppBar(score: cubit.score),
                QuestionWidget(
                  indexAction: cubit.questionIndex,
                  question: cubit.questions[cubit.questionIndex].title,
                  totalQuestion: cubit.questions.length,
                ),
                const MyDivider(),
                const SizedBox(height: 20),
                for (var optionIndex = 0;
                    optionIndex <
                        cubit.questions[cubit.questionIndex].options.length;
                    optionIndex++)
                  OptionsWidget(
                    onPressed: () {
                      //When the sudent press on certain item.
                      cubit.checkOnAnswerAndUpdate(
                        cubit.questions[cubit.questionIndex].options.values
                            .toList()[optionIndex],
                      );
                    },
                    option: cubit.questions[cubit.questionIndex].options.keys
                        .toList()[optionIndex],
                    color: cubit.getColorOfOptionWidget(
                      optionIndex,
                      cubit.questions,
                    ),
                  ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: "Next Question",
                  onPressed: () {
                    cubit.nextQuestionPressed(context, cubit.questions);
                  },
                ),
                CustomButton(
                  text: "Edit this question",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider<EditQuestionCubit>(
                          create: (context) => EditQuestionCubit(),
                          child: EditQuestionScreen(
                            question: cubit.questions[cubit.questionIndex],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          } else if (state is GetGenQuestionsFailureState) {
            return Center(
              child: Text(
                "Error is ${state.errMessage}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: AddNewQuesButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddQuestionScreen(),
            ),
          );
        },
      ),
    );
  }
}
