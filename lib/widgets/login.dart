import 'package:flutter/material.dart';

  /// Creates the page application for users logging in
  /// This will include two textboxes: one to enter the user email
  /// and the other to enter the password.  There is a button that will 
  /// redirect them if their login information is correct or prompt a message 
  /// for incorrect email/password

class LoginApp extends StatelessWidget {
  /// Creates the Login application by taking the 
  /// contents of the page layout and returns the 
  /// contents of the Login page
  /// 
  /// params: [BuildContext] context
  /// retuns: [MaterialApp] widget
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

/// Creates an widget instance of a login page
class LoginPage extends StatefulWidget {

}

/// Stores the various states of a login page
/// In this case, it refers to the information typed
/// in the email and password fields. 
class _LoginPageState extends State<LoginPage> {

  /// Takes the information of the parent widget and 
  /// return a [Scaffold], which defines the structure, layout,
  /// color of the login page features
  ///
  /// params: [BuildContext] context
  /// returns: [Scaffold] widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(); 
  }
  /// Remove the password and email controller once one exits 
  /// the login page
  @override
  void dispose() {
  }

}