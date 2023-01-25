





class PageLink {
  static String? _campaignId;
  static String? _adSetId;
  static String? _adsId;



  static const String welcome = '/';
  static const String login = '/login';
  static const String enterPhone = '/enter-phone';
  static const String resetPassword = '/reset-password';
  static const String dashboard = '/dashboard';
  static const String sms = '/sms';
  static const String profile = '/profile';
  static const String confirmCode = '/confirmation-code';
  static const String suggestFeedback ='/suggest-feedback';
  static const String campaigns = '/campaigns';
  static const String adSets = 'ad-sets';
  static const String ads = 'ads';

  static String campaignsPath({String campaignId = ''}) {
    _campaignId = campaignId;
     return (campaignId.isEmpty) ? '/campaigns' : '/campaigns/$campaignId';
  }
      
  static String adSetsPath({required String adSetId}) {
    _adSetId = adSetId;
     return '/campaigns/$_campaignId/ad-sets/$adSetId';
  }
  static String adsPath({required String adId}) {
    _adsId = adId;
     return '/campaigns/$_campaignId/ad-sets/$_adSetId/ads/$adId';
  }
}
