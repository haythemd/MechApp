
import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/screens/dashboard/widgets/title_metric_widget.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class CampaignMetric extends StatelessWidget {
  const CampaignMetric({
    required this.title,
    required this.type,
    required this.value,
    Key? key,
  }) : super(key: key);

  final double value;
  final MetricType type;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: MechColor.foreground),
        width: 110,
        height: 110,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              type.getValue(value),
              style: MechTextStyle.titleBodyMetric,
            ),
            Text(title)
          ]),
        ),
      ),
    );
  }
}
