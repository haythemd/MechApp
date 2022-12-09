
import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/modules/ad/models/ad_model.dart';
import 'package:mechalodon_mobile/modules/dashboard/widgets/title_metric_widget.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    required this.onStatCardPressed,
    required this.model,
    Key? key,
  }) : super(key: key);

  final AdModel model;

  final ValueChanged<AdModel> onStatCardPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onStatCardPressed(model);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: MechColor.foreground,
          ),
          child: Padding(
            padding: const EdgeInsets.all(21.0),
            child: Column(
              children: [
                // a title in a row with a pin icon button on the right side
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model.name,
                      style: MechTextStyle.subtitle,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.push_pin_outlined,
                            color: MechColor.labelColor))
                  ],
                ),
                // a line separator that has 15 padding on each side and is very thin
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    color: Color(0xFFE9E9E9),
                    thickness: 1,
                  ),
                ),

                // a row with 3 metrics
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleMetricWidget(
                        title: "Spend",
                        value: model.spend,
                        type: MetricType.moneyShort,
                      ),
                      // create a vertical line separator
                      Container(height: 60, width: 1, color: Color(0xFFE9E9E9)),
                      TitleMetricWidget(
                        title: "Orders",
                        value: model.orders.toDouble(),
                        type: MetricType.int,
                      ),
                      Container(height: 60, width: 1, color: Color(0xFFE9E9E9)),
                      TitleMetricWidget(
                        title: "CPP",
                        value: model.cpp.toDouble(),
                        type: MetricType.moneyDecimal,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}