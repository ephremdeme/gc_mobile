import 'package:flutter/widgets.dart';
import 'package:flutter_native_interaction/screens/ar_view.dart';
import 'package:flutter_native_interaction/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter_native_interaction/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_native_interaction/screens/login_success/login_success_screen.dart';
import 'package:flutter_native_interaction/screens/otp/otp_screen.dart';
import 'package:flutter_native_interaction/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_native_interaction/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_native_interaction/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  ArPage.routeName: (context) => ArPage(),
};
