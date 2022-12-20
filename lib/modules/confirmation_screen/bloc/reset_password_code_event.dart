part of 'reset_password_code_bloc.dart';

abstract class ConfirmationCodeEvent {
  final String code;
  ConfirmationCodeEvent({required this.code});
}