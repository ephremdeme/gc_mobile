import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/graphQLConf.dart';
import 'package:flutter_native_interaction/providers/cart.dart';
import 'package:flutter_native_interaction/routes.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_native_interaction/screens/home/home_screen.dart';
// import 'package:flutter_native_interaction/screens/ar_view.dart';
// import 'package:flutter_native_interaction/screens/onboarding_screen/onboarding_screen.dart';
import 'package:flutter_native_interaction/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_native_interaction/theme.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: ChangeNotifierProvider.value(
          value: Cart(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'AR assisted E-commerce',
            theme: theme(),
            // home: SplashScreen(),
            // initialRoute: checkFirst() == true ? OnboardingScreen.routeName
            //     : SignInScreen.routeName,
            initialRoute: SignInScreen.routeName,
            routes: routes,
          ),
        ),
      ),
    );
  }

  // checks if the app is opening for the first time
  Future<bool> checkFirst() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String check = sharedPreferences.getString("first");
    if(check == null)
      return true;
    return false;
  }
}

