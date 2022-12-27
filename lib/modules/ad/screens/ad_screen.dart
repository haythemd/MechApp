import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/ad/views/ad_view_mobile.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/utils/responsive.dart';

import 'package:mechalodon_mobile/modules/ad/bloc/ad_bloc.dart';

class AdScreen extends StatelessWidget {

  final String? adId;
  const AdScreen({Key? key, required this.adId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<AdBloc>(),
      child:  Responsive(
          mobile: AdMobile(adId: adId,),
          desktop: AdMobile(adId: adId),
          tablet: AdMobile(adId: adId)),
    );
  }
}
