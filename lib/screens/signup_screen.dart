import 'package:flutter/material.dart';

/// The [SignupScreen] is a [StatefulWidget] that will handle all UI elements and interactions for signing up a [User]
/// 
/// This screen will be stateful so that it can handle the changes to the data that the user is inputting and update accordingly
class SignupScreen extends StatefulWidget {
  /// Create new instance of a _SingUpPageState
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

/// Monitors the state of the Signup page.
///  
/// Keeps track of information passed into the 
/// email, password, and confirm password textbox.
class _SignUpPageState extends State<SignupScreen> {

  /// create text editing controllers for the email, password, 
  /// and confirm password fields.

  /// creates the structure/layout of the page.  This will include a
  /// email, password, and confirm password text box, and a button to 
  /// submit the entered fields.
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