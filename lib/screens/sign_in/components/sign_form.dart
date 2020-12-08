import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/components/custom_suffix_icon.dart';
import 'package:flutter_native_interaction/components/form_error.dart';
import 'package:flutter_native_interaction/models/AuthData.dart';
// import 'package:flutter_native_interaction/models/User.dart';
import 'package:flutter_native_interaction/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_native_interaction/screens/login_failed/login_failed.dart';
import 'package:flutter_native_interaction/screens/login_success/login_success_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../graphql/mutations/login.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String phone;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildPhoneFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          Mutation(
              options: MutationOptions(
                documentNode: gql(login),
                update: (Cache cache, QueryResult result) {
                  return cache;
                },
                onCompleted: (dynamic resultData) async {
                  if (resultData != null) {
                    AuthData authData = AuthData.fromJson(resultData);
                    // User user = authData.login.user;
                    // print(user.phone + " " + user.id.toString());
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.setString(
                        "token",  "Bearer " + authData.login.token);
                    print(sharedPreferences.getString('token'));
                    Navigator.popAndPushNamed(
                      context, LoginSuccessScreen.routeName);
                  } 
                },
                onError: (OperationException exception) {
                  addError(error: exception.graphqlErrors.toString());
                  Navigator.popAndPushNamed(
                    context,
                    LoginFailedScreen.routeName,
                    arguments: exception.graphqlErrors,
                  );
                }),
              builder: (
                RunMutation runMutation,
                QueryResult result,
              ) {
                return DefaultButton(
                  text: "Continue",
                  press: () async {
                    if (_formKey.currentState.validate()) {
                      //////////////////////////// Todo
                      _formKey.currentState.save();
                      runMutation({
                        "phone": phone,
                        "password": password,
                      });
                    }
                  },
                );
              }),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 6) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 6) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPhoneFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phone = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "phone",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.phone_android),
      ),
    );
  }
}


