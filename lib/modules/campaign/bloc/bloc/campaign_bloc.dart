import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/ad/bloc/ad_state.dart';
import 'package:mechalodon_mobile/modules/ad/bloc/ad_event.dart';


class CampaignBloc extends Bloc<AdEvent, AdState> {
  CampaignBloc() : super(AdInitial()) {
    on<LoadAds>(_loadCampaign);
  }

  void _loadCampaign(LoadAds event, Emitter<AdState> emit) {
    emit(AdLoading());
  }
}
