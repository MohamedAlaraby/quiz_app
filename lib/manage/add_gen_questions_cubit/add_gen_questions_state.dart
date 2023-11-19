part of 'add_gen_questions_cubit.dart';

abstract class AddGenQuestionsState {}

final class AddGenQuestionsInitial extends AddGenQuestionsState {}

class AddGenQuestionsSuccessState extends AddGenQuestionsState { 
}

class AddGenQuestionsLoadingState extends AddGenQuestionsState {}

class AddGenQuestionsFailureState extends AddGenQuestionsState {
  final String errMessage;

  AddGenQuestionsFailureState({required this.errMessage});
}

