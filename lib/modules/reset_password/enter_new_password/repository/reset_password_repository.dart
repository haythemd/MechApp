

import 'package:mechalodon_mobile/modules/reset_password/enter_new_password/models/reset_password_request_model.dart';

class ResetPasswordRepository {
  Future<ResetPasswordRequest?> resetPassword(String email,
      String password) async {
    var request = ResetPasswordRequest(email, password);
    await Future.delayed(const Duration(seconds: 3));
    return Future.value(request);
  }
}
