


import 'package:mechalodon_mobile/screens/reset_password/models/reset_password_model.dart';

class ResetPasswordRepository {
  Future<ResetPasswordResponse> ResetPassword(String email,
      String password) async {
    var request = ResetPasswordResponse('blabla', '');
    await Future.delayed(const Duration(seconds: 3));
    return Future.value(request);
  }
}