import 'package:bloc/bloc.dart';
import 'package:e_commerce_bloc/src/data/repository/authrepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;
  LoginBloc(this.repository) : super(LoginInitial()) {
    on<RequestGoogleLogin>((event, emit) async {
      // funtion for google login
      try {
        emit(LogingLoading());

        final user = await repository.signInWithGoogle();
        debugPrint("User : ${user?.displayName}");
        emit(LogingSuccess());
      } catch (e) {
        debugPrint.toString();
        emit(LogingFail(e.toString()));
      }
    });
  }
}
