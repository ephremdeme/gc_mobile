import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/size_config.dart';

import 'components/body.dart';

class OnboardingScreen extends StatelessWidget {
  static String routeName = "/onboarding";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}