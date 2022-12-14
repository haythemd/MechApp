import 'package:mechalodon_mobile/modules/ad/models/ad_model.dart';

abstract class AdEvent {}

class LoadAds extends AdEvent {
  String? adId;
  LoadAds({required this.adId});
}
