import 'package:fivec_notes/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  // test light and dark mode

  // test change password button

  // test saving files to local device 

  testWidgets("Settings Test", (tester) async {
    await tester.pumpWidget(SettingsScreen());
  }
  );
  

}