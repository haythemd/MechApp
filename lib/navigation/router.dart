import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/modules/adSets/screens/ad_set_screen.dart';
import 'package:mechalodon_mobile/modules/ads/screens/ads_screen.dart';
import 'package:mechalodon_mobile/modules/campaigns/sceens/campaigns_screen.dart';
import 'package:mechalodon_mobile/modules/reset_password/confirmation_screen/screens/confirmation_code_screen.dart';
import 'package:mechalodon_mobile/modules/dashboard/screens/dashboard_screen.dart';
import 'package:mechalodon_mobile/modules/login/screens/login_screen.dart';
import 'package:mechalodon_mobile/modules/profile/screens/profile_screen.dart';
import 'package:mechalodon_mobile/modules/reset_password/enter_new_password/screens/reset_password_screen.dart';
import 'package:mechalodon_mobile/modules/reset_password/send_reset_sms/screens/send_reset_sms_screen.dart';
import 'package:mechalodon_mobile/modules/welcome/welcome_screen.dart';
import 'package:mechalodon_mobile/navigation/app_link.dart';
import 'package:mechalodon_mobile/navigation/mech_nav_bar.dart';

import '../modules/ad/screens/ad_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

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
        ShellRoute(
            navigatorKey: _rootNavigatorKey,
            builder: (context, state, child) {
              return Material(child: MechNavBar(child: child));
            },
            routes: [
              GoRoute(
                name: MechPage.dashboard.name(),
                path: MechPage.dashboard.path(),
                builder: (context, state) => const DashboardScreen(),
              ),
              GoRoute(
                name: MechPage.profile.name(),
                path: MechPage.profile.path(),
                builder: (context, state) => const ProfileScreen(),
              ),
              GoRoute(
                path: MechPage.campaigns.path(),
                builder: ((context, state) => const CampaignsScreen()),
              ),
              GoRoute(
                  name: MechPage.campaigns.name(),
                  path: "${MechPage.campaigns.path()}/:campaignId",
                  builder: ((context, state) {
                    var id = state.params["campaignId"] ?? "";
                      return AdSetScreen(
                        adSetId: id,
                        parentPath: state.extra as String,
                      );                    
                  }),
                  routes: [
                    GoRoute(
                      name: MechPage.adSets.name(),
                      path: "${MechPage.adSets.name()}/:adSetId",
                      builder: (context, state) {
                        var id = state.params["adSetId"] ?? "";
                        var parentPath = state.extra as String;
                        return AdsScreen(
                          adsId: id,
                          parentPath: parentPath,
                        );
                      },
                       routes: [
                       GoRoute(
                           path: "${MechPage.ads.name()}/:adsId",
                           builder: ((context, state) {
                             var id = state.params["adsId"] ?? "";
                             return AdScreen(
                               adId: id,
                               parentPath: state.extra as String,
                             );
                           }))
                       ]
                    ),
                  ]),
            ]),
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
            name: MechPage.confirmCode.name(),
            path: MechPage.confirmCode.path(),
            builder: (context, state) =>
                const ResetPasswordCodeConfirmationScreen()),
      ],
    );
  }
}
