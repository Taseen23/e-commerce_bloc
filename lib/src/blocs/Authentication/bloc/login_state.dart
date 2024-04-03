part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LogingLoading extends LoginState {}

class LogingSuccess extends LoginState {}

class LogingFail extends LoginState {
  final String massage;

  LogingFail(this.massage);
}
