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
/// Creates an widget instance of the Signup page.
class SignUpPage extends StatefulWidget {
  /// Create new instance of a _SingUpPageState
}
/// Monitors the state of the Signup page.
///  
/// Keeps track of information passed into the 
/// email, password, and confirm password textbox.
class _SignUpPageState extends State<SignUpPage> {

  /// create text editing controllers for the email, password, 
  /// and confirm password fields.

  /// creates the structure/layout of the page.  This will include a
  /// email, password, and confirm password text box, and a button to 
  /// submit the entered fields.
  /// 
  /// params: [BuildContext] context
  /// returns: [Scaffold] widget
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
    /// to navigate the user to the email verification page if the password confirmation
    /// matches the original password, if not, prompt the user to type the input again.
    return Scaffold();
  }

  /// Removes the email, password, and confirm password 
  /// after the user exits the signup page
  @override
  void dispose() {

    /// call the dispose method on all three text editing controllers

  }

}
