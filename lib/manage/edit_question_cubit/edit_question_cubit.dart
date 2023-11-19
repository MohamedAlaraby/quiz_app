import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/firebase_service.dart';
import 'package:quiz_app/core/utils/service_locator.dart';
import 'package:quiz_app/models/quiz_model.dart';
part 'edit_question_state.dart';

class EditQuestionCubit extends Cubit<EditQuestionState> {
  EditQuestionCubit() : super(EditQuestionInitial());
  var db = getIt.get<DBConnect>();

  Future<void> editQuestion({
    required QuizModel quizModel,
  }) async {
    emit(EditQuestionLoadingState());
    try {
     
      await db.updateGenQuestion(quizModel);

      emit(EditQuestionSuccessState());
    } catch (e) {
      emit(EditQuestionFailureState(errMessage: e.toString()));
    }
  }
}
