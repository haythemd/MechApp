import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/screens/login/views/login_view_mobile.dart';
import 'package:mechalodon_mobile/utils/responsive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: LoginViewMobile(),
        desktop: LoginViewMobile(),
        tablet: LoginViewMobile());
  }
}
