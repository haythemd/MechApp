import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/screens/welcome/welcome_view.dart';
import 'package:mechalodon_mobile/utils/responsive.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: WelcomeViewMobile(),
        desktop: WelcomeViewMobile(),
        tablet: WelcomeViewMobile());
  }
}
