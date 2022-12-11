import 'package:mechalodon_mobile/modules/ad/models/ads_models.dart';

abstract class AdState {}

class AdInitial extends AdState {}

class AdLoading extends AdState {}

class AdSuccess extends AdState {
  final AdsModels marketing;

  AdSuccess({required this.marketing});
}

class AdError extends AdState {
  final String message;

  AdError(this.message);
}