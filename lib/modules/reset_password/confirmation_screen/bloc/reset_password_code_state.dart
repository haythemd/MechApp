part of 'reset_password_code_bloc.dart';

abstract class ConfirmationCodeState{}

class ConfirmationCodeInitial extends ConfirmationCodeState {}

class ConfirmationCodeLoading extends ConfirmationCodeState {}

class ConfirmationCodeError extends ConfirmationCodeState {
  final String message;
  ConfirmationCodeError(this.message);
}

class ConfirmationCodeSuccess extends ConfirmationCodeState{}