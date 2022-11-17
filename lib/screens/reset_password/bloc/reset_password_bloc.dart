import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/services/injectable.dart';

import '../repository/reset_password_repository.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent,ResetPasswordState>{
  ResetPasswordBloc() : super(ResetPasswordInitial()) {
    on<ResetPassword>(onReset);
  }

  void onReset(ResetPassword event, Emitter<ResetPasswordState> emit) async {

    emit(ResetPasswordLoading());
    if (event.password =="" || event.password == null){

      emit(ResetPasswordError('Something Wrong Happened'));
      return;
    }
    var repo = serviceLocator<ResetPasswordRepository>();
    var response = await repo.resetPassword(event.email, event.password);
    emit(ResetPasswordSuccess());
  }
}