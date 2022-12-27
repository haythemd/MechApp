import 'dart:math';
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

class _MechAnimatedCardState extends State<MechAnimatedCard> with SingleTickerProviderStateMixin{
var s = serviceLocator<S>();
  late AnimationController _animationController;
  late Animation<double> _animation;
  AnimationStatus _animationStatus= AnimationStatus.dismissed;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 700));
    _animation = Tween<double>(end: 1,begin: 0).animate(_animationController)
      ..addListener(() {
        setState(() {

        });
      })
    ..addStatusListener((status) {_animationStatus = status;});
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
      ..setEntry(3, 2,0.002)
      ..rotateY(pi * _animation.value),
      child: _animation.value<0.5?Container(
        margin: const EdgeInsets.only(top: 18, bottom: 6),
        padding: const EdgeInsets.symmetric(
            horizontal: 12, vertical: 18),
        height: 410,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: MechColor.foreground,
            borderRadius: MechBorderRadius.radius),
        child: Column(mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: MechBorderRadius.radius,
                child: Image.network(widget.creative.photoUrl,fit: BoxFit.fitWidth,width: double.infinity,),
              ),
            ),
            Container(alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 8,),
              height: 26,
              child: Row(

                children: [
                  Text(
                    widget.creative.name,
                    style: MechTextStyle.subheading5.copyWith(
                        fontSize: 18, color: Colors.black),
                  ),
                  Expanded(child: Container()),
                  TextButton(
                      onPressed: () {

                        if (_animationStatus == AnimationStatus.dismissed){
                          _animationController.forward();
                        } else {
                          _animationController.reverse();
                        }

                      },
                      child: Text(
                        s.showMetricsTextButton,
                        style: MechTextStyle.subheading3.copyWith(
                            fontSize: 12,
                            decoration: TextDecoration.underline),
                      ))
                ],
              ),
            ),
            const Divider(

            ),
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
                    )
                  ),
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
                    )
                  ),
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
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ):Container(margin: const EdgeInsets.only(top: 18, bottom: 6),
        padding: const EdgeInsets.symmetric(
            horizontal: 12, vertical: 18),
        height: 410,
        decoration: const BoxDecoration(
            color: Color(0xFFE9E9E9),
            borderRadius: MechBorderRadius.radius),

      child: Transform(
        alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
        child: GestureDetector(onTap: (){_animationController.reverse(from: 1);},
          child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisSpacing: 10,mainAxisSpacing: 10,crossAxisCount: 3),
          children: [
            ...widget.creative.metrics.getMetrics().keys.map((e) => MechMetricWidget(title: e, type: MetricType.moneyShort, value:widget.creative.metrics.getMetrics()[e]?.toDouble() ?? 0,titleOnTop: false,)),
            // This will later be implemented so that the user can add in new metrics they want to track
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: GestureDetector(
            //     onTap: () {},
            //     child: Container(
            //       decoration: const BoxDecoration(
            //           borderRadius: BorderRadius.all(Radius.circular(15)),
            //           color: MechColor.foreground),
            //       width: 90,
            //       height: 90,
            //       child: Padding(
            //         padding: const EdgeInsets.all(18.0),
            //         child: Column(mainAxisAlignment: MainAxisAlignment.center, children:  [
            //           const Icon(Icons.add),
            //           Text(s.addNewButtonText, style: MechTextStyle.subheading3.copyWith(color: const Color(0xFF323232),fontSize: 12),)
            //         ]),
            //       ),
            //     ),
            //   ),
            // )
          ],),
        ),
      ),),
    );
  }
}
