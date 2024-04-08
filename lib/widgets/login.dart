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
    /// The [MaterialApp] widget will have three parameters:
    /// The page title: [String]
    /// page theme: [ThemeData]
    /// home page: [LoginPage]
    // Within the theme data, one can specify the color.
    // Home page sets the default page for the login screen as a
    // [LoginPage] widget
    return MaterialApp();
  }
}

/// Creates an widget instance of a login page
class LoginPage extends StatefulWidget {
  // Overload createState() method to return an instance
  // of a [_LoginPageState]
}

/// Stores the various states of a login page
/// In this case, it refers to the information typed
/// in the email and password fields. 
class _LoginPageState extends State<LoginPage> {

  // Initialize username and password text editing controller 
  // to take the user input.

  /// Takes the information of the parent widget and 
  /// return a [Scaffold], which defines the structure, layout,
  /// color of the login page features
  ///
  /// params: [BuildContext] context
  /// returns: [Scaffold] widget
  /// 
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