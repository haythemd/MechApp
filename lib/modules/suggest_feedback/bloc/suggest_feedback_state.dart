

part of 'suggest_feedback_bloc.dart';

abstract class SuggestFeedbackState {}

class SuggestFeedbackInitial extends SuggestFeedbackState {}

class SuggestFeedbackLoading extends SuggestFeedbackState {}

class SuggestFeedbackError extends SuggestFeedbackState {
  final String message;
  SuggestFeedbackError(this.message);
}

class SuggestFeedbackSuccess extends SuggestFeedbackState {
  SuggestFeedbackSuccess();
}
