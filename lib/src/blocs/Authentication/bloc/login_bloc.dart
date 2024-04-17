import 'package:bloc/bloc.dart';
import 'package:e_commerce_bloc/src/data/repository/authrepository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;
  LoginBloc(this.repository) : super(LoginInitial()) {
    /* on<RequestGoogleLogin>((event, emit) async {
      // funtion for google login
      try {
        emit(LogingLoading());

        final user = await repository.signinwithEmail(email);
        debugPrint("User : ${user?.displayName}");
        emit(LogingSuccess());
      } catch (e) {
        debugPrint.toString();
        emit(LogingFail(e.toString()));
      }
    });
    */
    on<RequestSignOut>((event, emit) async {
      try {
        await repository.signoutUser().then((value) => emit(LogOutSuccess()));
      } catch (e) {
        emit(LogOutFailed(e.toString()));
      }
    });
    on<RequestEmailLogin>((event, emit) async {
      debugPrint(
          "Email: ${event.email}, Password: ${event.password}, Remember: ${event.isRemember}");
      try {
        await repository
            .signinwithEmail(event.email, event.password)
            .then((value) => emit(LogingSuccess()));
      } catch (e) {
        emit(LogingFail(e.toString()));
      }
    });
  }
}
