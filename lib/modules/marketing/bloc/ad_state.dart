import 'package:mechalodon_mobile/modules/marketing/models/ads_models.dart';

abstract class AdState {}

class AdInitial extends AdState {}

class AdLoading extends AdState {}

class AdSuccess extends AdState {
  final AdsModels marketing;
  final int reportingPeriod;
  AdSuccess({required this.marketing, required this.reportingPeriod});
}

class AdError extends AdState {
  final String message;

  AdError(this.message);
}