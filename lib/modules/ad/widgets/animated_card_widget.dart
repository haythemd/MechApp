import 'dart:math';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/modules/dashboard/widgets/metric_widget.dart';
import 'package:mechalodon_mobile/modules/dashboard/widgets/title_metric_widget.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/generated/l10n.dart';
import 'package:mechalodon_mobile/styles/style.dart';
import 'package:mechalodon_mobile/modules/ad/models/ad_view_model.dart';

class MechAnimatedCard extends StatefulWidget {
  final Creative creative;
  const MechAnimatedCard({Key? key, required this.creative}) : super(key: key);

  @override
  State<MechAnimatedCard> createState() => _MechAnimatedCardState();
}

class _MechAnimatedCardState extends State<MechAnimatedCard>
    with SingleTickerProviderStateMixin {
  var s = serviceLocator<S>();
  final FlipCardController _flipCardController = FlipCardController();

  @override
  Widget build(BuildContext context) {
    return FlipCard(
        controller: _flipCardController,
        front: _frontOfCard(),
        back: _backOfCard());
  }

  Widget _frontOfCard() {
    return Container(
      margin: const EdgeInsets.only( bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      height: 410,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: MechColor.foreground, borderRadius: MechBorderRadius.radius),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: MechBorderRadius.radius,
              child: Image.network(
                widget.creative.photoUrl,
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(
              top: 8,
            ),
            height: 26,
            child: Row(
              children: [
                Text(
                  widget.creative.name,
                  style: MechTextStyle.subheading5
                      .copyWith(fontSize: 18, color: Colors.black),
                ),
                Expanded(child: Container()),
                Text(
                  s.showMetricsTextButton,
                  style: MechTextStyle.subheading3.copyWith(
                      fontSize: 12, decoration: TextDecoration.underline),
                )
              ],
            ),
          ),
          const Divider(),
          SizedBox(
            height: 90,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: MechMetricWidget(
                      titleOnTop: false,
                      title: s.spendMetricText,
                      type: MetricType.moneyShort,
                      value: widget.creative.metrics.totalSpend,
                    )),
                const VerticalDivider(
                  indent: 12,
                  endIndent: 12,
                ),
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: MechMetricWidget(
                      titleOnTop: false,
                      title: s.ordersMetricText,
                      type: MetricType.moneyShort,
                      value: widget.creative.metrics.totalOrders.toDouble(),
                    )),
                const VerticalDivider(
                  indent: 12,
                  endIndent: 12,
                ),
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: MechMetricWidget(
                      titleOnTop: false,
                      title: s.cppMetricText,
                      type: MetricType.moneyShort,
                      value: widget.creative.metrics.totalCpp,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _backOfCard() {
    return Container(
      margin: const EdgeInsets.only(top: 18, bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
      height: 410,
      decoration: const BoxDecoration(
          color: Color(0xFFE9E9E9), borderRadius: MechBorderRadius.radius),
      child: Column(
        children: [
          Text(widget.creative.name,
              style: MechTextStyle.subheading5.copyWith(fontSize: 18)),
             const SizedBox(height: 10,),
          Expanded(
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 3),
              children: [
                ...widget.creative.metrics.getMetrics().keys.map((e) =>
                    MechMetricWidget(
                      title: e,
                      type: MetricType.moneyShort,
                      value: widget.creative.metrics.getMetrics()[e]?.toDouble() ?? 0,
                      titleOnTop: false,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
