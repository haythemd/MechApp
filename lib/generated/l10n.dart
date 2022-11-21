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

  /// `Enter Your Email`
  String get emailAddressInputFieldHintText {
    return Intl.message(
      'Enter Your Email',
      name: 'emailAddressInputFieldHintText',
      desc: 'hint text for email input field',
      args: [],
    );
  }

  /// `**************`
  String get passwordInputFieldHintText {
    return Intl.message(
      '**************',
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