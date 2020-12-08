import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/graphQLConf.dart';
// import 'package:flutter_native_interaction/models/signUp.dart';
import 'package:flutter_native_interaction/providers/rate.dart';
import 'package:flutter_native_interaction/providers/auth.dart';
import 'package:flutter_native_interaction/providers/cart.dart';
import 'package:flutter_native_interaction/routes.dart';
import 'package:flutter_native_interaction/screens/home/home_screen.dart';
// import 'package:flutter_native_interaction/screens/complete_profile/complete_profile_screen.dart';
// import 'package:flutter_native_interaction/screens/complete_profile/components/complete_profile_form.dart';
import 'package:flutter_native_interaction/screens/onboarding_screen/onboarding_screen.dart';
import 'package:flutter_native_interaction/screens/sign_up/sign_up_screen.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_native_interaction/screens/home/home_screen.dart';
import 'package:flutter_native_interaction/theme.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  initScreen = sharedPreferences.getInt('initScreen');
  await sharedPreferences.setInt('initScreen', 1);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: Auth(),
            ),
            ChangeNotifierProvider.value(value: Cart()),
            ChangeNotifierProvider.value(value: RateProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'AR assisted E-commerce',
            theme: theme(),
            initialRoute: initScreen == 0 || initScreen == null ? OnboardingScreen.routeName
                : HomeScreen.routeName,
            routes: routes,
          ),
        ),
      ),
    );
  }
}
