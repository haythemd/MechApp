import 'package:get_it/get_it.dart';
import 'package:mechalodon_mobile/generated/l10n.dart';
import 'package:mechalodon_mobile/modules/ads/bloc/bloc/ads_bloc.dart';
import 'package:mechalodon_mobile/modules/ads/repo/ads_repository.dart';
import 'package:mechalodon_mobile/modules/adSets/bloc/ad_set_bloc.dart';
import 'package:mechalodon_mobile/modules/adSets/repo/ad_set_repository.dart';
import 'package:mechalodon_mobile/modules/campaigns/repository/campaigns_repository.dart';
import 'package:mechalodon_mobile/modules/reset_password/confirmation_screen/repository/confirmation_code_repository.dart';
import 'package:mechalodon_mobile/modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:mechalodon_mobile/modules/campaigns/bloc/bloc/campaigns_bloc.dart';
import 'package:mechalodon_mobile/modules/login/bloc/login_bloc.dart';
import 'package:mechalodon_mobile/modules/login/repository/login_repository.dart';
import 'package:mechalodon_mobile/modules/profile/bloc/profile_bloc.dart';
import 'package:mechalodon_mobile/modules/profile/repository/profile_repository.dart';
import 'package:mechalodon_mobile/modules/reset_password/enter_new_password/bloc/reset_password_bloc.dart';
import 'package:mechalodon_mobile/modules/reset_password/enter_new_password/repository/reset_password_repository.dart';
import 'package:mechalodon_mobile/modules/reset_password/send_reset_sms/bloc/bloc/send_reset_sms_bloc.dart';
import 'package:mechalodon_mobile/navigation/page_links.dart';
import 'package:mechalodon_mobile/services/auth_service.dart';
import 'package:mechalodon_mobile/services/graphql_service.dart';
import 'package:mechalodon_mobile/modules/reset_password/confirmation_screen/bloc/confirmation_code_bloc.dart';

import 'package:mechalodon_mobile/modules/ad/bloc/ad_bloc.dart';

import 'package:mechalodon_mobile/modules/ad/repo/ad_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> initServiceLocator() async {
  /// Translations
  serviceLocator.registerLazySingleton<S>(() => S());

  /// Services
  serviceLocator.registerLazySingleton<PageLink>(() => PageLink());
  serviceLocator.registerLazySingleton<AuthService>(() => AuthService());
  serviceLocator.registerLazySingleton<GraphQLService>(() => GraphQLService());

  /// Blocs (please keep these Alphabetical)
  serviceLocator.registerFactory<AdsBloc>(() => AdsBloc());
  serviceLocator.registerFactory<AdBloc>(() => AdBloc());
  serviceLocator.registerFactory<AdSetBloc>(() => AdSetBloc());
  serviceLocator.registerFactory<CampaignsBloc>(() => CampaignsBloc());
  serviceLocator.registerFactory<ConfirmationCodeBloc>(() => ConfirmationCodeBloc());
  serviceLocator.registerFactory<DashboardBloc>(() => DashboardBloc());
  serviceLocator.registerFactory<LoginBloc>(() => LoginBloc());
  serviceLocator.registerFactory<ProfileBloc>(() => ProfileBloc());
  serviceLocator.registerFactory<ResetPasswordBloc>(() => ResetPasswordBloc());
  serviceLocator.registerFactory<SendResetSMSBloc>(() => SendResetSMSBloc());

  /// Repositories (please keep these Alphabetical)
  serviceLocator.registerFactory<AdsRepository>(() => AdsRepository());
  serviceLocator.registerFactory<AdRepository>(() => AdRepository());
  serviceLocator.registerFactory<AdSetRepository>(() => AdSetRepository());
  serviceLocator
      .registerFactory<CampaignsRepository>(() => CampaignsRepository());
  serviceLocator.registerFactory<ConfirmationCodeRepository>(() => ConfirmationCodeRepository());
  serviceLocator.registerFactory<LoginRepository>(() => LoginRepository());
  serviceLocator.registerFactory<ProfileRepository>(() => ProfileRepository());
  serviceLocator.registerFactory<ResetPasswordRepository>(
      () => ResetPasswordRepository());
}
