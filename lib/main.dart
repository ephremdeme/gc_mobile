import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/routes.dart';
import 'package:flutter_native_interaction/screens/ar_view.dart';
import 'package:flutter_native_interaction/screens/splash/splash_screen.dart';
import 'package:flutter_native_interaction/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AR assisted E-commerce',
      theme: theme(),
      // home: SplashScreen(),
      // initialRoute: SplashScreen.routeName,
      initialRoute: ArPage.routeName,
      routes: routes,
    );
  }
}

