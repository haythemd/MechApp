import 'package:bloc/bloc.dart';
import 'package:mechalodon_mobile/modules/ad/bloc/ad_event.dart';
import 'package:mechalodon_mobile/modules/ad/bloc/ad_state.dart';
import 'package:mechalodon_mobile/modules/campaign/repo/campaign_repository.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:meta/meta.dart';

class CampaignBloc extends Bloc<AdEvent, AdState> {
  CampaignBloc() : super(AdInitial()) {
    on<LoadAds>(_loadCampaign);
  }

  void _loadCampaign(LoadAds event, Emitter<AdState> emit) async {
    var repo = serviceLocator<CampaignRepository>();
    emit(AdLoading());
    await Future.delayed(Duration(seconds: 1));
    var data = await repo.fetchAdsets();
    if (data != null) {
      emit(AdSuccess(marketing: data));
    } else {
      emit(AdError('Something Wrong Happened'));
    }
  }
}
