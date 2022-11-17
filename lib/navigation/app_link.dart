import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/screens/enter_phone-passwordReset/screens/enter_phone_screen.dart';
import 'package:mechalodon_mobile/screens/login/screens/login_screen.dart';
import 'package:mechalodon_mobile/screens/welcome/welcome_screen.dart';
import 'package:mechalodon_mobile/services/auth_service.dart';
import 'package:mechalodon_mobile/services/injectable.dart';

enum MechPage {
  welcome,
  login,
  enterPhone
  // logout,
  // forgotPassword,
  // campaign,
  // adset,
  // ad,
  // creative,
  // settings,
  // splash,
}

extension PageExt on MechPage {
  String path() {
    switch (this) {
      case MechPage.welcome:
        return '/welcome';
      case MechPage.login:
        return '/login';
      case MechPage.enterPhone:
        return '/enterPhone';
      // case MechPage.logout:
      //   return '/logout';
      // case MechPage.forgotPassword:
      //   return '/forgotpassword';
      // case MechPage.campaign:
      //   return '/campaignView';
      // case MechPage.adset:
      //   return '/adset';
      // case MechPage.ad:
      //   return '/ad';
      // case MechPage.creative:
      //   return '/creative';
      // case MechPage.settings:
      //   return '/settings';
      // case MechPage.splash:
      //   return '/splash';
    }
  }

  GoRoute route() {
    switch (this) {
      case MechPage.welcome:
        return GoRoute(
          path: path(),
          builder: (context, state) => const WelcomeScreen(),
        );
      case MechPage.login:
        return GoRoute(
          path: path(),
          builder: (context, state) => const LoginScreen(),
        );
      case MechPage.enterPhone:
         return GoRoute(
          path: path(),
          builder: (context, state) => const EnterPhoneScreen(),
        );
      // case MechPage.logout:
      //   return GoRoute(
      //     path: path(),
      //     builder: (context, state) => const LoginScreen(),
      //   );
      // case MechPage.forgotPassword:
      //   return GoRoute(
      //     path: path(),
      //     builder: (context, state) => const LoginScreen(),
      //   );
      // case MechPage.campaign:
      //   return GoRoute(
      //     path: path(),
      //     builder: (context, state) => const LoginScreen(),
      //   );
      // case MechPage.adset:
      //   return GoRoute(
      //     path: path(),
      //     builder: (context, state) => const LoginScreen(),
      //   );
      // case MechPage.ad:
      //   return GoRoute(
      //     path: path(),
      //     builder: (context, state) => const LoginScreen(),
      //   );
      // case MechPage.creative:
      //   return GoRoute(
      //     path: path(),
      //     builder: (context, state) => const LoginScreen(),
      //   );
      // case MechPage.settings:
      //   return GoRoute(
      //     path: path(),
      //     builder: (context, state) => const LoginScreen(),
      //   );
      // case MechPage.splash:
      //   return GoRoute(
      //     path: path(),
      //     builder: (context, state) => const LoginScreen(),
      //   );
    }
  }
}

class AppLink {
  AppLink.fromLocation(String location)
      : currentPath = mechPageFromLocation(location);
  MechPage currentPath;

  /// Checks if link is okay to navigate to and redirects if not.
  ///
  /// Returns [String?] with the path to be redirected to.
  /// This function is called each time a route is navigated to checking if any
  /// redirection needs to happen.
  static String? shouldRedirect(MechPage page) {
    switch (page) {
      case MechPage.welcome:
        if (serviceLocator<AuthService>().userHasBeenOnboarded) {
          return MechPage.login.path();
        }
        return null;
      case MechPage.login:
        return null;
      default:
        return null;
    }
  }
}

MechPage mechPageFromLocation(String location) {
  return MechPage.values.firstWhere(
      (page) => "/${page.name}" == location);
}
