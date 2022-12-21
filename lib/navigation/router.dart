import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/modules/adSets/screens/ad_set_screen.dart';
import 'package:mechalodon_mobile/modules/ads/screens/ads_screen.dart';
import 'package:mechalodon_mobile/modules/campaigns/sceens/campaigns_screen.dart';
import 'package:mechalodon_mobile/modules/reset_password/confirmation_screen/screens/confirmation_code_screen.dart';
import 'package:mechalodon_mobile/modules/dashboard/screens/dashboard_screen.dart';
import 'package:mechalodon_mobile/modules/login/screens/login_screen.dart';
import 'package:mechalodon_mobile/modules/reset_password/enter_new_password/screens/reset_password_screen.dart';
import 'package:mechalodon_mobile/modules/reset_password/send_reset_sms/screens/send_reset_sms_screen.dart';
import 'package:mechalodon_mobile/modules/welcome/welcome_screen.dart';
import 'package:mechalodon_mobile/navigation/app_link.dart';

class MechRouter {
  MechRouter() {
    _goRouter = _initializeRouter();
  }

  late GoRouter _goRouter;
  RouterDelegate<Object> get delegate {
    return _goRouter.routerDelegate;
  }

  RouteInformationParser<Object> get infoParser {
    return _goRouter.routeInformationParser;
  }

  RouteInformationProvider get infoProvider {
    return _goRouter.routeInformationProvider;
  }

  GoRouter _initializeRouter() {
    return GoRouter(
      initialLocation: MechPage.dashboard.path(),
      routes: [
        GoRoute(
          name: MechPage.welcome.name(),
          path: MechPage.welcome.path(),
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
          name: MechPage.login.name(),
          path: MechPage.login.path(),
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          name: MechPage.sms.name(),
          path: MechPage.sms.path(),
          builder: (context, state) => const SendResetSMSScreen(),
        ),
        GoRoute(
            name: MechPage.resetPassword.name(),
            path: MechPage.resetPassword.path(),
            builder: (context, state) => const ResetPasswordScreen()),
        GoRoute(
            name: MechPage.dashboard.name(),
            path: MechPage.dashboard.path(),
            builder: (context, state) => const DashboardScreen()),
        GoRoute(
            name: MechPage.confirmCode.name(),
            path: MechPage.confirmCode.path(),
            builder: (context, state)=> const ResetPasswordCodeConfirmationScreen()),
        GoRoute(
            name: MechPage.campaigns.name(),
            path: MechPage.campaigns.path(),
            builder: ((context, state) => const CampaignsScreen()),
            routes: [
              GoRoute(
                  path: "${MechPage.adSets.name()}/:campaignId",
                  builder: ((context, state) {
                    var id = state.params["campaignId"] ?? "";
                    return AdSetScreen(
                      adSetId: id,
                    );
                  }),
                  routes: [
                    GoRoute(
                        path: "${MechPage.ads.name()}/:adSetId",
                        builder: ((context, state) {
                          var id = state.params["adSetId"] ?? "";
                          return AdsScreen(
                            adsId: id,
                          );
                        }))
                  ])
            ])
      ],
    );
  }
}
