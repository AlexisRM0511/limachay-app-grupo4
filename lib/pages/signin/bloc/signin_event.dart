part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class SigninButtonPressed extends SigninEvent {
  final String email;
  final String password;

  SigninButtonPressed({required this.email, required this.password});
}