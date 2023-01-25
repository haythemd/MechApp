class SuggestFeedbackRepository {

  SuggestFeedbackRepository();

Future<bool> submitFeedback(String id, String text){
  //Send user Feedback along with userID to the backend. Should return a Response
  // Response Treated as True / False.
  Future.delayed(const Duration(seconds: 1));

  return Future.value(true);
}
}
