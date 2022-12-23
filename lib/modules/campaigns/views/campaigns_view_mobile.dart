import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/modules/marketing/bloc/ad_event.dart';
import 'package:mechalodon_mobile/modules/marketing/bloc/ad_state.dart';
import 'package:mechalodon_mobile/modules/marketing/models/ad_model.dart';
import 'package:mechalodon_mobile/modules/marketing/widgets/overall_stats_widget.dart';
import 'package:mechalodon_mobile/modules/marketing/widgets/stat_card_widget.dart';
import 'package:mechalodon_mobile/navigation/app_link.dart';
import 'package:mechalodon_mobile/styles/style.dart';

// This same view will be used for campaigns, ads, and adsets.

class CampaignsMobileView<B extends Bloc<AdEvent, AdState>,
    C extends Bloc<AdEvent, AdState>> extends StatefulWidget {
  const CampaignsMobileView({Key? key, this.adId}) : super(key: key);

  final String? adId;

  @override
  State<CampaignsMobileView<B, C>> createState() => _CampaignsMobileViewState();
}

class _CampaignsMobileViewState<B extends Bloc<AdEvent, AdState>,
        C extends Bloc<AdEvent, AdState>>
    extends State<CampaignsMobileView<B, C>>
    with AutomaticKeepAliveClientMixin {
  // 1. The navbar can take an arbitrary number of navMenuItems and build a bar from it.
  // 2. The user defines which Mechpage they want to go to when they define the item.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MechColor.background,
        appBar: AppBar(
          title: const Text(
            "CAMPAIGN",
            style: MechTextStyle.subtitle,
          ),
        ),
        body: BlocBuilder<B, AdState>(builder: (context, state) {
              if (state is AdInitial) {
                BlocProvider.of<B>(context).add(LoadAds(adId: widget.adId));
              } else if (state is AdLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is AdSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OverAllStats(stats: state.marketing),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Campaigns",
                                  style: MechTextStyle.subheading3,
                                ),
                                InkWell(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      Icon(Icons.sort),
                                      Text("Sort")
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: _statCardBuilder(state.marketing.stats,
                                  (value) {
                                context.push('${MechPage.campaigns.path()}${MechPage.adSets.path()}/${value.name}');
                              }),
                            ))
                          ],
                        ),
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
    return ListView.builder(
        shrinkWrap: true,
        itemCount: stats.length,
        itemBuilder: (context, index) {
          return StatCard(
            onStatCardPressed: onStatCardPressed,
            model: stats[index],
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
