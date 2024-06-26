import 'dart:async';

import 'package:fivec_notes/screens/login_screen.dart';
import 'package:flutter/material.dart';


/// Starts a splash screen upon open the app
/// 
/// discarded because it went against the project requirements.
class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: AssetImage("assets/5cnotes-logo.png"))
      ),
    );
  }
}