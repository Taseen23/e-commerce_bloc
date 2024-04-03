part of 'remember_switch_cubit.dart';

@immutable
sealed class RememberSwitchState {}

final class RememberSwitchInitial extends RememberSwitchState {}

final class SwithChanged extends RememberSwitchState {
  final bool value;

  SwithChanged(this.value);
}
