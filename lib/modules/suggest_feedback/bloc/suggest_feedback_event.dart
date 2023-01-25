

part of 'suggest_feedback_bloc.dart';

abstract class SuggestFeedbackEvent {}

class SendFeedback extends SuggestFeedbackEvent {
  final  String id;
  final String text;
  SendFeedback( {required this.id, required this.text,});
}
