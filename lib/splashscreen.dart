import 'package:firstfirebase/restaurantpage.dart';
import 'package:flutter/material.dart';
import 'package:firstfirebase/onboardingscreen.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  void navigationToNextPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => RestaurantsPage()));
    // Navigator.pushReplacement(context, '/OnBoarding');
  }

// duration function
  startSplashScreenTimer() async {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, navigationToNextPage);
  }

// function call when object inserted
  @override
  void initState() {
    super.initState();
    //start timer
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // splashscreen image
        child: new Image.asset('assets/splash.png', fit: BoxFit.fill));
  }
}
