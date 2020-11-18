import 'package:graphql/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

final HttpLink _httpLink = HttpLink(
  uri: 'https://engu-api.herokuapp.com/graphql',
);

SharedPreferences sharedPreferences;

Future<String> getToken() async {
  sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString("token");
}

final AuthLink _authLink = AuthLink(
  getToken: () async => getToken(),
);

final Link _link = _authLink.concat(_httpLink);

final GraphQLClient _client = GraphQLClient(
  cache: InMemoryCache(),
  link: _link,
);
