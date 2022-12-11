import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/campaign/view/campaign_mobile_view.dart';
import 'package:mechalodon_mobile/modules/campaign/bloc/campaign_bloc.dart';
import 'package:mechalodon_mobile/modules/campaigns/bloc/bloc/campaigns_bloc.dart';

import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/utils/responsive.dart';

class CampaignScreen extends StatelessWidget {
  const CampaignScreen({Key? key, required this.adSetId}) : super(key: key);

  final String adSetId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<CampaignBloc>(),
      child: Responsive(
          mobile: CampaignMobileView<CampaignBloc, CampaignsBloc>(
            adId: adSetId,
          ),
          desktop: CampaignMobileView<CampaignBloc, CampaignsBloc>(
            adId: adSetId,
          ),
          tablet: CampaignMobileView<CampaignBloc, CampaignsBloc>(
            adId: adSetId,
          )),
    );
  }
}
