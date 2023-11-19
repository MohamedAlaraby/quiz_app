part of 'auth_cubit.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

class AuthSuccessState extends AuthState { 
}

class AuthLoadingState extends AuthState {}

class AuthFailureState extends AuthState {
  final String errMessage;

  AuthFailureState({required this.errMessage});
}

