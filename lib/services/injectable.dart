import 'package:get_it/get_it.dart';
import 'package:mechalodon_mobile/generated/l10n.dart';
import 'package:mechalodon_mobile/screens/campaign/bloc/bloc/campaign_bloc.dart';
import 'package:mechalodon_mobile/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:mechalodon_mobile/screens/login/bloc/login_bloc.dart';
import 'package:mechalodon_mobile/screens/reset_password/enter_new_password/bloc/reset_password_bloc.dart';
import 'package:mechalodon_mobile/screens/reset_password/enter_new_password/repository/reset_password_repository.dart';
import 'package:mechalodon_mobile/screens/reset_password/send_reset_sms/bloc/bloc/send_reset_sms_bloc.dart';
import 'package:mechalodon_mobile/services/auth_service.dart';
import 'package:mechalodon_mobile/services/graphql_service.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  serviceLocator.registerFactory<LoginBloc>(() => LoginBloc());
  serviceLocator.registerLazySingleton<S>(() => S());
  serviceLocator.registerLazySingleton<AuthService>(() => AuthService());
  serviceLocator.registerFactory<ResetPasswordBloc>(() => ResetPasswordBloc());
  serviceLocator.registerFactory<SendResetSMSBloc>(() => SendResetSMSBloc());
  serviceLocator.registerFactory<ResetPasswordRepository>(
      () => ResetPasswordRepository());
  serviceLocator.registerLazySingleton<GraphQLService>(() => GraphQLService());
  serviceLocator.registerFactory<DashboardBloc>(() => DashboardBloc());
  serviceLocator.registerFactory<CampaignBloc>(() => CampaignBloc());
}
