

part of 'profile_bloc.dart';
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {
  final String message;
  ProfileError(this.message);
}

class ProfileSuccess extends ProfileState {
  final ProfileModel profileModel;
  ProfileSuccess(this.profileModel);
}
