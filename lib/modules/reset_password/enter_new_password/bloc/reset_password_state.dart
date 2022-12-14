part of 'reset_password_bloc.dart';

abstract class ResetPasswordState{}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordError extends ResetPasswordState {
  final String message;
  ResetPasswordError(this.message);
}

class ResetPasswordSuccess extends ResetPasswordState {}