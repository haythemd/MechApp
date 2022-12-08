import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/navigation/mech_nav_bar.dart';
import 'package:mechalodon_mobile/screens/campaign/bloc/bloc/campaign_bloc.dart';
import 'package:mechalodon_mobile/screens/campaign/models/stat_model.dart';
import 'package:mechalodon_mobile/screens/campaign/widgets/overall_stats_widget.dart';
import 'package:mechalodon_mobile/screens/campaign/widgets/stat_card_widget.dart';
import 'package:mechalodon_mobile/styles/mech_icons_icons.dart';
import 'package:mechalodon_mobile/styles/style.dart';

// This same view will be used for campaigns, ads, and adsets.

class MarketingStatsMobileView extends StatefulWidget {
  const MarketingStatsMobileView({Key? key}) : super(key: key);

  @override
  State<MarketingStatsMobileView> createState() =>
      _MarketingStatsMobileViewState();
}

class _MarketingStatsMobileViewState extends State<MarketingStatsMobileView> {
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
            body: BlocBuilder<CampaignBloc, CampaignState>(
                builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const OverAllStats(),
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
                            child: _statCardBuilder(_returnMockModels(10)),
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              );
            })));
  }

  List<StatModel> _returnMockModels(int n) {
    List<StatModel> models = [];
    for (int i = 0; i < n; i++) {
      models.add(StatModel(
          id: i.toString(),
          name: "Campaign $i",
          spend: 100.0,
          orders: 10,
          cpp: 10));
    }
    return models;
  }

  Widget _statCardBuilder(List<StatModel> stats) {
    // builds a list of cards that show the campaign model's orders, cpp, and spend
    return ListView.builder(
        shrinkWrap: true,
        itemCount: stats.length,
        itemBuilder: (context, index) {
          return StatCard(
            onStatCardPressed: (value) {
              print(value.toJson());
            },
            model: stats[index],
          );
        });
  }
}
