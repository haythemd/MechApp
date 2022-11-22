
import 'package:mechalodon_mobile/generated/l10n.dart';
import 'package:mechalodon_mobile/services/injectable.dart';

class MechValidators{



  static String? isEmail
      (String? email){
    var s = serviceLocator<S>();
    if (email == null || email == "") return s.blankEmailErrorMessage;
    if (RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) return null;
    return s.invalidEmailError;
  }

  static String? isValidPassword(String? password) {
    var s = serviceLocator<S>();
    if (password == null || password == "") return s.blankPasswordErrorMessage;

    return null;
  }
}