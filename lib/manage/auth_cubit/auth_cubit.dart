import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/firebase_service.dart';
import 'package:quiz_app/core/utils/service_locator.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  var db = getIt.get<DBConnect>();

  Future<void> signinUser({
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());
    try {
      await db.signInUser(
        email: email,
        password: password,
      );

      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthFailureState(errMessage: e.toString()));
    }
  }


  Future<void> signupUser({
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());
    try {
      await db.registerUser(
        email: email,
        password: password,
      );

      emit(AuthSuccessState());
    } catch (e) {
      emit(AuthFailureState(errMessage: e.toString()));
    }
  }

}
