import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/components/default_button.dart';
// import 'package:flutter_native_interaction/screens/ar_view.dart';
import 'package:flutter_native_interaction/screens/home/home_screen.dart';
import 'package:flutter_native_interaction/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () {
              Navigator.popAndPushNamed(context, HomeScreen.routeName);
              // Navigator.popAndPushNamed(context, ArPage.routeName,);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
