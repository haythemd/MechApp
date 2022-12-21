enum MechPage {
  welcome,
  login,
  enterPhone,
  resetPassword,
  dashboard,
  campaigns,
  adSets,
  ads,
  ad,
  sms,
  confirmCode
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
      case MechPage.campaigns:
        return '/campaigns';
      case MechPage.adSets:
        return '/adSets';
      case MechPage.ads:
        return '/ads';
      case MechPage.ad:
        return '/ad';
      case MechPage.sms:
        return '/sms';
      case MechPage.confirmCode:
        return '/confirmCode';
    }
  }

  String name() {
    switch (this) {
      case MechPage.welcome:
        return 'welcome';
      case MechPage.login:
        return 'login';
      case MechPage.enterPhone:
        return 'enterPhone';
      case MechPage.resetPassword:
        return 'resetPassword';
      case MechPage.dashboard:
        return 'dashboard';
      case MechPage.campaigns:
        return 'campaigns';
      case MechPage.adSets:
        return 'adSets';
      case MechPage.ads:
        return 'ads';
      case MechPage.ad:
        return 'ad';
      case MechPage.sms:
        return 'sms';
      case MechPage.confirmCode:
        return 'confirmCode';
    }
  }
}
