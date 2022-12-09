part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent{}

class ResetPassword extends ResetPasswordEvent {
  final String email;
  final String password;

  ResetPassword({required this.email, required this.password});

}