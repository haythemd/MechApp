import 'package:bloc/bloc.dart';
import 'package:mechalodon_mobile/services/injectable.dart';

import '../repo/suggest_feedback_repository.dart';


part 'suggest_feedback_event.dart';
part 'suggest_feedback_state.dart';
class SuggestFeedbackBloc extends Bloc<SuggestFeedbackEvent, SuggestFeedbackState> {
  SuggestFeedbackBloc() : super(SuggestFeedbackInitial()) {
    on<SendFeedback>(_sendFeedback);
  }

  void _sendFeedback(SendFeedback event, Emitter<SuggestFeedbackState> emit) async {
    var repo = serviceLocator<SuggestFeedbackRepository>();
    emit(SuggestFeedbackLoading());
    bool data = await repo.submitFeedback(event.id,event.text);

    if (data == true) {
      emit(SuggestFeedbackSuccess());
    } else {
      emit(SuggestFeedbackError('Something Wrong Happened'));
    }
  }
}
