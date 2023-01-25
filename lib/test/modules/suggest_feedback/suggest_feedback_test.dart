import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/test/modules/suggest_feedback/suggest_feedback_test.mocks.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import 'package:mechalodon_mobile/modules/suggest_feedback/bloc/suggest_feedback_bloc.dart';
import 'package:mechalodon_mobile/modules/suggest_feedback/repo/suggest_feedback_repository.dart';



@GenerateMocks([SuggestFeedbackRepository])
void main() async {
  final repository = MockSuggestFeedbackRepository();

  setUpAll(() {
    serviceLocator.registerFactory<SuggestFeedbackRepository>(() => repository);
  });

  group("SuggestFeedbackBloc", () {
    test('initial state is SuggestFeedbackInitial ', () {
      expect(SuggestFeedbackBloc().state, isA<SuggestFeedbackInitial>());
    });
    blocTest<SuggestFeedbackBloc, SuggestFeedbackState>(
        "emits [SuggestFeedbackLoading, SuggestFeedbackSuccess] when valid code is entered",
        build: () {
          final bloc = SuggestFeedbackBloc();
          when(repository.submitFeedback("id","feedback"))
              .thenAnswer((_) async => true);
          return bloc;
        },
        act: (bloc) =>
            bloc.add(SendFeedback( id: 'id', text: 'feedback')),
        expect: () => [isA<SuggestFeedbackLoading>(), isA<SuggestFeedbackSuccess>()]);

    blocTest<SuggestFeedbackBloc, SuggestFeedbackState>(
        "emits [SuggestFeedbackLoading, SuggestFeedbackError] when invalid code is entered",
        build: () {
          final bloc = SuggestFeedbackBloc();
          when(repository.submitFeedback("id","feedback"))
              .thenAnswer((_) async => false);
          return bloc;
        },
        act: (bloc) =>
            bloc.add(SendFeedback( id: 'id', text: 'feedback')),
        expect: () => [isA<SuggestFeedbackLoading>(), isA<SuggestFeedbackError>()]);
  });
}
