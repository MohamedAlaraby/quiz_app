import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiz_app/core/firebase_service.dart';
import 'package:quiz_app/core/service_locator.dart';

import 'package:quiz_app/models/quiz_model.dart';

part 'get_gen_questions_state.dart';

class GetGenQuestionsCubit extends Cubit<GetGenQuestionsState> {
  GetGenQuestionsCubit() : super(GetGenQuestionsInitial());
  var db = getIt.get<DBConnect>();

  Future<void> getGenQuestions() async {
    emit(GetGenQuestionsLoadingState());
    try {
      var questions = await db.fetchGenQuestion();
      emit(GetGenQuestionsSuccessState(questions: questions));
    } catch (e) {
      emit(GetGenQuestionsFailureState(errMessage: e.toString()));
    }
  }


  
}
