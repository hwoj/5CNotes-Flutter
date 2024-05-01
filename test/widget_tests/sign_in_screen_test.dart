import 'package:fivec_notes/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {

  // test initially empty controllers 

  // test password and confirm password texts are the same

  testWidgets("Sign in Test", (tester) async {
    await tester.pumpWidget(SignupScreen());

  }
  );




}