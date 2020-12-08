import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'components/body.dart';

class LoginFailedScreen extends StatelessWidget {
  static String routeName = "/login_failed";

  @override
  Widget build(BuildContext context) {
    final List<GraphQLError> errors = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Login Failed"),
      ),
      body: Body(errors: errors),
    );
  }
}