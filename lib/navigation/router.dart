import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/navigation/app_link.dart';
import 'package:mechalodon_mobile/screens/dashboard/screens/dashboard_screen.dart';
import 'package:mechalodon_mobile/screens/login/screens/login_screen.dart';
import 'package:mechalodon_mobile/screens/reset_password/enter_new_password/screens/reset_password_screen.dart';
import 'package:mechalodon_mobile/screens/reset_password/send_reset_sms/screens/send_reset_sms_screen.dart';
import 'package:mechalodon_mobile/screens/welcome/welcome_screen.dart';

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
          path: MechPage.welcome.path(),
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
          path: MechPage.login.path(),
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: MechPage.enterPhone.path(),
          builder: (context, state) => const SendResetSMSScreen(),
        ),
        GoRoute(
            path: MechPage.resetPassword.path(),
            builder: (context, state) => const ResetPasswordScreen()),
        GoRoute(
            path: MechPage.dashboard.path(),
            builder: (context, state) => const DashboardScreen())
      ],
    );
  }
}
