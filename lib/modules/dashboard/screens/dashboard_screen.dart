import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:mechalodon_mobile/modules/dashboard/views/dashboard_view_mobile.dart';

import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/utils/responsive.dart';
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => serviceLocator<DashboardBloc>(),
    child: const Responsive(
        mobile: DashBoardMobileView(),
        desktop: DashBoardMobileView(),
        tablet: DashBoardMobileView()),
    );
  }
}
