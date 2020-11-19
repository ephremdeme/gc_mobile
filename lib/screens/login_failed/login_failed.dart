import 'package:flutter/material.dart';

import 'components/body.dart';

class LoginFailedScreen extends StatelessWidget {
  static String routeName = "/login_failed";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Login Failed"),
      ),
      body: Body(),
    );
  }
}