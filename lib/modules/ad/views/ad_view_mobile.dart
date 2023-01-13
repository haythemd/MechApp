import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mechalodon_mobile/modules/ad/models/ad_view_model.dart';
import 'package:mechalodon_mobile/modules/dashboard/widgets/date_switcher_widget.dart';
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
  int selectedPeriodInDays = 1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdBloc, AdState>(builder: (context, state) {
      if (state is AdInitial) {
        BlocProvider.of<AdBloc>(context).add(LoadAd(
          id: widget.adId ?? 'Ad',
          periodInDays: selectedPeriodInDays,
        ));
      }
      if (state is AdSuccess) {
        selectedPeriodInDays = state.reportingPeriod;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: MechWidgets.appBar(
              title: 'AD',
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                OverAllStats(stats: state.ad.adMetrics),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Creatives",
                        style: MechTextStyle.subheading3,
                      ),
                      DateSwitcherWidget(
                        selectedPeriod: state.reportingPeriod,
                        numberOfDaysChanged: (i) {
                          if (selectedPeriodInDays != i) {
                            // if the time period changes load new data.
                            selectedPeriodInDays = i;
                            BlocProvider.of<AdBloc>(context).add(LoadAd(
                                id: widget.adId ?? 'Ad',
                                periodInDays: selectedPeriodInDays));
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: _creativeBuilder(state.ad.creatives ?? [])
                ),
              ],
            ),
          ),
        );
      }
      if (state is AdError) {
        return ErrorWidget(state.message);
      }
      return const MechLoadingWidget();
    });
  }

  Widget _creativeBuilder(List<Creative> creatives) {
    var creativeWidgets = [];
    for (var creative in creatives) {
      creativeWidgets.add(MechAnimatedCard(
        creative: creative,
      ));
    }
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        ...creativeWidgets,
        SizedBox(height: 90,)
      ],
    );
  }
}
