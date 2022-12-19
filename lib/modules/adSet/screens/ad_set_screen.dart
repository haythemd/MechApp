import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/adSet/bloc/bloc/ad_set_bloc.dart';
import 'package:mechalodon_mobile/modules/adSet/views/ad_set_mobile_view.dart';
import 'package:mechalodon_mobile/modules/campaign/bloc/campaign_bloc.dart';

import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/utils/responsive.dart';

class AdSetScreen extends StatelessWidget {
  const AdSetScreen({Key? key, required this.adSetId}) : super(key: key);

  final String adSetId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<AdSetBloc>(),
      child: Responsive(
          mobile: AdSetMobileView<CampaignBloc, AdSetBloc>(
            adId: adSetId,
          ),
          desktop: AdSetMobileView<CampaignBloc, AdSetBloc>(
            adId: adSetId,
          ),
          tablet: AdSetMobileView<CampaignBloc, AdSetBloc>(
            adId: adSetId,
          )),
    );
  }
}
