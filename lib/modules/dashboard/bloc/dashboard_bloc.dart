import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/modules/dashboard/models/dashboard_model.dart';
import 'package:mechalodon_mobile/modules/dashboard/repository/dashboard_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<LoadDashboardData>(onLoadData);
  }

  var reportingPeriodInDays = 1;

  void onLoadData(LoadDashboardData event, Emitter<DashboardState> emit) async {
    if (state is DashboardLoading) {
      print("Error trying to load dashboard data while its already loading");
    } else {
      emit(DashboardLoading());
      await Future.delayed(Duration(seconds: 1));
      var repo = DashboardRepository();

      var model = await repo.getModelData(event.periodInDays);
      reportingPeriodInDays = event.periodInDays;
      print(jsonEncode(model?.toJson()));
      if (model != null) {
        emit(DashboardSuccess(data: model, reportingPeriod: reportingPeriodInDays));
      }
    }
  }
}
