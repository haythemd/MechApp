
abstract class AdEvent {}

class LoadAds extends AdEvent {
  String? adId;
  int periodInDays;
  LoadAds({required this.adId, required this.periodInDays});
}
