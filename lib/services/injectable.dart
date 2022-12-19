import 'package:get_it/get_it.dart';
import 'package:mechalodon_mobile/generated/l10n.dart';
import 'package:mechalodon_mobile/modules/adSet/bloc/bloc/ad_set_bloc.dart';
import 'package:mechalodon_mobile/modules/adSet/repo/ad_set_repository.dart';
import 'package:mechalodon_mobile/modules/campaign/bloc/campaign_bloc.dart';
import 'package:mechalodon_mobile/modules/campaign/repo/campaign_repository.dart';
import 'package:mechalodon_mobile/modules/campaigns/repository/campaigns_repository.dart';
import 'package:mechalodon_mobile/modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:mechalodon_mobile/modules/campaigns/bloc/bloc/campaigns_bloc.dart';
import 'package:mechalodon_mobile/modules/login/bloc/login_bloc.dart';
import 'package:mechalodon_mobile/modules/login/repository/login_repository.dart';
import 'package:mechalodon_mobile/modules/reset_password/enter_new_password/bloc/reset_password_bloc.dart';
import 'package:mechalodon_mobile/modules/reset_password/enter_new_password/repository/reset_password_repository.dart';
import 'package:mechalodon_mobile/modules/reset_password/send_reset_sms/bloc/bloc/send_reset_sms_bloc.dart';
import 'package:mechalodon_mobile/services/auth_service.dart';
import 'package:mechalodon_mobile/services/graphql_service.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  
  /// Translations
  serviceLocator.registerLazySingleton<S>(() => S());

  /// Services
  serviceLocator.registerLazySingleton<AuthService>(() => AuthService());
  serviceLocator.registerLazySingleton<GraphQLService>(() => GraphQLService());

  /// Blocs (please keep these Alphabetical)
  serviceLocator.registerFactory<AdSetBloc>(() => AdSetBloc());
  serviceLocator.registerFactory<CampaignBloc>(() => CampaignBloc());
  serviceLocator.registerFactory<CampaignsBloc>(() => CampaignsBloc());
  serviceLocator.registerFactory<DashboardBloc>(() => DashboardBloc());
  serviceLocator.registerFactory<LoginBloc>(() => LoginBloc());
  serviceLocator.registerFactory<ResetPasswordBloc>(() => ResetPasswordBloc());
  serviceLocator.registerFactory<SendResetSMSBloc>(() => SendResetSMSBloc());

  /// Repositories (please keep these Alphabetical)
  serviceLocator.registerFactory<AdSetRepository>(() => AdSetRepository());
  serviceLocator.registerFactory<CampaignRepository>(() => CampaignRepository());
  serviceLocator.registerFactory<CampaignsRepository>(() => CampaignsRepository());
  serviceLocator.registerFactory<LoginRepository>(() => LoginRepository());
  serviceLocator.registerFactory<ResetPasswordRepository>(() => ResetPasswordRepository());
}
