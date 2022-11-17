part of 'enter_phone_bloc.dart';

@immutable
abstract class EnterPhoneState {}

class EnterPhoneInitial extends EnterPhoneState {}

class TextMessageSentSuccess extends EnterPhoneState {}

class EnterPhoneError extends EnterPhoneState {
  EnterPhoneError(this.message);
  final String message;
}

class EnterPhoneLoading extends EnterPhoneState {}
