part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent{}

class ResetPassword extends ResetPasswordEvent {
  final String userID;
  final String password;

  ResetPassword({required this.userID, required this.password});

}