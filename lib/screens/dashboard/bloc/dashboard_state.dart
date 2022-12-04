part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardSuccess extends DashboardState {
  final DashboardModel data;
  final int reportingPeriod;
  DashboardSuccess({required this.data, required this.reportingPeriod});
}
