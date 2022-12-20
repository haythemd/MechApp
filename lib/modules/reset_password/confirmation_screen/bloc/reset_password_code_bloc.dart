import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/services/injectable.dart';

import 'package:mechalodon_mobile/modules/reset_password/confirmation_screen/repository/reset_password_code_repository.dart';

part 'reset_password_code_event.dart';
part 'reset_password_code_state.dart';

class ConfirmationCodeBloc extends Bloc<ConfirmCode, ConfirmationCodeState> {
  ConfirmationCodeBloc() : super(ConfirmationCodeInitial()) {
    on<ConfirmCode>(onCodeConfirmation);
  }
  void onCodeConfirmation(
      ConfirmCode event, Emitter<ConfirmationCodeState> emit) async {
    emit(ConfirmationCodeLoading());
    var repo = serviceLocator<ConfirmationCodeRepository>();

    var result = await repo.confirmCode(event.code);

    if (result == true) {
      emit(ConfirmationCodeSuccess());
    } else {
      emit(ConfirmationCodeError('Something wrong happened!'));
    }
    return;
  }
}
