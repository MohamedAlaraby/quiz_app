part of 'get_gen_questions_cubit.dart';

@immutable
sealed class GetGenQuestionsState {}

final class GetGenQuestionsInitial extends GetGenQuestionsState {}

class GetGenQuestionsSuccessState extends GetGenQuestionsState {
  final List<QuizModel> questions;

  GetGenQuestionsSuccessState({required this.questions});
}
class GetGenQuestionsLoadingState extends GetGenQuestionsState {
  
}
class GetGenQuestionsFailureState extends GetGenQuestionsState {
  final String errMessage ;

  GetGenQuestionsFailureState({required this.errMessage});
}