
import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/screens/dashboard/widgets/title_metric_widget.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class MechMetricWidget extends StatelessWidget {
  const MechMetricWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.type,
  }) : super(key: key);

  final String title;
  final double value;
  final MetricType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: const BoxDecoration(
          color: MechColor.foreground,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: MechTextStyle.subheading5,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                type.getValue(value),
                style: MechTextStyle.titleBodyMetric,
              )
            ]),
      ),
    );
  }
}