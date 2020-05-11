import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class EvjaClient {

  void init() {
    final HttpLink _httpLink = HttpLink(
      // uri: 'https://api.github.com/graphql',
      uri: 'http://localhost:8080/query'
    );

    //   final AuthLink _authLink = AuthLink(
    //     getToken: () async => 'Bearer $YOUR_PERSONAL_ACCESS_TOKEN',
    // );

    // final AuthLink _authLink = AuthLink();
    // final Link _link = _authLink.concat(_httpLink);
    final Link _link = _httpLink.concat(_httpLink);

    //flutter
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: _link,
      ),
    );

    //dart
    final GraphQLClient _client = GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
    );
  }

  //https://pub.dev/packages/graphql#-readme-tab-
  queryDart(GraphQLClient _client) async {
    const String readRepositories = r'''
      query ReadRepositories($nRepositories: Int!) {
        viewer {
          repositories(last: $nRepositories) {
            nodes {
              __typename
              id
              name
              viewerHasStarred
            }
          }
        }
      }
    ''';

    const int nRepositories = 50;

    final QueryOptions options = QueryOptions(
        documentNode: gql(readRepositories),
        variables: <String, dynamic>{
            'nRepositories': nRepositories,
        },
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
        print(result.exception.toString());
    }

    final List<dynamic> repositories =
        result.data['viewer']['repositories']['nodes'] as List<dynamic>;
    
    print(repositories);
  }

} // EvjaClient
