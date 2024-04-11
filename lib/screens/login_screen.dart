import 'package:flutter/material.dart';

/// The [LoginScreen] widget is a [StatefulWidget] that is responsible for the application login processes
/// 
/// This screen will validate user input and update accordingly while communicating with the REST API
class LoginScreen extends StatefulWidget {

  // Overload createState() method to return an instance
  // of a [_LoginPageState]
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

/// Stores the various states of a login page
/// In this case, it refers to the information typed
/// in the email and password fields. 
class _LoginScreenState extends State<LoginScreen> {

  // Initialize username and password text editing controller 
  // to take the user input.

  /// Takes the information of the parent widget and 
  /// return a [Scaffold], which defines the structure, layout,
  /// color of the login page features
  @override
  Widget build(BuildContext context) {
    /// The [Scaffold] widget takes in two parameters:
    /// appBar and body
    /// Define and [AppBar] widget to label the title for the appBar
    /// Define a [Padding] widget for the body.
    /// The [Padding] widget will have subfields that will define the 
    /// structure of the UI.
    /// Use EdgeInsets.all() to define margin offsets.
    /// Define a [Column] field for the child field:
    /// The [Column] widget will have two textfields and a button 
    /// defined for its children.  
    /// Use the onPressed() function and use Navigation.of(context).push
    /// to navigate the user to the main page if their password is correct.
    /// Else, Tell them that their password is incorrect.
    return Scaffold(); 
  }
  /// Remove the password and email controller once one exits 
  /// the login page
  @override
  void dispose() {
    // Call the dispose method on the username and password
    // text editing controller.
  }

}