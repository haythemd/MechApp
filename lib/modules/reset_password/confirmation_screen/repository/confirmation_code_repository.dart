class ConfirmationCodeRepository {

  Future<bool> confirmCode(String code) async {
    await Future.delayed(const Duration(seconds: 2));
    // if code is false return false else true
    return Future.value(true);
  }

  Future<bool> sendCode() async {

    await Future.delayed(const Duration(seconds: 2));
    // if code is false return false else true
    return Future.value(true);
  }



}