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
import 'package:mechalodon_mobile/navigation/page_links.dart';
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
      initialLocation: PageLink.dashboard,
      routes: [
        ShellRoute(
            navigatorKey: _rootNavigatorKey,
            builder: (context, state, child) {
              return Material(child: MechNavBar(child: child));
            },
            routes: [
              GoRoute(
                path: PageLink.dashboard,
                builder: (context, state) => const DashboardScreen(),
              ),
              GoRoute(
                path: PageLink.profile,
                builder: (context, state) => const ProfileScreen(),
              ),
              GoRoute(
                path: PageLink.campaigns,
                builder: ((context, state) => const CampaignsScreen()),
              ),
              GoRoute(
                  path: "${PageLink.campaigns}/:campaignId",
                  builder: ((context, state) {
                      var id = state.params['campaignId'];
                      return AdSetScreen(
                        adSetId: id ?? '',
                      );                    
                  }),
                  routes: [
                    GoRoute(
                      path: "${PageLink.adSets}/:adSetId",
                      builder: (context, state) {
                        var id = state.params['adSetId'];
                        return AdsScreen(
                          adsId: id ?? '',
                        );
                      },
                       routes: [
                       GoRoute(
                           path: "${PageLink.ads}/:adsId",
                           builder: ((context, state) {
                              var id = state.params['adsId'];
                             return AdScreen(adId: id,);
                           }))
                       ]
                    ),
                  ]),
            ]),
        GoRoute(
          path: PageLink.welcome,
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
          path: PageLink.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: PageLink.sms,
          builder: (context, state) => const SendResetSMSScreen(),
        ),
        GoRoute(
            path: PageLink.resetPassword,
            builder: (context, state) => const ResetPasswordScreen()),
        GoRoute(
            path: PageLink.confirmCode,
            builder: (context, state) =>
                const ResetPasswordCodeConfirmationScreen()),
      ],
    );
  }
}

