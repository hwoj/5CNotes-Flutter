import 'package:flutter/material.dart';


/// Creates application that will host the signup page.
/// 
/// The Signup application will have email, password, 
/// and confirm password textbox.  The user will press a 
/// button to submit these fields to the app, and then it will 
/// redirect the user to an email verification page.
class SignUp extends StatelessWidget {
  /// Creates the App that will host the signup page.
  /// 
  /// params: [BuildContext] context
  /// returns: [MaterialApp] widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }

}
/// Creates an object instance of the Signup page.
class SignUpPage extends StatefulWidget {

}
/// Monitors the state of the Signup page.
///  
/// Keeps track of information passed into the 
/// email, password, and confirm password textbox.
class _SignUpPageState extends State<SignUpPage> {

  /// creates the structure/layout of the page.  This will include a
  /// email, password, and confirm password text box, and a button to 
  /// submit the entered fields.
  /// 
  /// params: [BuildContext] context
  /// returns: [Scaffold] widget
  @override
  Widget build(BuildContext context) {

  }

  /// Removes the email, password, and confirm password 
  /// after the user exits the signup page
  @override
  void dispose() {

  }

}
