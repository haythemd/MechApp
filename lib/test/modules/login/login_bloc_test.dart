import 'dart:math';

import 'package:mechalodon_mobile/modules/login/bloc/login_bloc.dart';
import 'package:mechalodon_mobile/modules/login/models/user_model.dart';
import 'package:mechalodon_mobile/modules/login/repository/login_repository.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/test/modules/login/login_bloc_test.mocks.dart';
import 'package:mechalodon_mobile/test/test_utils.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

@GenerateMocks([LoginRepository])
void main() async {
  final user = User.fromJson(await TestUtil.getJson('login/user.json'));
  final repository = MockLoginRepository();

  setUpAll(() {
    serviceLocator.registerFactory<LoginRepository>(() => repository);
  });

  group("LoginBloc", () {
    test('initial state is LoginInitial', () {
      expect(LoginBloc().state, isA<LoginInitial>());
    });
    blocTest<LoginBloc, LoginState>(
        "emits [LoginLoading, LoginSuccess] when valid credentials are entered",
        build: () {
          final bloc = LoginBloc();
          when(repository.loginUserWithEmailAndPassword(
                  user.email, user.password))
              .thenAnswer((_) async => user);
          return bloc;
        },
        act: (bloc) =>
            bloc.add(LoginUser(email: user.email, password: user.password)),
        expect: () => [isA<LoginLoading>(), isA<LoginSuccess>()]);

    blocTest<LoginBloc, LoginState>(
        "emits [LoginLoading, LoginError] when invalid credentials are entered",
        build: () {
          final bloc = LoginBloc();
          when(repository.loginUserWithEmailAndPassword(
                  user.email, user.password))
              .thenAnswer((_) async => null);
          return bloc;
        },
        act: (bloc) =>
            bloc.add(LoginUser(email: user.email, password: user.password)),
        expect: () => [isA<LoginLoading>(), isA<LoginError>()]);
  });
}
