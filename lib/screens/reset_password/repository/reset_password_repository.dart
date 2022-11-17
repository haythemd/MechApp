


import 'package:mechalodon_mobile/screens/reset_password/models/reset_password_request_model.dart';

class ResetPasswordRepository {
  Future<ResetPasswordRequest?> resetPassword(String email,
      String password) async {
    var request = ResetPasswordRequest(email, password);
    await Future.delayed(const Duration(seconds: 3));
    return Future.value(request);
  }
}