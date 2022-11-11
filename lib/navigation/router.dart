import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/navigation/app_link.dart';
import 'package:mechalodon_mobile/screens/login/screens/login_screen.dart';
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
      initialLocation: MechPage.welcome.path(),
      routes: [
        GoRoute(
          path: MechPage.welcome.path(),
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
          path: MechPage.login.path(),
          builder: (context, state) => const LoginScreen(),
        ),
      ],
      redirect: (state) {
        return AppLink.shouldRedirect(mechPageFromLocation(state.location));
      },
    );
  }
}
