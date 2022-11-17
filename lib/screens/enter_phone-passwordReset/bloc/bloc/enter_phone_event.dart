part of 'enter_phone_bloc.dart';

@immutable
abstract class EnterPhoneEvent {}

class PhoneNumberSubmitted extends EnterPhoneEvent {
  PhoneNumberSubmitted(this.number);
  String number;
}
