import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/confirmation_screen/bloc/reset_password_code_bloc.dart';
import 'package:mechalodon_mobile/modules/confirmation_screen/views/ResetPasswordCodeConfirmationView.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/utils/responsive.dart';

class ResetPasswordCodeConfirmationScreen extends StatelessWidget {
  const ResetPasswordCodeConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<ConfirmationCodeBloc>(),
      child: const Responsive(
          mobile: ConfirmationCodeMobileView(),
          desktop: ConfirmationCodeMobileView(),
          tablet: ConfirmationCodeMobileView()),
    );
  }
}
