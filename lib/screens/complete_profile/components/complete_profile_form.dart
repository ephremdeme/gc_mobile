import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/components/custom_suffix_icon.dart';
import 'package:flutter_native_interaction/components/default_button.dart';
import 'package:flutter_native_interaction/components/form_error.dart';
import 'package:flutter_native_interaction/models/AuthDataSignUp.dart';
import 'package:flutter_native_interaction/screens/login_failed/login_failed.dart';
import 'package:flutter_native_interaction/screens/login_success/login_success_screen.dart';
import 'package:flutter_native_interaction/screens/otp/otp_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../graphql/mutations/sign_up.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phone;

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
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          Mutation(
              options: MutationOptions(
                  documentNode: gql(signUp),
                  update: (Cache cache, QueryResult result) {
                    return cache;
                  },
                  onCompleted: (dynamic resultData) async {
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    print(resultData);
                    if (resultData != null) {
                      AuthDataSignUp authData =
                          AuthDataSignUp.fromJson(resultData);
                      sharedPreferences.setString(
                          "token", "Bearer " + authData.signUp.token);
                      // print(sharedPreferences.getString('token'));
                    }
                    // Navigator.pushNamed(context, OtpScreen.routeName);
                    Navigator.popAndPushNamed(
                        context, LoginSuccessScreen.routeName);
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
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    String tempuser = sharedPreferences.getString("userName");
                    String temppass = sharedPreferences.getString("password");
                    await sharedPreferences.setString("phone", phone);
                    // print(phone); //temppass + " " + tempuser + " " + 
                    if (_formKey.currentState.validate()) {
                      //////////////////////////// Todo
                      _formKey.currentState.save();
                      runMutation({
                        "username": tempuser,
                        "password": temppass,
                        "phone": phone,
                        "first_name": firstName,
                        "last_name": lastName,
                      });
                    }
                  },
                );
              }),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phone = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
