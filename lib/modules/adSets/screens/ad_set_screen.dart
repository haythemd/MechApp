import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/adSets/view/ad_set_mobile_view.dart';
import 'package:mechalodon_mobile/modules/adSets/bloc/ad_set_bloc.dart';
import 'package:mechalodon_mobile/modules/ads/bloc/bloc/ads_bloc.dart';
import 'package:mechalodon_mobile/modules/campaigns/bloc/bloc/campaigns_bloc.dart';

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
          mobile: AdSetMobileView<AdSetBloc, AdsBloc>(
            adId: adSetId,
          ),
          desktop: AdSetMobileView<AdSetBloc, AdsBloc>(
            adId: adSetId,
          ),
          tablet: AdSetMobileView<AdSetBloc, AdsBloc>(
            adId: adSetId,
          )),
    );
  }
}
