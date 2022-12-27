part of 'ad_bloc.dart';

abstract class AdEvent {}

class LoadAd extends AdEvent {
  final  String id;

  LoadAd({required this.id});
}
