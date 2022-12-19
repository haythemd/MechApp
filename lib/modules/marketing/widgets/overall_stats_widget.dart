import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/modules/dashboard/widgets/title_metric_widget.dart';
import 'package:mechalodon_mobile/modules/marketing/models/ads_models.dart';
import 'package:mechalodon_mobile/modules/marketing/widgets/campaign_metric.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class OverAllStats extends StatefulWidget {
  const OverAllStats({
    required this.stats,
    Key? key,
  }) : super(key: key);

  final AdsModels stats;

  @override
  State<OverAllStats> createState() => _OverAllStatsState();
}

Axis _axis = Axis.horizontal;
int _numberOfCrossAxisItems = 1;

class _OverAllStatsState extends State<OverAllStats> {
  List<CampaignMetric> metrics = const [
    CampaignMetric(
      title: 'Spend',
      type: MetricType.moneyShort,
      value: 15001.23,
    ),
    CampaignMetric(
      title: 'CPP',
      type: MetricType.moneyDecimal,
      value: 1.23,
    ),
    CampaignMetric(
      title: 'CTR',
      type: MetricType.moneyDecimal,
      value: 1.23,
    ),
    CampaignMetric(
      title: 'Revenue',
      type: MetricType.moneyShort,
      value: 1201.23,
    ),
    CampaignMetric(
      title: 'Orders',
      type: MetricType.int,
      value: 22,
    ),
    CampaignMetric(
      title: 'CPC',
      type: MetricType.moneyDecimal,
      value: 1.23,
    ),
  ];

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Overall Stats",
              style: MechTextStyle.subheading3,
            ),
            InkWell(
                child: Text(
                  isExpanded ? "Close" : "Expand",
                  style: MechTextStyle.subheading5
                      .copyWith(decoration: TextDecoration.underline),
                ),
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                }),
          ],
        ),
        AnimatedContainer(
          onEnd: () {
            setState(() {
              if (isExpanded) {
                _axis = Axis.vertical;
                _numberOfCrossAxisItems = 3;
              } else {
                _axis = Axis.horizontal;
                _numberOfCrossAxisItems = 1;
              }
            });
          },
          duration: const Duration(milliseconds: 300),
          height: isExpanded ? 280 : 140,
          child: isExpanded
              ? GridView.count(
                  childAspectRatio: 1,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 3,
                  children: metrics,
                )
              : GridView.count(
                  childAspectRatio: 1,
                  scrollDirection: _axis,
                  crossAxisCount: _numberOfCrossAxisItems,
                  children: metrics,
                ),
        ),
      ],
    );
  }
}
