import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/ad/bloc/ad_state.dart';
import 'package:mechalodon_mobile/modules/ad/bloc/ad_event.dart';
import 'package:mechalodon_mobile/modules/campaigns/repository/campaigns_repository.dart';
import 'package:mechalodon_mobile/services/injectable.dart';

class CampaignsBloc extends Bloc<AdEvent, AdState> {
  CampaignsBloc() : super(AdInitial()) {
    on<LoadAds>(_loadCampaign);
  }

  void _loadCampaign(LoadAds event, Emitter<AdState> emit) async {
    var repo = serviceLocator<CampaignsRepository>();
    emit(AdLoading());
    await Future.delayed(Duration(seconds: 1));
    var data = await repo.fetchCampaigns();
    if (data != null) {
      emit(AdSuccess(marketing: data));
    } else {
      emit(AdError('Something Wrong Happened'));
    }
  }
}
