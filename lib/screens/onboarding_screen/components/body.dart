import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/screens/sign_in/sign_in_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IntroductionScreen(
        pages: getPages(),
        onDone: () async {
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString("first", "opened");
          Navigator.popAndPushNamed(context, SignInScreen.routeName);
        },
        onSkip: () {
          Navigator.popAndPushNamed(context, SignInScreen.routeName);
        },
        showSkipButton: true,
        skip: Text("skip", style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(Icons.navigate_next_rounded),
        done: const Text("Let's Go!", style: TextStyle(fontWeight: FontWeight.w600)),
        globalBackgroundColor: Colors.white,
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.orangeAccent,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Image.asset("assets/images/splash_1.png"),
          title: 'First Title',
          body: 'First Title First Title First Title First Title First Title',
          footer: Text('GC Project')),
      PageViewModel(
          image: Image.asset("assets/images/splash_2.png"),
          title: 'Second Title',
          body: 'Second Title Second Title Second Title Second Title Second Title',
          footer: Text('GC Project')),
      PageViewModel(
          image: Image.asset("assets/images/splash_3.png"),
          title: 'Third Title',
          body: 'Third Title Third Title Third Title Third Title Third Title',
          footer: Text('GC Project')),
    ];
  }
}
