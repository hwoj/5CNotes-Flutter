import 'package:flutter/material.dart';

/// The [SignupScreen] is a [StatefulWidget] that will handle all UI elements and interactions for signing up a [User]
/// 
/// This screen will be stateful so that it can handle the changes to the data that the user is inputting and update accordingly
class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

/// This state of the [SignupScreen] will handle the main signup logic
/// 
/// This state will deal with validating that user info is valid data that fits the constraints and will visually update to meet this
class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}