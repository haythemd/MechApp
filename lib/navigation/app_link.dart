import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/modules/campaign/screens/campaign_screen.dart';
import 'package:mechalodon_mobile/modules/campaigns/sceens/campaigns_screen.dart';
import 'package:mechalodon_mobile/modules/dashboard/screens/dashboard_screen.dart';
import 'package:mechalodon_mobile/modules/login/screens/login_screen.dart';
import 'package:mechalodon_mobile/modules/reset_password/enter_new_password/screens/reset_password_screen.dart';
import 'package:mechalodon_mobile/modules/reset_password/send_reset_sms/screens/send_reset_sms_screen.dart';
import 'package:mechalodon_mobile/modules/welcome/welcome_screen.dart';

enum MechPage {
  welcome,
  login,
  enterPhone,
  resetPassword,
  dashboard,
  campaign,
  adSet
}

extension PageExt on MechPage {
  String pathWithId(String id) {
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
      case MechPage.campaign:
        return '/campaign';
      case MechPage.adSet:
        return '/adSet';
    }
  }
}
