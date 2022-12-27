import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/ads/bloc/bloc/ads_bloc.dart';
import 'package:mechalodon_mobile/modules/ads/views/ads_mobile_view.dart';

import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/utils/responsive.dart';

class AdsScreen extends StatelessWidget {
  const AdsScreen({Key? key, required this.adsId, required this.parentPath})
      : super(key: key);

  final String adsId;
  final String parentPath;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<AdsBloc>(),
      child: Responsive(
          mobile: AdsMobileView<AdsBloc, AdsBloc>(
            adId: adsId,
            parentPath: parentPath,
          ),
          desktop: AdsMobileView<AdsBloc, AdsBloc>(
            adId: adsId,
            parentPath: parentPath,
          ),
          tablet: AdsMobileView<AdsBloc, AdsBloc>(
            adId: adsId,
            parentPath: parentPath,
          )),
    );
  }
}
