import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'send_reset_sms_event.dart';
part 'send_reset_sms_state.dart';

class SendResetSMSBloc extends Bloc<SendResetSMSEvent, SendResetSMSState> {
  SendResetSMSBloc() : super(EnterPhoneInitial()) {
    on<PhoneNumberSubmitted>(onSubmitPhoneNumber);
  }

  void onSubmitPhoneNumber(
      PhoneNumberSubmitted event, Emitter<SendResetSMSState> emit) async {
    emit(EnterPhoneLoading());
    print("emit");
    print(state);
    await Future.delayed(const Duration(seconds: 2));
    emit(TextMessageSentSuccess());
  }
}
