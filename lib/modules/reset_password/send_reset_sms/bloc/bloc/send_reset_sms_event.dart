part of 'send_reset_sms_bloc.dart';

@immutable
abstract class SendResetSMSEvent {}

class PhoneNumberSubmitted extends SendResetSMSEvent {
  PhoneNumberSubmitted(this.number);
  String number;
}
