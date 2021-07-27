import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firstfirebase/splashscreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EHGZLI',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      // start splashscreen
      home: new SplashPage(),
      // routes: <String, WidgetBuilder>{
      // '/OnBoarding': (BuildContext context) => new OnBoardingScreen()
      //},
    );
  }
}
