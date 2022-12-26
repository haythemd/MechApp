part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class LoadProfile extends ProfileEvent {
  final  String id;
  LoadProfile({required this.id});
}
