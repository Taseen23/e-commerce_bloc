part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class RequestGoogleLogin extends LoginEvent {}

class RequestSignOut extends LoginEvent {}

class RequestEmailLogin extends LoginEvent {
  final String email;
  final String password;
  final bool isRemember;
  RequestEmailLogin({
    required this.email,
    required this.password,
    required this.isRemember,
  });
}
