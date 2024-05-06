import 'package:fivec_notes/main.dart';
import 'package:fivec_notes/screens/email_verification_screen.dart';
import 'package:flutter/material.dart';

/// The [SignupScreen] is a [StatefulWidget] that will handle all UI elements and interactions for signing up a [User]
/// 
/// This screen will be stateful so that it can handle the changes to the data that the user is inputting and update accordingly
class SignupScreen extends StatefulWidget {
  /// Create new instance of a _SingUpPageState
  @override
  State<SignupScreen> createState() => SignUpScreenState();
}

/// Monitors the state of the Signup page.
///  
/// Keeps track of information passed into the 
/// email, password, and confirm password textbox.
class SignUpScreenState extends State<SignupScreen> {

  /// create text editing controllers for the email, password, 
  /// and confirm password fields.
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200.0, vertical: 15.0),
              child: TextField(
                key: const Key("Register email"),
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200.0, vertical: 15.0),
              child: TextField(
                key: const Key("Register password"),
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 200.0, vertical: 15.0),
              child: TextField(
                key: const Key("Confirm password"),
                controller: confirmPasswordController,
                decoration: const InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
              ),
            ),
            const SizedBox(height: 30.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      color: Theme.of(context).appColors.primaryButton,
                      ),
                    ),
                  TextButton(
                    key: const Key("Signup button"),
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 15),
                      foregroundColor: Theme.of(context).appColors.primaryButton,
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20)
                    ),
                    onPressed: () {
                      // Add signup logic here
                      String email = emailController.text;
                      String password = passwordController.text;
                      String confirmPassword = confirmPasswordController.text;
                      if (password == "" || confirmPassword == "" || email == "") {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            key: const Key("Empty field"),
                            title: const Text('Error'),
                            content: const Text('Please enter the relevant information in the empty fields'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else if (password == confirmPassword) {
                        Navigator.pushNamedAndRemoveUntil(context, "/email_verification", ModalRoute.withName("/email_verification"));
                        // Implement signup logic here
                      } else {
                        // Passwords don't match, show an error message
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            key: const Key("Non-matching passwords"),
                            title: const Text('Error'),
                            content: const Text('Passwords do not match.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Theme.of(context).appColors.primaryButtonText
                ),
              ),
            ),
                ]
              )
            ),
          ],
        ),
      ),
    );
  }

  /// Removes the email, password, and confirm password 
  /// after the user exits the signup page
  @override
  void dispose() {

    /// call the dispose method on all three text editing controllers
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}