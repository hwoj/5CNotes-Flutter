
import 'package:flutter/material.dart';

/// creates instance of an email verification page.
class EmailVerificationScreen extends StatefulWidget {
  // override createState method by making it instantiate an 
  // _Email VerificationState instance.

}

/// Creates the email verification page layout/features
class _EmailVerificationState extends State<EmailVerificationScreen> {

  // Instantiate text editing controller for the email verification text box. 

  /// Creates the structure/layout fo the Email verification page.
  /// It should create a text box that will take the verification code.
  /// as input.
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