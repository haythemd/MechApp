import 'package:mechalodon_mobile/modules/ad/repo/ad_repository.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/test/test_utils.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

import 'package:mechalodon_mobile/modules/ad/models/ad_view_model.dart';

import 'package:mechalodon_mobile/modules/ad/bloc/ad_bloc.dart';

import 'adview_bloc_test.mocks.dart';


@GenerateMocks([AdRepository])
void main() async {
  final adModel = DetailedAdModel.fromJson(await TestUtil.getJson('ad/ad.json'));
  final repository = MockAdRepository();

  setUpAll(() {
    serviceLocator.registerFactory<AdRepository>(() => repository);
  });

  group("AdBloc", () {
    test('initial state is AdInitial', () {
      expect(AdBloc().state, isA<AdInitial>());
    });
    blocTest<AdBloc, AdState>(
        "emits [AdLoading, AdSuccess] when successfully fetching data from internet",
        build: () {
          final bloc = AdBloc();
          when(repository.loadAd("")).thenAnswer((realInvocation) async => adModel);
          return bloc;
        },
        act: (bloc) =>
            bloc.add(LoadAd(id: '',periodInDays: 1)),
        expect: () => [isA<AdLoading>(), isA<AdSuccess>()]);

    blocTest<AdBloc, AdState>(
        "emits [AdLoading, AdError] when error fetching resources from backend",
        build: () {
          final bloc = AdBloc();
          when(repository.loadAd(""))
              .thenAnswer((_) async => null);
          return bloc;
        },
        act: (bloc) =>
            bloc.add(LoadAd(id: "",periodInDays: 1)),
        expect: () => [isA<AdLoading>(), isA<AdError>()]);
  });
}
