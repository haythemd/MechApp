import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/reset_password/send_reset_sms/bloc/bloc/send_reset_sms_bloc.dart';
import 'package:mechalodon_mobile/modules/reset_password/send_reset_sms/views/send_reset_sms_mobile_view.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/utils/responsive.dart';

class SendResetSMSScreen extends StatelessWidget {
  const SendResetSMSScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<SendResetSMSBloc>(),
      child: Responsive(
          mobile: SendResetSMSView(),
          desktop: SendResetSMSView(),
          tablet: SendResetSMSView()),
    );
  }
}
