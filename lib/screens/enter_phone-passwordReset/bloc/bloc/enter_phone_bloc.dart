import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'enter_phone_event.dart';
part 'enter_phone_state.dart';

class EnterPhoneBloc extends Bloc<EnterPhoneEvent, EnterPhoneState> {
  EnterPhoneBloc() : super(EnterPhoneInitial()) {
    on<EnterPhoneEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
