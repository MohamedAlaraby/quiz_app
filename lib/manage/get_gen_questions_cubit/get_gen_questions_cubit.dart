import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiz_app/firebase_service.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/models/quiz_model.dart';

part 'get_gen_questions_state.dart';

class GetGenQuestionsCubit extends Cubit<GetGenQuestionsState> {
  GetGenQuestionsCubit() : super(GetGenQuestionsInitial());
  //  var db = DBConnect();
  // db.fetchGenQuestion();

}
