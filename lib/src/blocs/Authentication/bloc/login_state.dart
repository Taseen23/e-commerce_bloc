part of 'login_bloc.dart';

@immutable
sealed class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class LoginInitial extends LoginState {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emiailController = TextEditingController();
  @override
  List<Object?> get props => [passwordController, emiailController];
}

class LogingLoading extends LoginState {}

class LogingSuccess extends LoginState {}

class LogingFail extends LoginState {
  final String massage;

  LogingFail(this.massage);
}

class LogOutFailed extends LoginState {
  final String massage;

  LogOutFailed(this.massage);
}

class LogOutSuccess extends LoginState {}
