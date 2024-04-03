part of 'register_bloc.dart';

@immutable
sealed class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RegisterInitial extends RegisterState {
  final TextEditingController usernmaeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emiailController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  @override
  List<Object?> get props => [
        usernmaeController,
        passwordController,
        emiailController,
        confirmPassword
      ];
}

class RegisterSuccess extends RegisterState {}

class RegisterFailed extends RegisterState {
  final String massage;

  RegisterFailed({required this.massage});

  @override
  List<Object?> get props => [massage];
}

class RegisterLoading extends RegisterState {}
