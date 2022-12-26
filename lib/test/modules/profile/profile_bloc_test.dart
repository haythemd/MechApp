import 'package:bloc_test/bloc_test.dart';
import 'package:mechalodon_mobile/modules/profile/bloc/profile_bloc.dart';
import 'package:mechalodon_mobile/modules/profile/models/profile_model.dart';
import 'package:mechalodon_mobile/test/modules/profile/profile_bloc_test.mocks.dart';
import 'package:mechalodon_mobile/test/test_utils.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:mechalodon_mobile/modules/profile/repository/profile_repository.dart';
import 'package:mechalodon_mobile/services/injectable.dart';

@GenerateMocks([ProfileRepository])
void main() async {
  final  profileModel = ProfileModel.fromJson(await TestUtil.getJson("profile/profile.json"));
  final repo = MockProfileRepository();

  setUpAll(() {
    serviceLocator.registerFactory<ProfileRepository>(() => repo);
  });

  group("ProfileBloc", ()
  {
    test('initial State is ProfileInitial', () {
      expect(ProfileBloc().state, isA<ProfileInitial>());
    });
    blocTest<ProfileBloc, ProfileState>("emits [ProfileLoading, ProfileSuccess] when successfully fetching data",
        build: (){
      final bloc = ProfileBloc();
      when(repo.getProfileInfo(profileModel.userID)).thenAnswer((_) async => profileModel);
      return bloc;
    },
    act: (bloc)=>
        bloc.add(LoadProfile(id: profileModel.userID)),
      expect: ()=> [isA<ProfileLoading>(),isA<ProfileSuccess>() ]);

    blocTest<ProfileBloc, ProfileState>("emits [ProfileLoading, ProfileError] when error in fetching data",
        build: (){
          final bloc = ProfileBloc();
          when(repo.getProfileInfo(profileModel.userID)).thenAnswer((_) async => null);
          return bloc;
        },
        act: (bloc)=>
            bloc.add(LoadProfile(id: profileModel.userID)),
        expect: ()=> [isA<ProfileLoading>(),isA<ProfileError>() ]);
  });
}