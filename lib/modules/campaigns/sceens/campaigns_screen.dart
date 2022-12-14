import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/campaign/bloc/campaign_bloc.dart';
import 'package:mechalodon_mobile/modules/campaigns/bloc/bloc/campaigns_bloc.dart';
import 'package:mechalodon_mobile/modules/campaigns/views/campaigns_view_mobile.dart';

import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/utils/responsive.dart';

class CampaignsScreen extends StatelessWidget {
  const CampaignsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<CampaignsBloc>(),
      child: const Responsive(
          mobile: CampaignsMobileView<CampaignsBloc, CampaignBloc>(),
          desktop: CampaignsMobileView<CampaignsBloc, CampaignBloc>(),
          tablet: CampaignsMobileView<CampaignsBloc, CampaignBloc>()),
    );
  }
}
