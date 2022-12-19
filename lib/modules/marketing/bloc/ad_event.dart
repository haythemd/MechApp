
abstract class AdEvent {}

class LoadAds extends AdEvent {
  String? adId;
  LoadAds({required this.adId});
}
