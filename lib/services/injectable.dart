import 'package:get_it/get_it.dart';
import 'package:mechalodon_mobile/generated/l10n.dart';
import 'package:mechalodon_mobile/screens/login/bloc/login_bloc.dart';
import 'package:mechalodon_mobile/services/auth_service.dart';

import 'package:mechalodon_mobile/screens/reset_password/bloc/reset_password_bloc.dart';
import 'package:mechalodon_mobile/screens/reset_password/repository/reset_password_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  serviceLocator.registerFactory<LoginBloc>(() => LoginBloc());
  serviceLocator.registerLazySingleton<S>(() => S());
  serviceLocator.registerLazySingleton<AuthService>(() => AuthService());
  serviceLocator.registerFactory(() => ResetPasswordBloc());
  serviceLocator.registerLazySingleton(() => ResetPasswordRepository());
}
