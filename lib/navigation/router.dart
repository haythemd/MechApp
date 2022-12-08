import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        MechPage.welcome.route(),
        MechPage.login.route(),
        MechPage.enterPhone.route(),
        MechPage.resetPassword.route(),
        MechPage.dashboard.route(),
        MechPage.campaign.route()
      ],
    );
  }
}
