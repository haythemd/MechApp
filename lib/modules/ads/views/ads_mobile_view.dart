import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/modules/ads/bloc/bloc/ads_bloc.dart';
import 'package:mechalodon_mobile/modules/dashboard/widgets/date_switcher_widget.dart';
import 'package:mechalodon_mobile/modules/marketing/bloc/ad_event.dart';
import 'package:mechalodon_mobile/modules/marketing/bloc/ad_state.dart';
import 'package:mechalodon_mobile/modules/marketing/models/ad_model.dart';
import 'package:mechalodon_mobile/modules/marketing/widgets/overall_stats_widget.dart';
import 'package:mechalodon_mobile/modules/marketing/widgets/stat_card_widget.dart';
import 'package:mechalodon_mobile/navigation/page_links.dart';
import 'package:mechalodon_mobile/styles/style.dart';
import 'package:mechalodon_mobile/utils/mech_widgets.dart';

// This same view will be used for campaigns, ads, and adsets.

class AdsMobileView<B extends Bloc<AdEvent, AdState>,
    C extends Bloc<AdEvent, AdState>> extends StatefulWidget {
  const AdsMobileView({Key? key, required this.adId}) : super(key: key);

  final String adId;
  @override
  State<AdsMobileView<B, C>> createState() => _AdsMobileViewState();
}

class _AdsMobileViewState<B extends Bloc<AdEvent, AdState>,
        C extends Bloc<AdEvent, AdState>> extends State<AdsMobileView<B, C>>
    with AutomaticKeepAliveClientMixin {
  // 1. The navbar can take an arbitrary number of navMenuItems and build a bar from it.
  // 2. The user defines which Mechpage they want to go to when they define the item.
  int selectedPeriodInDays = 1;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: MechColor.background,
        appBar: MechWidgets.appBar(
            subtitle: widget.adId, title: 'ADSET', context: context),
        body: BlocBuilder<B, AdState>(builder: (context, state) {
          if (state is AdInitial) {
            BlocProvider.of<B>(context).add(
                LoadAds(adId: widget.adId, periodInDays: selectedPeriodInDays));
          } else if (state is AdLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AdSuccess) {
            selectedPeriodInDays = state.reportingPeriod;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OverAllStats(stats: state.marketing),
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
                          "Ads",
                          style: MechTextStyle.subheading3,
                        ),
                        DateSwitcherWidget(
                          selectedPeriod: state.reportingPeriod,
                          numberOfDaysChanged: (i) {
                            if (selectedPeriodInDays != i) {
                              // if the time period changes load new data.
                              selectedPeriodInDays = i;
                              BlocProvider.of<B>(context).add(LoadAds(
                                  adId: null,
                                  periodInDays: selectedPeriodInDays));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                     Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: _statCardBuilder(state.marketing.stats, (value) {
                          context.push(
                              PageLink.adsPath(adId: value.name));
                        }),
                      ),
                ],
              ),
            );
          }
          return Container();
        }));
  }

Widget _statCardBuilder(
      List<AdModel> stats, ValueChanged<AdModel> onStatCardPressed) {
    super.build(context);
    var statUs = [];
    for (var stat in stats) {
      statUs.add(StatCard(
        model: stat,
        onStatCardPressed: onStatCardPressed,
      ));
    }
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        ...statUs,
        SizedBox(height: 90,)
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
