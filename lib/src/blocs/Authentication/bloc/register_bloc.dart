import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce_bloc/src/data/repository/authrepository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthRepository repository;
  RegisterBloc(
    this.repository,
  ) : super(RegisterInitial()) {
    on<RequestEmailSignup>((event, emit) async {
      emit(RegisterLoading());
      try {
        // ignore: unused_local_variable
        final user = await repository.registerwithemail(
            event.email, event.password, event.username);
      } catch (e) {
        emit(RegisterFailed(massage: e.toString()));
      }

      emit(RegisterSuccess());
    });
  }
}
