part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RequestEmailSignup extends RegisterEvent {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  RequestEmailSignup(
      this.username, this.email, this.password, this.confirmPassword);

  @override
  // TODO: implement props
  List<Object?> get props => [username, email, password, confirmPassword];
}
