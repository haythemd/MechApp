import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/modules/profile/models/profile_model.dart';
import 'package:mechalodon_mobile/modules/profile/repository/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent,ProfileState>{
  ProfileBloc() : super(ProfileInitial()){
    on<LoadProfile>(_loadUserProfile);
  }
  Future<void> _loadUserProfile(LoadProfile event, Emitter<ProfileState> emit) async {


    emit(ProfileLoading());
    var repo = serviceLocator<ProfileRepository>();
    var profileInfo =
    await repo.getProfileInfo(event.id);

    if (event.id == null || profileInfo == null) {
      emit(ProfileError('Could not get profile info!'));
      return;
    }

        emit(ProfileSuccess(profileInfo));

    }

  }

