import 'package:bloc_test/bloc_test.dart';
import 'package:mechalodon_mobile/screens/reset_password/bloc/reset_password_bloc.dart';
import 'package:mechalodon_mobile/test/modules/reset_password/reset_password_bloc_test.mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:mechalodon_mobile/screens/reset_password/repository/reset_password_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mechalodon_mobile/screens/reset_password/models/reset_password_request_model.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/test/test_utils.dart';

@GenerateMocks([ResetPasswordRepository])
void main() async {

  final ResetPasswordRequest request = ResetPasswordRequest.fromJson(await TestUtil.getJson('reset_password/reset_password_request.json'));

  final repository = MockResetPasswordRepository();

  Future<ResetPasswordRequest> customRequest = Future(() => request);

  setUpAll(() {
    serviceLocator.registerFactory<ResetPasswordRepository>(() => repository);
  });

  group("ResetPasswordBloc", () {
    test('initial state is ResetPasswordInitial', () {
      expect(ResetPasswordBloc().state, isA<ResetPasswordInitial>());
    });
    blocTest<ResetPasswordBloc, ResetPasswordState>(
        "emits [ResetPasswordLoading, ResetPasswordSuccess] emits success when password is defined",
        build: () {
          final bloc = ResetPasswordBloc();
          when(repository.resetPassword(request.email, request.password))
          .thenAnswer((_) async => request);
          return bloc;
        },
        act: (bloc) =>
            bloc.add(ResetPassword(email: request.email, password: request.password)),
        expect: () => [isA<ResetPasswordLoading>(), isA<ResetPasswordSuccess>()]);

    blocTest<ResetPasswordBloc, ResetPasswordState>(
        "emits [ResetPasswordLoading, ResetPasswordError] when invalid password",
        build: () {
          final bloc = ResetPasswordBloc();
          when(repository.resetPassword(
              request.email, request.password))
              .thenAnswer((_)async=>null);
          return bloc;
        },
        act: (bloc) =>
            bloc.add(ResetPassword(email: request.email, password: "")),
        expect: () => [isA<ResetPasswordLoading>(), isA<ResetPasswordError>()]);
  });
}