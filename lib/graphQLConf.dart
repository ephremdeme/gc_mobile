import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String serverLink = 'http://10.240.72.57:5001/';

final HttpLink _httpLink = HttpLink(
  uri: serverLink + 'graphql',
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

ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: InMemoryCache(),
      link: _link,
    ),
  );