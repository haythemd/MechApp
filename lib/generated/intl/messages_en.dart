// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "blankEmailErrorMessage":
            MessageLookupByLibrary.simpleMessage("An email must be provided"),
        "blankPasswordErrorMessage":
            MessageLookupByLibrary.simpleMessage("A password must be provided"),
        "createAccountButtonTitle":
            MessageLookupByLibrary.simpleMessage("Create Account"),
        "emailAddressInputFieldHintText":
            MessageLookupByLibrary.simpleMessage("Enter Your Email"),
        "emailAddressInputFieldTitle":
            MessageLookupByLibrary.simpleMessage("Email Address"),
        "enterPhoneNumberFieldTitle":
            MessageLookupByLibrary.simpleMessage("Enter your phone Num."),
        "enterPhoneNumberSubtitle":
            MessageLookupByLibrary.simpleMessage("Forgot Password"),
        "enterPhoneNumberTitle":
            MessageLookupByLibrary.simpleMessage("Input Your Phone Number"),
        "enterNewPasswordText":
            MessageLookupByLibrary.simpleMessage("Enter New Password"),
        "invalidEmailError": MessageLookupByLibrary.simpleMessage(
            "Please provide a valid email"),
        "loginButtonTitle": MessageLookupByLibrary.simpleMessage("Login"),
        "loginViewTitle":
            MessageLookupByLibrary.simpleMessage("Make your ads work"),
        "or": MessageLookupByLibrary.simpleMessage("or"),
        "passwordConfirmationError": MessageLookupByLibrary.simpleMessage(
            "Please make sure your password match"),
        "passwordInputFieldHintText":
            MessageLookupByLibrary.simpleMessage("••••••••••••••"),
        "passwordInputFieldTitle":
            MessageLookupByLibrary.simpleMessage("Password"),
        "phoneNumberExample":
            MessageLookupByLibrary.simpleMessage("e.g. 808-445-3444"),
        "resetPasswordButtonText":
            MessageLookupByLibrary.simpleMessage("Forgot Password?"),
        "sendCodeButtonTitle":
            MessageLookupByLibrary.simpleMessage("Send Code"),
        "passwordMatched":
            MessageLookupByLibrary.simpleMessage("Password Matched"),
        "reEnterNewPasswordText":
            MessageLookupByLibrary.simpleMessage("Re Enter New Password"),
        "resetPasswordBannerText":
            MessageLookupByLibrary.simpleMessage("Input Your\nAccount Details"),
        "resetPasswordText":
            MessageLookupByLibrary.simpleMessage("Reset Password"),
        "submitButtonText": MessageLookupByLibrary.simpleMessage("Submit"),
        "welcomeTitle": MessageLookupByLibrary.simpleMessage("Welcome")
      };
}
