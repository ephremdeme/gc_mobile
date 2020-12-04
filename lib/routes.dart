import 'package:flutter/widgets.dart';
import 'package:flutter_native_interaction/screens/ar_view.dart';
import 'package:flutter_native_interaction/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter_native_interaction/screens/cart/cart_screen.dart';
import 'package:flutter_native_interaction/screens/details/details_screen.dart';
import 'package:flutter_native_interaction/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_native_interaction/screens/home/home_screen.dart';
import 'package:flutter_native_interaction/screens/login_failed/login_failed.dart';
import 'package:flutter_native_interaction/screens/login_success/login_success_screen.dart';
import 'package:flutter_native_interaction/screens/onboarding_screen/onboarding_screen.dart';
import 'package:flutter_native_interaction/screens/otp/otp_screen.dart';
import 'package:flutter_native_interaction/screens/see_more/see_more.dart';
import 'package:flutter_native_interaction/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_native_interaction/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_native_interaction/screens/home/category_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  ArPage.routeName: (context) => ArPage(),
  CartScreen.routeName: (context) => CartScreen(),
  LoginFailedScreen.routeName: (context) => LoginFailedScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CategoryScreen.routeName: (context) => CategoryScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  OnboardingScreen.routeName: (context) => OnboardingScreen(),
  SeeMore.routeName: (context) => SeeMore(),
};
