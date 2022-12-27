import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:mechalodon_mobile/modules/dashboard/models/dashboard_model.dart';
import 'package:mechalodon_mobile/modules/dashboard/widgets/date_switcher_widget.dart';
import 'package:mechalodon_mobile/modules/dashboard/widgets/metric_widget.dart';
import 'package:mechalodon_mobile/modules/dashboard/widgets/title_metric_widget.dart';
import 'package:mechalodon_mobile/navigation/page_links.dart';
import 'package:mechalodon_mobile/styles/mech_icons_icons.dart';
import 'package:mechalodon_mobile/styles/style.dart';
import 'package:mechalodon_mobile/utils/mech_loading_widget.dart';

class DashBoardMobileView extends StatefulWidget {
  const DashBoardMobileView({Key? key}) : super(key: key);

  @override
  State<DashBoardMobileView> createState() => _DashBoardMobileViewState();
}

class _DashBoardMobileViewState extends State<DashBoardMobileView> {
  // 1. The navbar can take an arbitrary number of navMenuItems and build a bar from it.
  // 2. The user defines which Mechpage they want to go to when they define the item.
  int selectedPeriodInDays = 1;

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
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    context.go(PageLink.profile);
                  },
                  icon: const Icon(
                    MechIcons.download,
                    color: MechColor.inactive,
                    size: 23,
                  )),
            )
          ],
        ),
        body: BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
              if (state is DashboardInitial) {
                BlocProvider.of<DashboardBloc>(context)
                    .add(LoadDashboardData(selectedPeriodInDays));
              }
              if (state is DashboardLoading) {
                return Center(child: const MechLoadingWidget());
              } else if (state is DashboardSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _headerTotals(state.data),
                      // const Padding(
                      //   padding: EdgeInsets.all(23.0),
                      //   child: Icon(
                      //     MechIcons.facebook,
                      //     size: 40,
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),
                      DateSwitcherWidget(
                        selectedPeriod: state.reportingPeriod,
                        numberOfDaysChanged: (i) {
                          if (selectedPeriodInDays != i) {
                            // if the time period changes load new data.
                            selectedPeriodInDays = i;
                            BlocProvider.of<DashboardBloc>(context)
                                .add(LoadDashboardData(selectedPeriodInDays));
                          }
                        },
                      ),
                      Expanded(child: _bottomMetrics(state.data))
                    ],
                  ),
                );
              } else {
                return Container();
              }
              }),
    );
  }

  Widget _headerTotals(DashboardModel model) {
    return Container(
      decoration: const BoxDecoration(
          color: MechColor.foreground,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          TitleMetricWidget(
            title: 'Spend',
            type: MetricType.moneyShort,
            value: model.spend ?? 0,
          ),
          TitleMetricWidget(
            title: 'Orders',
            type: MetricType.int,
            value: model.orders?.toDouble() ?? 0,
          ),
          TitleMetricWidget(
            title: 'Revenue',
            type: MetricType.moneyShort,
            value: model.revenue ?? 0,
          )
        ]),
      ),
    );
  }

  Widget _bottomMetrics(DashboardModel model) {
    return GridView.count(
      shrinkWrap: true,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      childAspectRatio: 2,
      children: [
        MechMetricWidget(
            title: "ROAS", value: model.roas ?? 0, type: MetricType.int),
        MechMetricWidget(
            title: "Spent",
            value: model.spend ?? 0,
            type: MetricType.moneyDecimal),
        MechMetricWidget(
            title: "CPP", value: model.cpp ?? 0, type: MetricType.moneyDecimal),
        MechMetricWidget(
            title: "Revenue", value: model.revenue ?? 0, type: MetricType.int),
        MechMetricWidget(
            title: "CPM", value: model.cpm ?? 0, type: MetricType.moneyDecimal),
        MechMetricWidget(
            title: "CPC", value: model.cpc ?? 0, type: MetricType.moneyDecimal),
        MechMetricWidget(
            title: "CTR", value: model.ctr ?? 0, type: MetricType.moneyDecimal),
        MechMetricWidget(
            title: "Checkouts",
            value: model.checkouts ?? 0,
            type: MetricType.moneyDecimal),
      ],
    );
  }
}
