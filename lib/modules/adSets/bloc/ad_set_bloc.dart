import 'package:bloc/bloc.dart';
import 'package:mechalodon_mobile/modules/marketing/bloc/ad_event.dart';
import 'package:mechalodon_mobile/modules/marketing/bloc/ad_state.dart';
import 'package:mechalodon_mobile/modules/adSets/repo/ad_set_repository.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:meta/meta.dart';

class AdSetBloc extends Bloc<AdEvent, AdState> {
  AdSetBloc() : super(AdInitial()) {
    on<LoadAds>(_loadCampaign);
  }

  var reportingPeriodInDays = 1;

  void _loadCampaign(LoadAds event, Emitter<AdState> emit) async {
    var repo = serviceLocator<AdSetRepository>();
    emit(AdLoading());
    reportingPeriodInDays = event.periodInDays;
    await Future.delayed(const Duration(seconds: 1));
    var data = await repo.fetchAdsets();
    if (data != null) {
      emit(AdSuccess(marketing: data, reportingPeriod: reportingPeriodInDays));
    } else {
      emit(AdError('Something Wrong Happened'));
    }
  }
}
