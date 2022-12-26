import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/utils/responsive.dart';
import 'package:mechalodon_mobile/modules/profile/views/profile_view_mobile.dart';
import 'package:mechalodon_mobile/modules/profile/bloc/profile_bloc.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<ProfileBloc>(),
      child: const Responsive(
          mobile: ProfileViewMobile(),
          desktop: ProfileViewMobile(),
          tablet: ProfileViewMobile()),
    );
  }
}
