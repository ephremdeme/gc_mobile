import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/screens/home/home_screen.dart';
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
          Navigator.popAndPushNamed(context, HomeScreen.routeName);
        },
        onSkip: () {
          Navigator.popAndPushNamed(context, HomeScreen.routeName);
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
          title: 'Hello there',
          body: 'Welcome to AR Assisted Ecommerce, Let’s shop!',
      ),
      PageViewModel(
          image: Image.asset("assets/images/splash_2.png"),
          title: 'What we do?',
          body: 'We help buyers connect with sellers \naround Ethiopia',
      ),
      PageViewModel(
          image: Image.asset("assets/images/splash_3.png"),
          title: 'Augmented Reality for your shop',
          body: 'We upgrade your shopping exeperience \n by adding AR to your product view',
      ),
    ];
  }
}
