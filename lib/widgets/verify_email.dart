import 'package:flutter/material.dart';

/// Once the the user signs up or decides to change their password,
/// the app will redirect them to the email verification page.
/// The user will enter a six-digit code that should match with 
class EmailVerification extends StatelessWidget {
  /// Creates the widget for the Email verification app
  /// 
  /// params: [BuildContext] context
  /// returns: [MaterialApp] widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp();

  }
}


/// creates instance of an email verification page.
class EmailVerificationPage extends StatefulWidget {

}

/// Creates the email verification page layout/features
class EmailVerificationState extends State<EmailVerificationPage> {
  /// Creates the structure/layout fo the Email verification page.
  /// It should create six text boxes that each take one digit for the 
  /// verification code.
  /// 
  /// params: [BuildContext] context
  /// returns: [Scaffold] widget
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  /// Removes controllers for each single-digit text box.
  void dispose() {   
  }
  
}
