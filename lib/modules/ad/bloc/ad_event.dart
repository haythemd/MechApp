part of 'ad_bloc.dart';

abstract class AdEvent {}

class LoadAd extends AdEvent {
  final  String id;
  final int periodInDays;
  LoadAd({required this.id, required this.periodInDays});
}
