import 'dart:convert';

import 'package:mechalodon_mobile/screens/login/models/user_model.dart';

class LoginRepository {
  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    var user = User(email, "sdfsdkj", password);
    await Future.delayed(const Duration(seconds: 3));
    return Future.value(user);
  }
}
