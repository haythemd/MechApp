import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/screens/forgot_password/views/enter_email_mobile_view.dart';
import 'package:mechalodon_mobile/utils/responsive.dart';

class EnterEmailScreen extends StatelessWidget {
  const EnterEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: EnterEmailMobileView(),
        desktop: EnterEmailMobileView(),
        tablet: EnterEmailMobileView());
  }
}
