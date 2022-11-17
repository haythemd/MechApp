import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/screens/enter_phone-passwordReset/bloc/bloc/enter_phone_bloc.dart';
import 'package:mechalodon_mobile/screens/enter_phone-passwordReset/views/enter_phone_mobile_view.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/utils/responsive.dart';

class EnterPhoneScreen extends StatelessWidget {
  const EnterPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<EnterPhoneBloc>(),
      child: Responsive(
          mobile: EnterPhoneMobileView(),
          desktop: EnterPhoneMobileView(),
          tablet: EnterPhoneMobileView()),
    );
  }
}
