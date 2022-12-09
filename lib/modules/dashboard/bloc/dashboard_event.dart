part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class LoadDashboardData extends DashboardEvent {
  final int periodInDays;
  LoadDashboardData(this.periodInDays);
}
