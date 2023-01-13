part of 'ad_bloc.dart';

abstract class AdState {}

class AdInitial extends AdState {}

class AdLoading extends AdState {}

class AdError extends AdState {
  final String message;
  AdError(this.message);
}

class AdSuccess extends AdState {
  final DetailedAdModel ad;
  final int reportingPeriod;
  AdSuccess(this.ad, this.reportingPeriod);
}
