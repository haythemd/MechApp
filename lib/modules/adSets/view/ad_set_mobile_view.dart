import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/modules/marketing/bloc/ad_event.dart';
import 'package:mechalodon_mobile/modules/marketing/bloc/ad_state.dart';
import 'package:mechalodon_mobile/modules/marketing/models/ad_model.dart';
import 'package:mechalodon_mobile/modules/marketing/widgets/overall_stats_widget.dart';
import 'package:mechalodon_mobile/modules/marketing/widgets/stat_card_widget.dart';
import 'package:mechalodon_mobile/navigation/app_link.dart';
import 'package:mechalodon_mobile/navigation/mech_nav_bar.dart';
import 'package:mechalodon_mobile/styles/mech_icons_icons.dart';
import 'package:mechalodon_mobile/styles/style.dart';

// This same view will be used for campaigns, ads, and adsets.

class AdSetMobileView<B extends Bloc<AdEvent, AdState>,
    C extends Bloc<AdEvent, AdState>> extends StatefulWidget {
  const AdSetMobileView({Key? key, this.adId}) : super(key: key);

  final String? adId;

  @override
  State<AdSetMobileView<B, C>> createState() => _AdSetMobileViewState();
}

class _AdSetMobileViewState<B extends Bloc<AdEvent, AdState>,
        C extends Bloc<AdEvent, AdState>> extends State<AdSetMobileView<B, C>>
    with AutomaticKeepAliveClientMixin {
  // 1. The navbar can take an arbitrary number of navMenuItems and build a bar from it.
  // 2. The user defines which Mechpage they want to go to when they define the item.

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        backgroundColor: MechColor.background,
        appBar: AppBar(
          leading:
              // rounded back button with chevron left icon and an elavation of 2
              Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: InkWell(
                onTap: () {
                  context.pop();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      color: MechColor.foreground,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.chevron_left,
                      color: MechColor.labelColor,
                      size: 20,
                    ),
                  ),
                )),
          ),
          title: Text(
            widget.adId ?? 'Adsets',
            style: MechTextStyle.subtitle,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    MechIcons.download,
                    color: MechColor.inactive,
                    size: 23,
                  )),
            )
          ],
        ),
        body: MechNavBar(
            selectedIndex: 1,
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
                                  "AdSets",
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
                                context.go(
                                    '${MechPage.campaigns.path()}${MechPage.adSets.path()}/${widget.adId}${MechPage.ads.path()}/${value.name}');
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
            })));
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
