import 'package:mechalodon_mobile/modules/login/models/user_model.dart';
import 'package:mechalodon_mobile/services/graphql_service.dart';
import 'package:mechalodon_mobile/services/injectable.dart';

class LoginRepository {
  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    var user = User(email, "sdfsdkj", password);
    await Future.delayed(const Duration(seconds: 3));
    return Future.value(user);
  }

  String getUserDataQuery() {
    return r'''
      User{
        name
        address
        email
        subscription
      }
      ''';
  }

  Future<User?> login(String email, String password) async {
    GraphQLService qlService = serviceLocator<GraphQLService>();
    final query = getUserDataQuery();
    final userCredentials = {'email': email, 'password': password};

    try {
      final result = await qlService.query(query, variables: userCredentials);

      if (result.hasException) {
        print('graphQLErrors: ${result.exception?.graphqlErrors.toString()}');
        print('clientErrors: ${result.exception?.linkException.toString()}');
        return null;
      } else {
        if (result.data != null) {
          User.fromJson(result.data!);
        } else {
          return null;
        }
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
