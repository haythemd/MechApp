import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/ad/models/ad_view_model.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/modules/ad/repo/ad_repository.dart';

part 'ad_event.dart';
part 'ad_state.dart';

class AdBloc extends Bloc<AdEvent, AdState> {
  AdBloc() : super(AdInitial()) {
    on<LoadAd>(_onLoadAd);
  }

  var reportingPeriodInDays = 1;
  void _onLoadAd(LoadAd event, Emitter<AdState> emit) async {

    emit(AdLoading());
    reportingPeriodInDays = event.periodInDays;
    var repo = serviceLocator<AdRepository>();
    DetailedAdModel? ads =
        await repo.loadAd("");
    if (ads == null) {
      emit(AdError('User was not found'));
      return;
    }
    emit(AdSuccess(ads, reportingPeriodInDays));
  }
}
