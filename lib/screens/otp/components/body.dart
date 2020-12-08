import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/screens/home/home_screen.dart';
import 'package:flutter_native_interaction/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_interaction/screens/login_success/login_success_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
  Future<void> signUpUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    // String phoneNo = "+251" + phone.toString();
    // print(phoneNo);
    _auth.verifyPhoneNumber(
        phoneNumber: "+251920565749",// phoneNo,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.popAndPushNamed(context, LoginSuccessScreen.routeName);
          print("success");
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception);
          return "error";
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          final _codeController = TextEditingController();
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Enter the code"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("Confirm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationId, smsCode: code);

                        _auth.signInWithCredential(credential).then((value) {
                          Navigator.popAndPushNamed(
                              context, HomeScreen.routeName);
                        }).catchError((e) {
                          return "error";
                        });
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationId = verificationId;
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Center(
          child: GestureDetector(
            child: Text("Enter code"),
            onTap: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              String phone = sharedPreferences.getString("phone");
              signUpUser(phone, context);
            },
          ),
        ),
      ),
    );
  }
}
