import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class TitleMetricWidget extends StatelessWidget {
  const TitleMetricWidget({
    Key? key,
    required this.type,
    required this.value,
    required this.title,
  }) : super(key: key);

  final MetricType type;
  final double value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(type.getValue(value), style: MechTextStyle.titleMetric),
        const SizedBox(height: 5),
        Text(
          title,
          style: MechTextStyle.subheading5,
        )
      ],
    );
  }
}

enum MetricType { moneyShort, int, moneyDecimal }

extension MetricTools on MetricType {
  String getValue(double value) {
    switch (this) {
      case MetricType.moneyShort:
        if (value.toInt().toString().length > 4) {
          return "\$${value.toInt() ~/ 1000}k";
        } else {
          return "\$${value.toInt().toString()}";
        }
      case MetricType.int:
        if (value.toInt().toString().length > 4) {
          return "${value.toInt() ~/ 1000}k";
        } else {
          return value.toInt().toString();
        }
      case MetricType.moneyDecimal:
        return "\$${value.toString()}";
    }
  }
}
