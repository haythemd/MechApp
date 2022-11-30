import 'package:graphql/client.dart';

class GraphQLService {
  GraphQLClient _client;

  GraphQLService()
      : _client = GraphQLClient(
            link: HttpLink('https://mechalodonapi.com/graphql/'),
            cache: GraphQLCache());

  Future<QueryResult> query(String query,
      {Map<String, dynamic>? variables}) async {
    QueryOptions options =
        QueryOptions(document: gql(query), variables: variables ?? {});

    final result = await _client.query(options);

    return result;
  }

  Future<QueryResult> mutation(String query,
      {Map<String, dynamic>? variables}) async {
    MutationOptions options =
        MutationOptions(document: gql(query), variables: variables ?? {});

    final result = await _client.mutate(options);

    return result;
  }
}
