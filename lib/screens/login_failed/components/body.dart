import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/components/default_button.dart';
import 'package:flutter_native_interaction/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_native_interaction/size_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Body extends StatelessWidget {
  final List<GraphQLError> errors;
  Body({this.errors});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Center(
          child: Text(
            errors.toString(),
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Go Back",
            press: () {
              Navigator.popAndPushNamed(context, SignInScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
