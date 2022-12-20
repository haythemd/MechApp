import 'package:mechalodon_mobile/modules/reset_password/confirmation_screen/bloc/reset_password_code_bloc.dart';
import 'package:mechalodon_mobile/modules/reset_password/confirmation_screen/repository/reset_password_code_repository.dart';
import 'package:mechalodon_mobile/modules/login/bloc/login_bloc.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

import 'confirm_code_test.mocks.dart';

@GenerateMocks([ConfirmationCodeRepository])
void main() async {
  final code = "2536";
  final repository = MockConfirmationCodeRepository();

  setUpAll(() {
    serviceLocator.registerFactory<ConfirmationCodeRepository>(() => repository);
  });

  group("ConfirmCodeBloc", () {
    test('initial state is ConfirmCodeInitial ', () {
      expect(ConfirmationCodeBloc().state, isA<ConfirmationCodeInitial>());
    });
    blocTest<ConfirmationCodeBloc, ConfirmationCodeState>(
        "emits [ConfirmationCodeLoading, ConfirmationCodeSuccess] when valid code is entered",
        build: () {
          final bloc = ConfirmationCodeBloc();
          when(repository.confirmCode(
              code))
              .thenAnswer((_) async => true);
          return bloc;
        },
        act: (bloc) =>
            bloc.add(ConfirmCode(code: code)),
        expect: () => [isA<ConfirmationCodeLoading>(), isA<ConfirmationCodeSuccess>()]);

    blocTest<ConfirmationCodeBloc, ConfirmationCodeState>(
        "emits [ConfirmationCodeLoading, ConfirmationCodeError] when invalid code is entered",
        build: () {
          final bloc = ConfirmationCodeBloc();
          when(repository.confirmCode(code))
              .thenAnswer((_) async => false);
          return bloc;
        },
        act: (bloc) =>
            bloc.add(ConfirmCode(code: code)),
        expect: () => [isA<ConfirmationCodeLoading>(), isA<ConfirmationCodeError>()]);
  });
}
