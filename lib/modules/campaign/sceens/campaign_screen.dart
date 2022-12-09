import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/ad/view/ads_mobile_view.dart';
import 'package:mechalodon_mobile/modules/campaign/bloc/bloc/campaign_bloc.dart';

import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/utils/responsive.dart';

class CampaignScreen extends StatelessWidget {
  const CampaignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<CampaignBloc>(),
      child: const Responsive(
          mobile: AdsMobileView<CampaignBloc>(),
          desktop: AdsMobileView<CampaignBloc>(),
          tablet: AdsMobileView<CampaignBloc>()),
    );
  }
}
