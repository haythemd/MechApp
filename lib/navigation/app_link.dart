import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/screens/dashboard/screens/dashboard_screen.dart';
import 'package:mechalodon_mobile/screens/login/screens/login_screen.dart';
import 'package:mechalodon_mobile/screens/reset_password/enter_new_password/screens/reset_password_screen.dart';
import 'package:mechalodon_mobile/screens/reset_password/send_reset_sms/screens/send_reset_sms_screen.dart';
import 'package:mechalodon_mobile/screens/welcome/welcome_screen.dart';
import 'package:mechalodon_mobile/services/auth_service.dart';
import 'package:mechalodon_mobile/services/injectable.dart';

enum MechPage {
  welcome,
  login,
  enterPhone,
  resetPassword,
  dashboard
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
      case MechPage.resetPassword:
        return '/resetPassword';
      case MechPage.dashboard:
        return '/dashboard';
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
          builder: (context, state) => const SendResetSMSScreen(),
        );
      case MechPage.resetPassword:
        return GoRoute(
            path: path(),
            builder: (context, state) => const ResetPasswordScreen());
      case MechPage.dashboard:
        return GoRoute(
            path: path(), builder: (context, state) => const DashboardScreen());
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
