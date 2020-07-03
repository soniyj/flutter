import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class EvjaClient {

  GraphQLClient _client;

  void init() {
    final HttpLink _httpLink = HttpLink(
      // uri: 'https://api.github.com/graphql',
      uri: 'http://localhost:8080/query'
    );

    // final AuthLink _authLink = AuthLink(
    //  getToken: () async => 'Bearer $YOUR_PERSONAL_ACCESS_TOKEN',
    // );

    // final AuthLink _authLink = AuthLink();
    // final Link _link = _authLink.concat(_httpLink);
    final Link _link = _httpLink.concat(_httpLink);

    //flutter
    ValueNotifier<GraphQLClient> clientFlutter = ValueNotifier(
      GraphQLClient(
        cache: InMemoryCache(),
        link: _link,
      ),
    );

    //dart
    final GraphQLClient clientDart = GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
    );

    this._client = clientDart;
  } // Init()

  Future simpleQuery() async {
    const String query = r'''
      query {
        sensors {
          id
        }
      }
    ''';

    final QueryOptions options = QueryOptions(
      documentNode: gql(query),
      // variables: <String, dynamic>{
      //   'nRepositories': nRepositories,
      // },
    );
    
    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      print(result.exception.toString());
    }

    print(result.data);

    final List<dynamic> sensors =
      result.data['sensors'] as List<dynamic>;

    print(sensors);

    return sensors;
  } // SimpleQuery

  // simpleQuery2() {
  //   Query(
  //     options: QueryOptions(
  //       documentNode: gql(query),
  //     ),
  //     builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }) {
  //       if (result.hasException) {
  //         return Text(result.exception.toString());
  //       }
  //       if (result.loading) {
  //         return Text('Loading');
  //       }
  //     },
  //   );
  // }

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
  } // queryDart

} // EvjaClient
