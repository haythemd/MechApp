import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/screens/campaign/bloc/bloc/campaign_bloc.dart';
import 'package:mechalodon_mobile/screens/campaign/views/marketing_stats_mobile_view.dart';

import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/utils/responsive.dart';

class CampaignScreen extends StatelessWidget {
  const CampaignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<CampaignBloc>(),
      child: const Responsive(
          mobile: MarketingStatsMobileView(),
          desktop: MarketingStatsMobileView(),
          tablet: MarketingStatsMobileView()),
    );
  }
}
