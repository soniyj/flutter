import 'package:graphql/client.dart';

int calculate() {
  return 6 * 7;
}

void testGraphQL() {
  final _httpLink = HttpLink(
    // uri: 'https://api.github.com/graphql',
    uri: 'http://localhost:8080/graphql',
  );

  // final AuthLink _authLink = AuthLink(
  //   getToken: () async => 'Bearer $YOUR_PERSONAL_ACCESS_TOKEN',
  // );

  // final Link _link = _authLink.concat(_httpLink);
  final Link _link = _httpLink;

  final _client = GraphQLClient(
    cache: InMemoryCache(),
    link: _link,
  );

  print(_client);

  mutation(_client);
}

/*
 mutation CreateReviewForEpisode($ep: Episode!, $review: ReviewInput!) {
  createReview(episode: $ep, review: $review) {
    stars
    commentary
  }
}
 */

void mutation(GraphQLClient _client) async {
  const addStar = r'''
  mutation AddFilm($id: ID!, $name: String!) {
    action: addFilm(input: {id: $id, name: $name}) {
      name
    }
  }
  ''';

  final repositoryID = 'marco';

  final options = MutationOptions(
    documentNode: gql(addStar),
    variables: <String, dynamic>{
      'name': repositoryID,
    },
  );

  final result = await _client.mutate(options);

  if (result.hasException) {
    print(result.exception.toString());
    return;
  }

  final isStarred = result.data['action']['starrable']['viewerHasStarred'] as bool;

  if (isStarred) {
    print('Thanks for your star!');
    return;
  }
}

void query(GraphQLClient _client) {}

/*
final HttpLink _httpLink = HttpLink(
    uri: 'https://api.github.com/graphql',
  );

  // final AuthLink _authLink = AuthLink(
  //   getToken: () async => 'Bearer $YOUR_PERSONAL_ACCESS_TOKEN',
  // );

  // final Link _link = _authLink.concat(_httpLink);
  final Link _link = _httpLink;

  final GraphQLClient _client = GraphQLClient(
    cache: InMemoryCache(),
    link: _link,
  );
*/
