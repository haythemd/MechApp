import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/services/injectable.dart';

import '../repository/reset_password_repository.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent,ResetPasswordState>{
  ResetPasswordBloc() : super(ResetPasswordInitial()) {
    on((event, emit) => onReset);
  }

  void onReset(ResetPassword event, Emitter<ResetPasswordState> emit) async {

    emit(ResetPasswordLoading());
    var repo = serviceLocator<ResetPasswordRepository>();
    var response = await repo.ResetPassword(event.userID, event.password);
    if (response == null){
      emit(ResetPasswordError('Something Wrong Happened'));
      return;
    }
    emit(ResetPasswordSuccess());
  }
}