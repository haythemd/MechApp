import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/screens/login/models/user_model.dart';
import 'package:mechalodon_mobile/screens/login/repository/login_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUser>(onLogin);
  }

  void onLogin(LoginUser event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    var repo = LoginRepository();
    var user = await repo.loginUserWithEmailAndPassword(event.email, event.password);
    emit(LoginSuccess(user));
  }
}
