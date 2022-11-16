import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/screens/reset_password/bloc/reset_password_bloc.dart';
import 'package:mechalodon_mobile/screens/reset_password/views/reset_password_view_mobile.dart';

import '../../../services/injectable.dart';
import '../../../utils/responsive.dart';
class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => serviceLocator<ResetPasswordBloc>(),
    child: const Responsive(
        mobile: ResetPasswordMobileView(),
        desktop: ResetPasswordMobileView(),
        tablet: ResetPasswordMobileView()),
    );
  }
}
