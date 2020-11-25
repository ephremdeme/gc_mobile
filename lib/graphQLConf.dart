import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

final HttpLink _httpLink = HttpLink(
  uri: 'http://192.168.137.104:5001/graphql',
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