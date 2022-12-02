import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/navigation/mech_nav_bar.dart';
import 'package:mechalodon_mobile/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:mechalodon_mobile/screens/dashboard/widgets/date_switcher_widget.dart';
import 'package:mechalodon_mobile/screens/dashboard/widgets/metric_widget.dart';
import 'package:mechalodon_mobile/screens/dashboard/widgets/title_metric_widget.dart';
import 'package:mechalodon_mobile/styles/mech_icons_icons.dart';
import 'package:mechalodon_mobile/styles/style.dart';
import 'package:mechalodon_mobile/utils/mech_loading_widget.dart';

class DashBoardMobileView extends StatefulWidget {
  const DashBoardMobileView({Key? key}) : super(key: key);

  @override
  State<DashBoardMobileView> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardMobileView> {
  // 1. The navbar can take an arbitrary number of navMenuItems and build a bar from it.
  // 2. The user defines which Mechpage they want to go to when they define the item.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MechColor.background,
        appBar: AppBar(
          title: const Text(
            "MECHALODON",
            style: MechTextStyle.subtitle,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
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
            selectedIndex: 0,
            body: BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _headerTotals(),
                    const Padding(
                      padding: EdgeInsets.all(23.0),
                      child: Icon(
                        MechIcons.facebook,
                        size: 40,
                      ),
                    ),
                    DateSwitcherWidget(
                      periodChanged: (i) {
                        // Todo fetch new relavent data from bloc based on the
                        // give time period here.
                      },
                    ),
                    Expanded(child: _bottomMetrics())
                  ],
                ),
              );
            })));
  }

  Widget _headerTotals() {
    return Container(
      decoration: const BoxDecoration(
          color: MechColor.foreground,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TitleMetricWidget(
                title: 'Spend',
                type: MetricType.moneyShort,
                value: 15000.20,
              ),
              TitleMetricWidget(
                title: 'Orders',
                type: MetricType.int,
                value: 22,
              ),
              TitleMetricWidget(
                title: 'Revenue',
                type: MetricType.moneyShort,
                value: 543.20,
              )
            ]),
      ),
    );
  }

  Widget _bottomMetrics() {
    return GridView.count(
      shrinkWrap: true,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      childAspectRatio: 2,
      children: const [
        MechMetricWidget(title: "ROAS", value: 2344, type: MetricType.int),
        MechMetricWidget(
            title: "Spent", value: 2344.22, type: MetricType.moneyDecimal),
        MechMetricWidget(
            title: "CPP", value: 2.22, type: MetricType.moneyDecimal),
        MechMetricWidget(title: "Revenue", value: 2344, type: MetricType.int),
        MechMetricWidget(
            title: "CPM", value: 1.22, type: MetricType.moneyDecimal),
        MechMetricWidget(title: "CPC", value: 7.64, type: MetricType.moneyDecimal),
        MechMetricWidget(
            title: "CTR", value: 4.22, type: MetricType.moneyDecimal),
                MechMetricWidget(
            title: "Checkouts", value: 2344.22, type: MetricType.moneyDecimal),
       
      ],
    );
  }
}
