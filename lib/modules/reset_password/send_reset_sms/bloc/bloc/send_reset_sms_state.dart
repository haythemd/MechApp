part of 'send_reset_sms_bloc.dart';

@immutable
abstract class SendResetSMSState {}

class EnterPhoneInitial extends SendResetSMSState {}

class TextMessageSentSuccess extends SendResetSMSState {}

class EnterPhoneError extends SendResetSMSState {
  EnterPhoneError(this.message);
  final String message;
}

class EnterPhoneLoading extends SendResetSMSState {}
