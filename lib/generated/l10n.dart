// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Make your ads work`
  String get loginViewTitle {
    return Intl.message(
      'Make your ads work',
      name: 'loginViewTitle',
      desc: 'LoginView title',
      args: [],
    );
  }

  /// `Welcome`
  String get welcomeTitle {
    return Intl.message(
      'Welcome',
      name: 'welcomeTitle',
      desc: 'Welcome title',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddressInputFieldTitle {
    return Intl.message(
      'Email Address',
      name: 'emailAddressInputFieldTitle',
      desc: 'Password input field title',
      args: [],
    );
  }

  /// `Password`
  String get passwordInputFieldTitle {
    return Intl.message(
      'Password',
      name: 'passwordInputFieldTitle',
      desc: 'Password input field title',
      args: [],
    );
  }

  /// `Input Your Phone Number`
  String get enterPhoneNumberTitle {
    return Intl.message(
      'Input Your Phone Number',
      name: 'enterPhoneNumberTitle',
      desc: 'input field title',
      args: [],
    );
  }

  /// `e.g. 808-445-3444`
  String get phoneNumberExample {
    return Intl.message(
      'e.g. 808-445-3444',
      name: 'phoneNumberExample',
      desc: 'An example of the country\'s phone number',
      args: [],
    );
  }

  /// `Send Code`
  String get sendCodeButtonTitle {
    return Intl.message(
      'Send Code',
      name: 'sendCodeButtonTitle',
      desc: 'send Code',
      args: [],
    );
  }

  /// `Enter your phone Num.`
  String get enterPhoneNumberFieldTitle {
    return Intl.message(
      'Enter your phone Num.',
      name: 'enterPhoneNumberFieldTitle',
      desc: 'input field title',
      args: [],
    );
  }

  /// `Forgot Password`
  String get enterPhoneNumberSubtitle {
    return Intl.message(
      'Forgot Password',
      name: 'enterPhoneNumberSubtitle',
      desc: 'forgot password title',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get emailAddressInputFieldHintText {
    return Intl.message(
      'Enter Your Email',
      name: 'emailAddressInputFieldHintText',
      desc: 'hint text for email input field',
      args: [],
    );
  }

  /// `••••••••••••••`
  String get passwordInputFieldHintText {
    return Intl.message(
      '••••••••••••••',
      name: 'passwordInputFieldHintText',
      desc: 'hint text for password input field',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get resetPasswordButtonText {
    return Intl.message(
      'Forgot Password?',
      name: 'resetPasswordButtonText',
      desc: 'reset password button text',
      args: [],
    );
  }

  /// `Please make sure your password match`
  String get passwordConfirmationError {
    return Intl.message(
      'Please make sure your password match',
      name: 'passwordConfirmationError',
      desc: 'password Confirmation Error message',
      args: [],
    );
  }

  /// `Password Matched`
  String get passwordMatched {
    return Intl.message(
      'Password Matched',
      name: 'passwordMatched',
      desc: 'Confirm Password success message',
      args: [],
    );
  }

  /// `Login`
  String get loginButtonTitle {
    return Intl.message(
      'Login',
      name: 'loginButtonTitle',
      desc: 'Login button title',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccountButtonTitle {
    return Intl.message(
      'Create Account',
      name: 'createAccountButtonTitle',
      desc: 'Create account button title',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: 'the word \'or\' to be added to Or Create Account',
      args: [],
    );
  }

  /// `An email must be provided`
  String get blankEmailErrorMessage {
    return Intl.message(
      'An email must be provided',
      name: 'blankEmailErrorMessage',
      desc: 'error message for email field',
      args: [],
    );
  }

  /// `Please provide a valid email`
  String get invalidEmailError {
    return Intl.message(
      'Please provide a valid email',
      name: 'invalidEmailError',
      desc: 'error message for email field',
      args: [],
    );
  }

  /// `A password must be provided`
  String get blankPasswordErrorMessage {
    return Intl.message(
      'A password must be provided',
      name: 'blankPasswordErrorMessage',
      desc: 'blank password error message',
      args: [],
    );
  }

  /// `Input Your\nAccount Details`
  String get resetPasswordBannerText {
    return Intl.message(
      'Input Your\nAccount Details',
      name: 'resetPasswordBannerText',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Password`
  String get enterNewPasswordText {
    return Intl.message(
      'Enter New Password',
      name: 'enterNewPasswordText',
      desc: ' Enter New Password text',
      args: [],
    );
  }

  /// `Re Enter New Password`
  String get reEnterNewPasswordText {
    return Intl.message(
      'Re Enter New Password',
      name: 'reEnterNewPasswordText',
      desc: 'Re Enter New Password text',
      args: [],
    );
  }

  /// `Submit`
  String get submitButtonText {
    return Intl.message(
      'Submit',
      name: 'submitButtonText',
      desc: 'Submit Button Text',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPasswordText {
    return Intl.message(
      'Reset Password',
      name: 'resetPasswordText',
      desc: 'Reset Password text',
      args: [],
    );
  }

  /// `Didn't get a code?`
  String get didntGetCodeText {
    return Intl.message(
      'Didn\'t get a code?',
      name: 'didntGetCodeText',
      desc: 'Didn\'t get a code text',
      args: [],
    );
  }

  /// `Send code reload in`
  String get sendCodeReloadText {
    return Intl.message(
      'Send code reload in',
      name: 'sendCodeReloadText',
      desc: ' Send Code Reloads in text',
      args: [],
    );
  }

  /// `Resend`
  String get resendButtonText {
    return Intl.message(
      'Resend',
      name: 'resendButtonText',
      desc: 'RESEND Button Text',
      args: [],
    );
  }

  /// `back`
  String get backButtonText {
    return Intl.message(
      'back',
      name: 'backButtonText',
      desc: 'back Button Text',
      args: [],
    );
  }

  /// `Incorrect Code! Please input the code again`
  String get incorrectCodeAlertText {
    return Intl.message(
      'Incorrect Code! Please input the code again',
      name: 'incorrectCodeAlertText',
      desc: 'Incorrect Code Alert Text',
      args: [],
    );
  }

  /// `Check Your Phone For Verification`
  String get confirmCodePageTitle {
    return Intl.message(
      'Check Your Phone For Verification',
      name: 'confirmCodePageTitle',
      desc: 'Confirm Code Page title',
      args: [],
    );
  }

  /// `Next`
  String get nextButtonText {
    return Intl.message(
      'Next',
      name: 'nextButtonText',
      desc: 'Next Button Text',
      args: [],
    );
  }

  /// `Dashboard`
  String get navBarDashboardButton {
    return Intl.message(
      'Dashboard',
      name: 'navBarDashboardButton',
      desc: 'Dashboard - button description navbar',
      args: [],
    );
  }

  /// `Campaign`
  String get navBarCampaignButton {
    return Intl.message(
      'Campaign',
      name: 'navBarCampaignButton',
      desc: 'Campaign - button description navbar',
      args: [],
    );
  }

  /// `Profile`
  String get navBarProfileButton {
    return Intl.message(
      'Profile',
      name: 'navBarProfileButton',
      desc: 'Profile - button description navbar',
      args: [],
    );
  }

  /// `Integrations`
  String get profileIntegrationsText {
    return Intl.message(
      'Integrations',
      name: 'profileIntegrationsText',
      desc: ' Profile View integration text - Plural',
      args: [],
    );
  }

  /// `Profile`
  String get profileTitleText {
    return Intl.message(
      'Profile',
      name: 'profileTitleText',
      desc: ' Profile title text ',
      args: [],
    );
  }

  /// `Integration`
  String get profileIntegrationText {
    return Intl.message(
      'Integration',
      name: 'profileIntegrationText',
      desc: ' Profile View integration text',
      args: [],
    );
  }

  /// `Terms of service`
  String get termsOfServiceText {
    return Intl.message(
      'Terms of service',
      name: 'termsOfServiceText',
      desc: ' Terms of service text',
      args: [],
    );
  }

  /// `Cookie policy`
  String get cookiePolicyText {
    return Intl.message(
      'Cookie policy',
      name: 'cookiePolicyText',
      desc: ' Cookie policy text',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacyPolicyText {
    return Intl.message(
      'Privacy policy',
      name: 'privacyPolicyText',
      desc: ' Privacy policy text',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicyCapitalText {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicyCapitalText',
      desc: ' Privacy policy text in Capital letters',
      args: [],
    );
  }

  /// `Connect now`
  String get connectNowButtonText {
    return Intl.message(
      'Connect now',
      name: 'connectNowButtonText',
      desc: ' Connect now button text',
      args: [],
    );
  }

  /// `{percentage}% Completed`
  String completedCapitalText(int percentage) {
    return Intl.message(
      '$percentage% Completed',
      name: 'completedCapitalText',
      desc: ' Completed text',
      args: [percentage],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
