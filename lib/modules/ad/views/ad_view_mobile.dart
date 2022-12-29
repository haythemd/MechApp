import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/styles/style.dart';
import 'package:mechalodon_mobile/utils/mech_loading_widget.dart';
import 'package:mechalodon_mobile/utils/mech_widgets.dart';
import 'package:mechalodon_mobile/modules/ad/bloc/ad_bloc.dart';
import 'package:mechalodon_mobile/styles/mech_icons_icons.dart';
import 'package:mechalodon_mobile/modules/ad/widgets/animated_card_widget.dart';

import 'package:mechalodon_mobile/generated/l10n.dart';

import '../../marketing/widgets/overall_stats_widget.dart';

class AdMobile extends StatefulWidget {
  const AdMobile({Key? key, required this.adId}) : super(key: key);

  final String? adId;

  @override
  State<AdMobile> createState() => _AdMobileState();
}

class _AdMobileState extends State<AdMobile> {
  var s = serviceLocator<S>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdBloc, AdState>(builder: (context, state) {
      if (state is AdInitial) {
        BlocProvider.of<AdBloc>(context).add(LoadAd(id: widget.adId ?? 'Ad'));
      }
      if (state is AdSuccess) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: MechWidgets.appBar(
              title: 'CREATIVES',
              subtitle: widget.adId ?? 'Ad',
              context: context,
              trailing: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      MechIcons.download,
                      color: MechColor.inactive,
                      size: 23,
                    )),
              )),
          body: Column(
            children: [
              OverAllStats(stats: state.ad.adMetrics),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:18.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.ad.creatives?.length,
                    itemBuilder: (context, index) {
                      if (state.ad.creatives?[index] != null) {
                        return MechAnimatedCard(
                          creative: state.ad.creatives![index],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      }
      if (state is AdError) {
        return ErrorWidget(state.message);
      }
      return const MechLoadingWidget();
    });
  }
}
