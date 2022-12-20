import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/reset_password/confirmation_screen/bloc/confirmation_code_bloc.dart';
import 'package:mechalodon_mobile/modules/reset_password/confirmation_screen/views/confirmation_code_mobile_view.dart';
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
