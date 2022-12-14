import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/modules/campaign/screens/campaign_screen.dart';
import 'package:mechalodon_mobile/modules/campaigns/sceens/campaigns_screen.dart';
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
      initialLocation: "/dashboard",
      routes: [
        GoRoute(
          name: "welcome",
          path: "/",
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
          name: "login",
          path: "/login",
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          name: "sendResetSMS",
          path: "/sendResetSMS",
          builder: (context, state) => const SendResetSMSScreen(),
        ),
        GoRoute(
            name: "resetPassword",
            path: "/resetPassword",
            builder: (context, state) => const ResetPasswordScreen()),
        GoRoute(
            path: "/dashboard",
            builder: (context, state) => const DashboardScreen()),
        GoRoute(
            path: "/campaign",
            builder: ((context, state) => const CampaignsScreen()),
            routes: [
              GoRoute(
                  path: "adSets/:id",
                  builder: ((context, state) {
                    var id = state.params["id"] ?? "";
                    print(id);
                    print(state.fullpath);
                    return CampaignScreen(
                      adSetId: id,
                    );
                  }))
            ])
      ],
    );
  }
}
