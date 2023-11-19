part of 'edit_question_cubit.dart';

abstract class EditQuestionState {}

final class EditQuestionInitial extends EditQuestionState {}

class EditQuestionSuccessState extends EditQuestionState { 
}

class EditQuestionLoadingState extends EditQuestionState {}

class EditQuestionFailureState extends EditQuestionState {
  final String errMessage;

  EditQuestionFailureState({required this.errMessage});
}

