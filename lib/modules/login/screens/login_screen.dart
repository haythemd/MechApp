import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/login/bloc/login_bloc.dart';
import 'package:mechalodon_mobile/modules/login/views/login_view_mobile.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/utils/responsive.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<LoginBloc>(),
      child: const Responsive(
          mobile: LoginViewMobile(),
          desktop: LoginViewMobile(),
          tablet: LoginViewMobile()),
    );
  }
}
