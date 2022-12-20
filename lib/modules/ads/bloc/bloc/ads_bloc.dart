import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/marketing/bloc/ad_event.dart';
import 'package:mechalodon_mobile/modules/marketing/bloc/ad_state.dart';
import 'package:mechalodon_mobile/modules/ads/repo/ads_repository.dart';
import 'package:mechalodon_mobile/services/injectable.dart';

class AdsBloc extends Bloc<AdEvent, AdState> {
  AdsBloc() : super(AdInitial()) {
    on<LoadAds>(_loadMarketingData);
  }

  @override
  void _loadMarketingData(LoadAds event, Emitter<AdState> emit) async {
    var repo = serviceLocator<AdsRepository>();
    emit(AdLoading());
    await Future.delayed(const Duration(seconds: 1));
    var data = await repo.fetchAdSets();
    if (data != null) {
      emit(AdSuccess(marketing: data));
    } else {
      emit(AdError('Something Wrong Happened'));
    }
  }
}
