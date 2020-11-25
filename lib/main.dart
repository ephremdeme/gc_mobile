import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/graphQLConf.dart';
import 'package:flutter_native_interaction/routes.dart';
import 'package:flutter_native_interaction/screens/home/home_screen.dart';
// import 'package:flutter_native_interaction/screens/ar_view.dart';
// import 'package:flutter_native_interaction/screens/sign_in/sign_in_screen.dart';
// import 'package:flutter_native_interaction/screens/splash/splash_screen.dart';
import 'package:flutter_native_interaction/theme.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AR assisted E-commerce',
          theme: theme(),
          // home: SplashScreen(),
          // initialRoute: SplashScreen.routeName,
          initialRoute: HomeScreen.routeName,
          routes: routes,
        ),
      ),
    );
  }
}

