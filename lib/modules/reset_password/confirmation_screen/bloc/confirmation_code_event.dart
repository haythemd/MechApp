part of 'confirmation_code_bloc.dart';

abstract class ConfirmationCodeEvent {

  ConfirmationCodeEvent();
}
class ConfirmCode extends ConfirmationCodeEvent{
  final String code;
  ConfirmCode({required this.code});
}