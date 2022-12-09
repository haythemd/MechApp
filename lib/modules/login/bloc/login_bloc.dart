import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/login/models/user_model.dart';
import 'package:mechalodon_mobile/modules/login/repository/login_repository.dart';
import 'package:mechalodon_mobile/services/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUser>(onLogin);
  }

  void onLogin(LoginUser event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    var repo = serviceLocator<LoginRepository>();
    var user =
        await repo.loginUserWithEmailAndPassword(event.email, event.password);
    if (user == null) {
      emit(LoginError('User was not found'));
      return;
    }
    emit(LoginSuccess(user));
  }
}
