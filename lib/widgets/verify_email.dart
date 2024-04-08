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
  // override createState method by making it instantiate an 
  // _Email VerificationState instance.

}

/// Creates the email verification page layout/features
class _EmailVerificationState extends State<EmailVerificationPage> {

  // Instantiate text editing controller for the email verification text box. 

  /// Creates the structure/layout fo the Email verification page.
  /// It should create a text box that will take the verification code.
  /// as input.
  /// 
  /// params: [BuildContext] context
  /// returns: [Scaffold] widget
  @override
  Widget build(BuildContext context) {
    /// Use [Padding] widget for body parameter.
    /// Define its child to be [Column] widget.
    /// Define the children of the [Column] widget 
    /// to be the text controller.
    /// Instantiate an [ElevatedButton] button
    /// to enter the code, navigate to a new page if correct,
    /// else, prompt error message.
    return Scaffold();
  }

  /// Removes controller for each verification code text box.
  void dispose() {   
  }
  
}
