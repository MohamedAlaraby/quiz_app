import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/firebase_service.dart';
import 'package:quiz_app/core/utils/service_locator.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/quiz_model.dart';
import 'package:quiz_app/widgets/score_dialog.dart';
part 'get_gen_questions_state.dart';

class GetGenQuestionsCubit extends Cubit<GetGenQuestionsState> {
  GetGenQuestionsCubit() : super(GetGenQuestionsInitial());
  var db = getIt.get<DBConnect>();

  int questionIndex = 0;
  bool isAnOptionPressed = false;
  int score = 0;
  bool isAnOptionAlreadySelected = false;
  List<QuizModel> questions = [];
  Future<void> getGenQuestions() async {
    emit(GetGenQuestionsLoadingState());
    try {
      questions = await db.fetchGenQuestion();

      emit(GetGenQuestionsSuccessState(questions: questions));
    } catch (e) {
      emit(GetGenQuestionsFailureState(errMessage: e.toString()));
    }
  }

  void nextQuestionPressed(BuildContext context, list) {
    if (questionIndex < list.length - 1) {
      if (isAnOptionPressed == true) {
        questionIndex++;
        isAnOptionPressed = false;
        isAnOptionAlreadySelected = false;
        emit(UpdateUiStateSuccessState());
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
            startOver(context);
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

      isAnOptionPressed = true;
      isAnOptionAlreadySelected = true;
      emit(UpdateUiStateSuccessState());
    } else {
      return;
    }
  }

  void startOver(context) {
    questionIndex = 0;
    isAnOptionPressed = false;
    score = 0;
    isAnOptionAlreadySelected = false;
    emit(UpdateUiStateSuccessState());

    Navigator.pop(context);
  }
}
