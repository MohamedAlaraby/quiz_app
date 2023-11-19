import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/firebase_service.dart';
import 'package:quiz_app/core/service_locator.dart';
import 'package:quiz_app/models/quiz_model.dart';
part 'add_gen_questions_state.dart';

class AddGenQuestionsCubit extends Cubit<AddGenQuestionsState> {
  AddGenQuestionsCubit() : super(AddGenQuestionsInitial());
  var db = getIt.get<DBConnect>();

  Future<void> addGenQuestions({
    required QuizModel quizModel,
  }) async {
    emit(AddGenQuestionsLoadingState());
    try {
      await db.addGenQuestion(quizModel);
      emit(AddGenQuestionsSuccessState());
    } catch (e) {
      emit(AddGenQuestionsFailureState(errMessage: e.toString()));
    }
  }
}
